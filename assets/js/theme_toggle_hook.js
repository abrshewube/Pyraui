// Theme Switch Hook
export const ThemeToggleHook = {
  mounted() {
    this.button = this.el
    this.initTheme()
    this.button.addEventListener("click", () => this.toggleTheme())
  },

  initTheme() {
    // Check localStorage or system preference
    const stored = localStorage.getItem("theme")
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches
    const isDark = stored === "dark" || (!stored && prefersDark)

    this.setTheme(isDark)
  },

  toggleTheme() {
    const isDark = document.documentElement.classList.contains("dark")
    this.setTheme(!isDark)
  },

  setTheme(isDark) {
    if (isDark) {
      document.documentElement.classList.add("dark")
      localStorage.setItem("theme", "dark")
      this.button.setAttribute("aria-checked", "true")
    } else {
      document.documentElement.classList.remove("dark")
      localStorage.setItem("theme", "light")
      this.button.setAttribute("aria-checked", "false")
    }
  }
}

