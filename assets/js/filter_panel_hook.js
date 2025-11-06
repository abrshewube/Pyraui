// Filter Panel Hook
export const FilterPanelHook = {
  mounted() {
    this.panel = this.el
    this.content = this.panel.querySelector(".filter-panel-content")
    this.icon = this.panel.querySelector(".filter-panel-icon")
    this.isCollapsed = this.panel.dataset.collapsed === "true"

    if (this.isCollapsed) {
      this.collapse()
    }
  },

  updated() {
    const newCollapsed = this.panel.dataset.collapsed === "true"
    if (newCollapsed !== this.isCollapsed) {
      this.isCollapsed = newCollapsed
      if (this.isCollapsed) {
        this.collapse()
      } else {
        this.expand()
      }
    }
  },

  collapse() {
    if (this.content) {
      this.content.style.display = "none"
    }
    if (this.icon) {
      this.icon.style.transform = "rotate(-90deg)"
    }
  },

  expand() {
    if (this.content) {
      this.content.style.display = "block"
    }
    if (this.icon) {
      this.icon.style.transform = "rotate(0deg)"
    }
  }
}

