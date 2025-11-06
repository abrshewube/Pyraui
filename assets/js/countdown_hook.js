// Countdown Hook
export const CountdownHook = {
  mounted() {
    this.targetTimestamp = parseInt(this.el.dataset.targetTimestamp) || 0
    this.onComplete = this.el.dataset.onComplete || null
    this.format = this.el.dataset.format || "compact"
    this.interval = null

    this.updateCountdown()
    this.interval = setInterval(() => {
      this.updateCountdown()
    }, 1000)
  },

  updated() {
    // Update target timestamp if it changed
    const newTargetTimestamp = parseInt(this.el.dataset.targetTimestamp) || 0
    if (newTargetTimestamp !== this.targetTimestamp) {
      this.targetTimestamp = newTargetTimestamp
      this.updateCountdown()
    }
  },

  destroyed() {
    if (this.interval) {
      clearInterval(this.interval)
    }
  },

  updateCountdown() {
    const now = Math.floor(Date.now() / 1000)
    const remaining = this.targetTimestamp - now

    if (remaining <= 0) {
      this.displayComplete()
      if (this.interval) {
        clearInterval(this.interval)
        this.interval = null
      }
      if (this.onComplete) {
        this.el.dispatchEvent(
          new CustomEvent(this.onComplete, {
            bubbles: true,
            detail: { id: this.el.id }
          })
        )
      }
      return
    }

    const days = Math.floor(remaining / 86400)
    const hours = Math.floor((remaining % 86400) / 3600)
    const minutes = Math.floor((remaining % 3600) / 60)
    const seconds = remaining % 60

    this.updateDisplay(days, hours, minutes, seconds)
  },

  updateDisplay(days, hours, minutes, seconds) {
    const daysEl = this.el.querySelector('[data-unit="days"]')
    const hoursEl = this.el.querySelector('[data-unit="hours"]')
    const minutesEl = this.el.querySelector('[data-unit="minutes"]')
    const secondsEl = this.el.querySelector('[data-unit="seconds"]')

    if (daysEl) daysEl.textContent = String(days).padStart(2, "0")
    if (hoursEl) hoursEl.textContent = String(hours).padStart(2, "0")
    if (minutesEl) minutesEl.textContent = String(minutes).padStart(2, "0")
    if (secondsEl) secondsEl.textContent = String(seconds).padStart(2, "0")
  },

  displayComplete() {
    const display = this.el.querySelector(".countdown-display")
    if (display) {
      display.innerHTML = '<div class="text-lg font-semibold text-gray-900">Time\'s Up!</div>'
    }
  }
}

