export const KanbanHook = {
  mounted() {
    this.setupDragAndDrop()
  },

  updated() {
    this.setupDragAndDrop()
  },

  setupDragAndDrop() {
    const board = this.el
    const cards = board.querySelectorAll(".kanban-card")
    const columns = board.querySelectorAll(".kanban-cards")

    // Setup draggable cards
    cards.forEach(card => {
      card.addEventListener("dragstart", this.handleDragStart.bind(this))
      card.addEventListener("dragend", this.handleDragEnd.bind(this))
    })

    // Setup drop zones (columns)
    columns.forEach(column => {
      column.addEventListener("dragover", this.handleDragOver.bind(this))
      column.addEventListener("drop", this.handleDrop.bind(this))
      column.addEventListener("dragenter", this.handleDragEnter.bind(this))
      column.addEventListener("dragleave", this.handleDragLeave.bind(this))
    })
  },

  handleDragStart(e) {
    const card = e.target.closest(".kanban-card")
    if (!card) return

    card.classList.add("opacity-50")
    e.dataTransfer.effectAllowed = "move"
    e.dataTransfer.setData("text/html", card.outerHTML)
    e.dataTransfer.setData("card-id", card.dataset.cardId)
    e.dataTransfer.setData("column-id", card.dataset.columnId)
    
    this.draggedCard = card
  },

  handleDragEnd(e) {
    const card = e.target.closest(".kanban-card")
    if (!card) return

    card.classList.remove("opacity-50")
    
    // Remove drag-over styling from all columns
    const columns = this.el.querySelectorAll(".kanban-cards")
    columns.forEach(col => {
      col.classList.remove("border-blue-500", "border-2", "border-dashed")
    })
  },

  handleDragOver(e) {
    e.preventDefault()
    e.dataTransfer.dropEffect = "move"
  },

  handleDragEnter(e) {
    const column = e.target.closest(".kanban-cards")
    if (!column) return
    
    column.classList.add("border-blue-500", "border-2", "border-dashed", "rounded-lg")
  },

  handleDragLeave(e) {
    const column = e.target.closest(".kanban-cards")
    if (!column) return
    
    // Only remove styling if we're actually leaving the column
    const rect = column.getBoundingClientRect()
    const x = e.clientX
    const y = e.clientY
    
    if (x < rect.left || x > rect.right || y < rect.top || y > rect.bottom) {
      column.classList.remove("border-blue-500", "border-2", "border-dashed")
    }
  },

  handleDrop(e) {
    e.preventDefault()
    
    const column = e.target.closest(".kanban-cards")
    if (!column) return

    const cardId = e.dataTransfer.getData("card-id")
    const sourceColumnId = e.dataTransfer.getData("column-id")
    const targetColumnId = column.dataset.columnId

    // Remove drag-over styling
    column.classList.remove("border-blue-500", "border-2", "border-dashed")

    // Don't do anything if dropped in the same column
    if (sourceColumnId === targetColumnId) return

    const card = this.el.querySelector(`[data-card-id="${cardId}"]`)
    if (!card) return

    // Update card's column data attribute
    card.dataset.columnId = targetColumnId

    // Move card to new column
    column.appendChild(card)

    // Push event to LiveView
    this.pushEvent("kanban-card-moved", {
      card_id: cardId,
      source_column_id: sourceColumnId,
      target_column_id: targetColumnId,
      board_id: this.el.dataset.id
    })
  }
}

