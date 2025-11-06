// Conditional Form Hook
export const ConditionalFormHook = {
  mounted() {
    this.form = this.el;
    this.conditionalFields = Array.from(this.el.querySelectorAll(".conditional-field-group"));
    this.form.addEventListener("change", (e) => this.handleChange(e));
    this.updateVisibility();
  },

  updated() {
    this.conditionalFields = Array.from(this.el.querySelectorAll(".conditional-field-group"));
    this.updateVisibility();
  },

  handleChange(e) {
    // Small delay to ensure form values are updated
    setTimeout(() => this.updateVisibility(), 10);
  },

  updateVisibility() {
    this.conditionalFields.forEach((field) => {
      const showIf = JSON.parse(field.dataset.showIf || "{}");
      const shouldShow = this.evaluateConditions(showIf);
      field.style.display = shouldShow ? "block" : "none";
    });
  },

  evaluateConditions(conditions) {
    for (const [fieldName, expectedValue] of Object.entries(conditions)) {
      const field = this.form.querySelector(`[name="${fieldName}"]`);
      if (!field) return false;

      let actualValue;
      if (field.type === "checkbox") {
        actualValue = field.checked;
      } else {
        actualValue = field.value;
      }

      // Handle array of possible values
      if (Array.isArray(expectedValue)) {
        if (!expectedValue.includes(actualValue)) {
          return false;
        }
      } else if (actualValue !== expectedValue) {
        return false;
      }
    }
    return true;
  }
};

