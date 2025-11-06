// Live Feed Hook
export const LiveFeedHook = {
  mounted() {
    this.feedContainer = this.el.querySelector(`#${this.el.id}-feed`)
    this.autoScroll = this.el.dataset.autoScroll === "true"
    this.isUserScrolledUp = false

    // Track user scroll position
    this.feedContainer.addEventListener("scroll", () => {
      const isAtBottom =
        this.feedContainer.scrollHeight - this.feedContainer.scrollTop <=
        this.feedContainer.clientHeight + 50 // 50px threshold

      this.isUserScrolledUp = !isAtBottom
    })

    // Initial scroll to bottom
    if (this.autoScroll) {
      this.scrollToBottom()
    }
  },

  updated() {
    // Only auto-scroll if user hasn't manually scrolled up
    if (this.autoScroll && !this.isUserScrolledUp) {
      this.scrollToBottom()
    }
  },

  scrollToBottom() {
    if (this.feedContainer) {
      this.feedContainer.scrollTop = this.feedContainer.scrollHeight
    }
  }
}

