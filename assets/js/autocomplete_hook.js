// Autocomplete Hook
export const AutocompleteHook = {
  mounted() {
    this.input = this.el.querySelector("input[type='text']")
    this.hiddenInput = this.el.querySelector("input[type='hidden']")
    this.dropdown = this.el.querySelector(`#${this.el.id}-dropdown`)
    this.suggestions = this.el.querySelector(`#${this.el.id}-suggestions`)
    this.minChars = parseInt(this.el.dataset.minChars) || 1
    this.maxResults = parseInt(this.el.dataset.maxResults) || 10
    this.options = JSON.parse(this.el.dataset.options || "[]")
    this.selectedIndex = -1

    // Handle input
    this.input.addEventListener("input", (e) => {
      this.handleInput(e.target.value)
    })

    // Handle keyboard navigation
    this.input.addEventListener("keydown", (e) => {
      this.handleKeydown(e)
    })

    // Close dropdown when clicking outside
    document.addEventListener("click", (e) => {
      if (!this.el.contains(e.target)) {
        this.closeDropdown()
      }
    })

    // Handle suggestion clicks
    this.suggestions.addEventListener("click", (e) => {
      const item = e.target.closest(".autocomplete-item")
      if (item) {
        const value = item.dataset.value
        const label = item.dataset.label
        this.selectOption(value, label)
      }
    })
  },

  updated() {
    // Update options if they changed
    const newOptions = JSON.parse(this.el.dataset.options || "[]")
    if (JSON.stringify(newOptions) !== JSON.stringify(this.options)) {
      this.options = newOptions
      const currentValue = this.input.value
      if (currentValue.length >= this.minChars) {
        this.handleInput(currentValue)
      }
    }
  },

  handleInput(value) {
    if (value.length < this.minChars) {
      this.closeDropdown()
      return
    }

    // Filter options client-side
    const filtered = this.options.filter((option) => {
      const searchTerm = value.toLowerCase()
      return option.label.toLowerCase().includes(searchTerm) || 
             option.value.toLowerCase().includes(searchTerm)
    })

    this.updateSuggestions(filtered)

    // Also dispatch phx-change event for server-side filtering if needed
    this.input.dispatchEvent(
      new CustomEvent("phx-change", {
        bubbles: true,
        detail: { value: value }
      })
    )
  },

  handleKeydown(e) {
    const items = this.suggestions.querySelectorAll(".autocomplete-item")
    
    if (e.key === "ArrowDown") {
      e.preventDefault()
      this.selectedIndex = Math.min(this.selectedIndex + 1, items.length - 1)
      this.highlightItem(items)
    } else if (e.key === "ArrowUp") {
      e.preventDefault()
      this.selectedIndex = Math.max(this.selectedIndex - 1, -1)
      this.highlightItem(items)
    } else if (e.key === "Enter" && this.selectedIndex >= 0) {
      e.preventDefault()
      const item = items[this.selectedIndex]
      if (item) {
        const value = item.dataset.value
        const label = item.dataset.label
        this.selectOption(value, label)
      }
    } else if (e.key === "Escape") {
      this.closeDropdown()
    }
  },

  highlightItem(items) {
    items.forEach((item, index) => {
      if (index === this.selectedIndex) {
        item.classList.add("bg-blue-50")
        item.scrollIntoView({ block: "nearest" })
      } else {
        item.classList.remove("bg-blue-50")
      }
    })
  },

  updateSuggestions(filteredOptions) {
    this.options = filteredOptions || []
    this.selectedIndex = -1

    if (this.options.length === 0) {
      this.closeDropdown()
      return
    }

    this.suggestions.innerHTML = this.options
      .slice(0, this.maxResults)
      .map(
        (option) => `
      <div class="autocomplete-item px-4 py-2 hover:bg-gray-100 cursor-pointer" 
           data-value="${option.value}" 
           data-label="${option.label}">
        ${option.label}
      </div>
    `
      )
      .join("")

    this.dropdown.classList.remove("hidden")
  },

  selectOption(value, label) {
    this.input.value = label
    if (this.hiddenInput) {
      this.hiddenInput.value = value
    }

    // Dispatch change event
    this.input.dispatchEvent(new Event("change", { bubbles: true }))
    this.input.dispatchEvent(
      new CustomEvent("phx-change", {
        bubbles: true,
        detail: { value: value, label: label }
      })
    )

    this.closeDropdown()
  },

  closeDropdown() {
    this.dropdown.classList.add("hidden")
    this.selectedIndex = -1
  }
}

