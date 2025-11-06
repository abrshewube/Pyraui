// Resizable Panels Hook
export const ResizablePanelsHook = {
  mounted() {
    this.container = this.el
    this.orientation = this.container.dataset.orientation || "horizontal"
    this.panels = Array.from(this.container.querySelectorAll(".resizable-panel"))
    this.resizers = Array.from(this.container.querySelectorAll(".resizer"))
    
    this.resizers.forEach((resizer, index) => {
      resizer.addEventListener("mousedown", (e) => {
        this.startResize(e, index)
      })
    })
  },

  startResize(e, resizerIndex) {
    e.preventDefault()
    this.isResizing = true
    this.resizerIndex = resizerIndex
    this.panel1 = this.panels[resizerIndex]
    this.panel2 = this.panels[resizerIndex + 1]

    const startPos = this.orientation === "horizontal" ? e.clientX : e.clientY
    const panel1Size = this.orientation === "horizontal" 
      ? this.panel1.offsetWidth 
      : this.panel1.offsetHeight

    document.addEventListener("mousemove", this.handleMouseMove = (e) => {
      if (!this.isResizing) return

      const currentPos = this.orientation === "horizontal" ? e.clientX : e.clientY
      const diff = currentPos - startPos
      const newSize = panel1Size + diff

      const minSize = this.orientation === "horizontal"
        ? parseInt(this.panel1.style.minWidth) || 100
        : parseInt(this.panel1.style.minHeight) || 100

      if (newSize >= minSize) {
        if (this.orientation === "horizontal") {
          this.panel1.style.width = `${newSize}px`
          this.panel1.style.flexShrink = "0"
        } else {
          this.panel1.style.height = `${newSize}px`
          this.panel1.style.flexShrink = "0"
        }
      }
    })

    document.addEventListener("mouseup", this.handleMouseUp = () => {
      this.isResizing = false
      document.removeEventListener("mousemove", this.handleMouseMove)
      document.removeEventListener("mouseup", this.handleMouseUp)
    })
  }
}

