// Rich Text Editor Hook
export const RichTextEditorHook = {
  mounted() {
    this.editor = this.el
    this.hiddenInput = document.getElementById(`${this.el.id}-input`)
    this.toolbar = this.el.previousElementSibling
    this.placeholder = this.el.dataset.placeholder || "Start typing..."

    // Initialize placeholder
    this.updatePlaceholder()

    // Sync content on input
    this.editor.addEventListener("input", () => {
      this.syncContent()
      this.updatePlaceholder()
      this.updateToolbarState()
    })

    // Sync on paste - preserve formatting but clean up
    this.editor.addEventListener("paste", (e) => {
      e.preventDefault()
      const text = (e.clipboardData || window.clipboardData).getData("text/html") || 
                   (e.clipboardData || window.clipboardData).getData("text/plain")
      
      if (text) {
        // Insert HTML if available, otherwise plain text
        if (text.includes("<")) {
          const selection = window.getSelection()
          if (selection.rangeCount > 0) {
            const range = selection.getRangeAt(0)
            range.deleteContents()
            const tempDiv = document.createElement("div")
            tempDiv.innerHTML = text
            const fragment = document.createDocumentFragment()
            while (tempDiv.firstChild) {
              fragment.appendChild(tempDiv.firstChild)
            }
            range.insertNode(fragment)
            selection.removeAllRanges()
            selection.addRange(range)
          }
        } else {
          document.execCommand("insertText", false, text)
        }
        this.syncContent()
        this.updatePlaceholder()
      }
    })

    // Handle keyboard shortcuts
    this.editor.addEventListener("keydown", (e) => {
      // Ctrl+B for bold
      if (e.ctrlKey && e.key === "b") {
        e.preventDefault()
        this.executeCommand("bold")
      }
      // Ctrl+I for italic
      else if (e.ctrlKey && e.key === "i") {
        e.preventDefault()
        this.executeCommand("italic")
      }
      // Ctrl+U for underline
      else if (e.ctrlKey && e.key === "u") {
        e.preventDefault()
        this.executeCommand("underline")
      }
      // Ctrl+K for link
      else if (e.ctrlKey && e.key === "k") {
        e.preventDefault()
        this.executeCommand("createLink")
      }
      // Ctrl+Z for undo
      else if (e.ctrlKey && e.key === "z" && !e.shiftKey) {
        e.preventDefault()
        this.executeCommand("undo")
      }
      // Ctrl+Y or Ctrl+Shift+Z for redo
      else if ((e.ctrlKey && e.key === "y") || (e.ctrlKey && e.shiftKey && e.key === "z")) {
        e.preventDefault()
        this.executeCommand("redo")
      }
      // Tab for indentation
      else if (e.key === "Tab" && !e.shiftKey) {
        e.preventDefault()
        document.execCommand("indent", false, null)
        this.syncContent()
      }
      // Shift+Tab for outdent
      else if (e.key === "Tab" && e.shiftKey) {
        e.preventDefault()
        document.execCommand("outdent", false, null)
        this.syncContent()
      }
    })

    // Handle selection changes for toolbar state
    this.editor.addEventListener("mouseup", () => {
      setTimeout(() => this.updateToolbarState(), 10)
    })

    this.editor.addEventListener("keyup", () => {
      setTimeout(() => this.updateToolbarState(), 10)
    })

    // Handle toolbar button clicks
    if (this.toolbar) {
      this.toolbar.addEventListener("click", (e) => {
        const button = e.target.closest("button")
        if (button) {
          e.preventDefault()
          e.stopPropagation()
          const command = button.dataset.command || button.getAttribute("phx-value-command")
          const value = button.dataset.value || button.getAttribute("phx-value-value")

          if (command) {
            this.executeCommand(command, value)
          }
        }
      })
    }

    // Sync initial content
    this.syncContent()
  },

  updated() {
    // Update hidden input if value changed externally
    const newValue = this.el.innerHTML
    if (this.hiddenInput && this.hiddenInput.value !== newValue) {
      this.hiddenInput.value = newValue
    }
    this.updatePlaceholder()
  },

  executeCommand(command, value) {
    // Focus editor if not focused
    if (document.activeElement !== this.editor) {
      this.editor.focus()
    }

    // Handle special commands
    if (command === "createLink") {
      const selection = window.getSelection()
      const selectedText = selection.toString()
      const url = prompt("Enter URL:", selectedText || "https://")
      if (url) {
        document.execCommand("createLink", false, url)
      }
    } else if (command === "formatBlock" && value) {
      // Handle block formatting
      if (value === "<pre>") {
        // For code blocks, wrap in <pre><code>
        const selection = window.getSelection()
        if (selection.rangeCount > 0) {
          const range = selection.getRangeAt(0)
          const selectedContent = range.extractContents()
          const pre = document.createElement("pre")
          const code = document.createElement("code")
          code.appendChild(selectedContent)
          pre.appendChild(code)
          range.insertNode(pre)
          selection.removeAllRanges()
          selection.addRange(range)
        }
      } else {
        document.execCommand("formatBlock", false, value)
      }
    } else {
      document.execCommand(command, false, null)
    }

    this.syncContent()
    this.updatePlaceholder()
    this.updateToolbarState()
  },

  syncContent() {
    if (this.hiddenInput) {
      this.hiddenInput.value = this.editor.innerHTML
      // Trigger change event for form validation
      this.hiddenInput.dispatchEvent(new Event("change", { bubbles: true }))
      // Dispatch phx-change event for LiveView
      this.hiddenInput.dispatchEvent(new CustomEvent("phx-change", { bubbles: true }))
    }
  },

  updatePlaceholder() {
    const isEmpty = this.editor.textContent.trim() === "" && 
                    (this.editor.innerHTML.trim() === "" || 
                     this.editor.innerHTML.trim() === "<br>" ||
                     this.editor.innerHTML.trim() === "<div><br></div>")
    
    if (isEmpty) {
      this.editor.classList.add("empty")
    } else {
      this.editor.classList.remove("empty")
    }
  },

  updateToolbarState() {
    if (!this.toolbar) return

    const selection = window.getSelection()
    const buttons = this.toolbar.querySelectorAll("button[data-command]")

    buttons.forEach((button) => {
      const command = button.dataset.command || button.getAttribute("phx-value-command")
      let isActive = false

      if (command === "bold") {
        isActive = document.queryCommandState("bold")
      } else if (command === "italic") {
        isActive = document.queryCommandState("italic")
      } else if (command === "underline") {
        isActive = document.queryCommandState("underline")
      } else if (command === "strikeThrough") {
        isActive = document.queryCommandState("strikeThrough")
      } else if (command === "insertUnorderedList") {
        isActive = document.queryCommandState("insertUnorderedList")
      } else if (command === "insertOrderedList") {
        isActive = document.queryCommandState("insertOrderedList")
      } else if (command === "justifyLeft") {
        isActive = document.queryCommandState("justifyLeft")
      } else if (command === "justifyCenter") {
        isActive = document.queryCommandState("justifyCenter")
      } else if (command === "justifyRight") {
        isActive = document.queryCommandState("justifyRight")
      } else if (command === "justifyFull") {
        isActive = document.queryCommandState("justifyFull")
      } else if (command === "formatBlock") {
        const blockTag = button.dataset.value || button.getAttribute("phx-value-value")
        if (blockTag) {
          const blockName = blockTag.replace(/[<>]/g, "").toLowerCase()
          try {
            const formatBlock = document.queryCommandValue("formatBlock")
            isActive = formatBlock.toLowerCase() === blockName
          } catch (e) {
            isActive = false
          }
        }
      }

      if (isActive) {
        button.classList.add("bg-gray-200")
      } else {
        button.classList.remove("bg-gray-200")
      }
    })
  }
}

