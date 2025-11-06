// Color Picker Hook
export const ColorPickerHook = {
  mounted() {
    this.colorInput = this.el.querySelector('input[type="color"]');
    this.textInput = this.el.querySelector('input[type="text"]');

    // Sync color input to text input
    this.colorInput.addEventListener("input", () => {
      this.textInput.value = this.colorInput.value;
      this.dispatchChange();
    });

    // Sync text input to color input (with validation)
    this.textInput.addEventListener("input", () => {
      const value = this.textInput.value;
      if (this.isValidHex(value)) {
        this.colorInput.value = value;
        this.dispatchChange();
      }
    });
  },

  isValidHex(hex) {
    return /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.test(hex);
  },

  dispatchChange() {
    const event = new CustomEvent("phx-change", {
      bubbles: true,
      detail: { value: this.colorInput.value }
    });
    this.el.dispatchEvent(event);
  }
};

