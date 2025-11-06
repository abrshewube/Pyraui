// Keyboard Navigation Hook
export const KeyboardNavigationHook = {
  mounted() {
    this.container = this.el
    this.focusableSelector = this.el.dataset.focusableSelector || 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
    this.focusableElements = []
    this.currentIndex = -1

    this.updateFocusableElements()
    this.setupKeyboardListeners()

    // Update focusable elements when DOM changes
    const observer = new MutationObserver(() => {
      this.updateFocusableElements()
    })
    observer.observe(this.container, { childList: true, subtree: true })
  },

  updated() {
    this.updateFocusableElements()
  },

  updateFocusableElements() {
    this.focusableElements = Array.from(
      this.container.querySelectorAll(this.focusableSelector)
    ).filter(el => !el.disabled && !el.hidden)
  },

  setupKeyboardListeners() {
    this.container.addEventListener("keydown", (e) => {
      switch (e.key) {
        case "ArrowDown":
        case "ArrowRight":
          e.preventDefault()
          this.focusNext()
          break
        case "ArrowUp":
        case "ArrowLeft":
          e.preventDefault()
          this.focusPrevious()
          break
        case "Home":
          e.preventDefault()
          this.focusFirst()
          break
        case "End":
          e.preventDefault()
          this.focusLast()
          break
        case "Escape":
          e.preventDefault()
          this.handleEscape()
          break
      }
    })
  },

  focusNext() {
    if (this.focusableElements.length === 0) return

    this.currentIndex = (this.currentIndex + 1) % this.focusableElements.length
    this.focusableElements[this.currentIndex]?.focus()
  },

  focusPrevious() {
    if (this.focusableElements.length === 0) return

    this.currentIndex = this.currentIndex <= 0
      ? this.focusableElements.length - 1
      : this.currentIndex - 1
    this.focusableElements[this.currentIndex]?.focus()
  },

  focusFirst() {
    if (this.focusableElements.length === 0) return

    this.currentIndex = 0
    this.focusableElements[0]?.focus()
  },

  focusLast() {
    if (this.focusableElements.length === 0) return

    this.currentIndex = this.focusableElements.length - 1
    this.focusableElements[this.currentIndex]?.focus()
  },

  handleEscape() {
    // Dispatch custom event for escape handling
    this.container.dispatchEvent(
      new CustomEvent("keyboard-escape", {
        bubbles: true,
        detail: { element: this.container }
      })
    )
  }
}

