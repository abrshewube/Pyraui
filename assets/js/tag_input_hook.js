// Tag Input Hook
export const TagInputHook = {
  mounted() {
    this.input = this.el.querySelector("input[type='text']");
    this.maxTags = this.el.dataset.maxTags ? parseInt(this.el.dataset.maxTags) : null;
    this.allowDuplicates = this.el.dataset.allowDuplicates === "true";

    this.input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        e.preventDefault();
        this.addTag();
      } else if (e.key === "Backspace" && this.input.value === "") {
        // Remove last tag if input is empty
        const tags = Array.from(this.el.querySelectorAll("span"));
        if (tags.length > 0) {
          const lastTag = tags[tags.length - 1];
          const tagText = lastTag.textContent.trim();
          this.removeTag(tagText);
        }
      }
    });

    this.input.addEventListener("blur", () => {
      if (this.input.value.trim() !== "") {
        this.addTag();
      }
    });
  },

  addTag() {
    const value = this.input.value.trim();
    if (value === "") return;

    // Check max tags
    const currentTags = Array.from(this.el.querySelectorAll("span")).map(
      (span) => span.textContent.trim().replace("×", "").trim()
    );
    if (this.maxTags && currentTags.length >= this.maxTags) {
      this.input.value = "";
      return;
    }

    // Check duplicates
    if (!this.allowDuplicates && currentTags.includes(value)) {
      this.input.value = "";
      return;
    }

    // Dispatch event to LiveView
    this.pushEvent("add-tag", { id: this.el.id, tag: value });
    this.input.value = "";
  },

  removeTag(tag) {
    this.pushEvent("remove-tag", { id: this.el.id, tag: tag });
  }
};

