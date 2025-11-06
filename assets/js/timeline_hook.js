export const TimelineHook = {
  mounted() {
    this.handleToggle = this.handleToggle.bind(this)
    this.el.addEventListener("click", this.handleToggle)
  },

  destroyed() {
    this.el.removeEventListener("click", this.handleToggle)
  },

  handleToggle(e) {
    const timelineContent = e.target.closest(".timeline-content")
    if (!timelineContent) return

    const childrenId = e.target.getAttribute("phx-value-children-id")
    if (!childrenId) return

    const childrenContainer = document.getElementById(childrenId)
    if (!childrenContainer) return

    const isCollapsible = this.el.dataset.collapsible === "true"
    if (!isCollapsible) return

    // Toggle visibility
    const isHidden = childrenContainer.classList.contains("hidden")
    
    if (isHidden) {
      childrenContainer.classList.remove("hidden")
      // Rotate chevron icon
      const icon = timelineContent.querySelector(".timeline-toggle-icon")
      if (icon) {
        icon.style.transform = "rotate(0deg)"
      }
    } else {
      childrenContainer.classList.add("hidden")
      // Rotate chevron icon
      const icon = timelineContent.querySelector(".timeline-toggle-icon")
      if (icon) {
        icon.style.transform = "rotate(-90deg)"
      }
    }
  }
}

