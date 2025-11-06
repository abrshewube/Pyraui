// Password Strength Meter Hook
export const PasswordStrengthMeterHook = {
  mounted() {
    this.input = this.el.querySelector('input[type="password"]');
    this.strengthBar = this.el.querySelector("#" + this.el.id + "-strength-bar");
    this.strengthText = this.el.querySelector("#" + this.el.id + "-strength-text");
    this.suggestionsList = this.el.querySelector("#" + this.el.id + "-suggestions");
    this.minLength = parseInt(this.el.dataset.minLength) || 8;

    if (this.input) {
      this.input.addEventListener("input", () => this.checkStrength());
    }
  },

  updated() {
    // Re-check strength if input value changed
    if (this.input) {
      this.checkStrength();
    }
  },

  checkStrength() {
    const password = this.input.value;
    const strength = this.calculateStrength(password);
    this.updateMeter(strength);
    if (this.suggestionsList) {
      this.updateSuggestions(password, strength);
    }
  },

  calculateStrength(password) {
    let score = 0;
    const checks = {
      length: password.length >= this.minLength,
      lowercase: /[a-z]/.test(password),
      uppercase: /[A-Z]/.test(password),
      numbers: /[0-9]/.test(password),
      special: /[^a-zA-Z0-9]/.test(password),
      noCommon: !this.isCommonPassword(password)
    };

    score += checks.length ? 1 : 0;
    score += checks.lowercase ? 1 : 0;
    score += checks.uppercase ? 1 : 0;
    score += checks.numbers ? 1 : 0;
    score += checks.special ? 1 : 0;
    score += checks.noCommon ? 1 : 0;

    return {
      score: score,
      maxScore: 6,
      checks: checks
    };
  },

  isCommonPassword(password) {
    const common = ["password", "12345678", "qwerty", "abc123", "password123"];
    return common.includes(password.toLowerCase());
  },

  updateMeter(strength) {
    const percentage = (strength.score / strength.maxScore) * 100;
    let color = "#ef4444"; // red
    let text = "Very Weak";

    if (percentage >= 83) {
      color = "#22c55e"; // green
      text = "Very Strong";
    } else if (percentage >= 67) {
      color = "#84cc16"; // lime
      text = "Strong";
    } else if (percentage >= 50) {
      color = "#eab308"; // yellow
      text = "Moderate";
    } else if (percentage >= 33) {
      color = "#f97316"; // orange
      text = "Weak";
    }

    if (this.strengthBar) {
      this.strengthBar.style.width = percentage + "%";
      this.strengthBar.style.backgroundColor = color;
    }

    if (this.strengthText) {
      this.strengthText.textContent = text;
      this.strengthText.style.color = color;
    }
  },

  updateSuggestions(password, strength) {
    const suggestions = [];
    const checks = strength.checks;

    if (!checks.length) {
      suggestions.push(`Use at least ${this.minLength} characters`);
    }
    if (!checks.lowercase) {
      suggestions.push("Add lowercase letters");
    }
    if (!checks.uppercase) {
      suggestions.push("Add uppercase letters");
    }
    if (!checks.numbers) {
      suggestions.push("Add numbers");
    }
    if (!checks.special) {
      suggestions.push("Add special characters (!@#$%^&*)");
    }
    if (!checks.noCommon) {
      suggestions.push("Avoid common passwords");
    }

    if (this.suggestionsList) {
      this.suggestionsList.innerHTML = suggestions
        .map((s) => `<li class="flex items-center gap-2"><span class="text-red-500">×</span>${s}</li>`)
        .join("");
    }
  }
};

