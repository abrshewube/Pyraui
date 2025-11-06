// Sortable List Hook
export const SortableListHook = {
  mounted() {
    this.list = this.el.querySelector(`#${this.el.id}-list`)
    this.orderInput = this.el.querySelector(`#${this.el.id}-order`)
    this.itemIdKey = this.el.dataset.itemId || "id"
    this.draggedElement = null

    // Make items draggable
    const items = this.list.querySelectorAll(".sortable-item")
    items.forEach((item) => {
      item.addEventListener("dragstart", (e) => {
        this.handleDragStart(e)
      })
      item.addEventListener("dragend", (e) => {
        this.handleDragEnd(e)
      })
      item.addEventListener("dragover", (e) => {
        this.handleDragOver(e)
      })
      item.addEventListener("drop", (e) => {
        this.handleDrop(e)
      })
      item.addEventListener("dragenter", (e) => {
        this.handleDragEnter(e)
      })
      item.addEventListener("dragleave", (e) => {
        this.handleDragLeave(e)
      })
    })
  },

  updated() {
    // Re-attach event listeners after update
    const items = this.list.querySelectorAll(".sortable-item")
    items.forEach((item) => {
      item.addEventListener("dragstart", (e) => {
        this.handleDragStart(e)
      })
      item.addEventListener("dragend", (e) => {
        this.handleDragEnd(e)
      })
      item.addEventListener("dragover", (e) => {
        this.handleDragOver(e)
      })
      item.addEventListener("drop", (e) => {
        this.handleDrop(e)
      })
      item.addEventListener("dragenter", (e) => {
        this.handleDragEnter(e)
      })
      item.addEventListener("dragleave", (e) => {
        this.handleDragLeave(e)
      })
    })
  },

  handleDragStart(e) {
    this.draggedElement = e.target
    e.target.classList.add("opacity-50")
    e.dataTransfer.effectAllowed = "move"
    e.dataTransfer.setData("text/html", e.target.outerHTML)
  },

  handleDragEnd(e) {
    e.target.classList.remove("opacity-50")
    // Remove all drag-over classes
    this.list.querySelectorAll(".sortable-item").forEach((item) => {
      item.classList.remove("border-blue-500", "bg-blue-50")
    })
    this.draggedElement = null
  },

  handleDragOver(e) {
    if (e.preventDefault) {
      e.preventDefault()
    }
    e.dataTransfer.dropEffect = "move"
    return false
  },

  handleDragEnter(e) {
    const target = e.target.closest(".sortable-item")
    if (target && target !== this.draggedElement) {
      target.classList.add("border-blue-500", "bg-blue-50")
    }
  },

  handleDragLeave(e) {
    const target = e.target.closest(".sortable-item")
    if (target) {
      target.classList.remove("border-blue-500", "bg-blue-50")
    }
  },

  handleDrop(e) {
    if (e.stopPropagation) {
      e.stopPropagation()
    }

    const target = e.target.closest(".sortable-item")
    if (target && this.draggedElement && target !== this.draggedElement) {
      // Get the position to insert
      const allItems = Array.from(this.list.querySelectorAll(".sortable-item"))
      const targetIndex = allItems.indexOf(target)
      const draggedIndex = allItems.indexOf(this.draggedElement)

      if (targetIndex > draggedIndex) {
        target.after(this.draggedElement)
      } else {
        target.before(this.draggedElement)
      }

      // Update order input
      this.updateOrder()

      // Dispatch event to LiveView
      this.el.dispatchEvent(
        new CustomEvent("phx-change", {
          bubbles: true,
          detail: {
            order: this.getOrder()
          }
        })
      )

      // Also dispatch a specific event for sortable reorder
      this.el.dispatchEvent(
        new CustomEvent("phx-sortable-reorder", {
          bubbles: true,
          detail: {
            id: this.el.id,
            order: this.getOrder()
          }
        })
      )
    }

    // Remove drag-over classes
    this.list.querySelectorAll(".sortable-item").forEach((item) => {
      item.classList.remove("border-blue-500", "bg-blue-50")
    })

    return false
  },

  updateOrder() {
    const items = Array.from(this.list.querySelectorAll(".sortable-item"))
    const order = items.map((item) => item.dataset.itemId).join(",")
    if (this.orderInput) {
      this.orderInput.value = order
    }
  },

  getOrder() {
    const items = Array.from(this.list.querySelectorAll(".sortable-item"))
    return items.map((item) => item.dataset.itemId)
  }
}

