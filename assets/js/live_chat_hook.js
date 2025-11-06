// Live Chat Hook
export const LiveChatHook = {
  mounted() {
    this.messagesContainer = this.el.querySelector(`#${this.el.id}-messages`)
    this.scrollToBottom()
  },

  updated() {
    // Scroll to bottom when new messages arrive
    this.scrollToBottom()
  },

  scrollToBottom() {
    if (this.messagesContainer) {
      this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight
    }
  }
}

