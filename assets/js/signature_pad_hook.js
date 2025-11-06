// Signature Pad Hook
export const SignaturePadHook = {
  mounted() {
    this.canvas = this.el.querySelector("canvas");
    this.ctx = this.canvas.getContext("2d");
    this.lineColor = this.el.dataset.lineColor || "#000000";
    this.lineWidth = parseInt(this.el.dataset.lineWidth) || 2;
    this.isDrawing = false;
    this.lastX = 0;
    this.lastY = 0;

    // Set canvas background
    this.ctx.fillStyle = "#ffffff";
    this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

    // Set drawing style
    this.ctx.strokeStyle = this.lineColor;
    this.ctx.lineWidth = this.lineWidth;
    this.ctx.lineCap = "round";
    this.ctx.lineJoin = "round";

    // Mouse events
    this.canvas.addEventListener("mousedown", (e) => this.startDrawing(e));
    this.canvas.addEventListener("mousemove", (e) => this.draw(e));
    this.canvas.addEventListener("mouseup", () => this.stopDrawing());
    this.canvas.addEventListener("mouseout", () => this.stopDrawing());

    // Touch events
    this.canvas.addEventListener("touchstart", (e) => this.startDrawing(e));
    this.canvas.addEventListener("touchmove", (e) => this.draw(e));
    this.canvas.addEventListener("touchend", () => this.stopDrawing());
  },

  updated() {
    // Update line color and width if changed
    this.lineColor = this.el.dataset.lineColor || "#000000";
    this.lineWidth = parseInt(this.el.dataset.lineWidth) || 2;
    this.ctx.strokeStyle = this.lineColor;
    this.ctx.lineWidth = this.lineWidth;
  },

  startDrawing(e) {
    this.isDrawing = true;
    const rect = this.canvas.getBoundingClientRect();
    const clientX = e.touches ? e.touches[0].clientX : e.clientX;
    const clientY = e.touches ? e.touches[0].clientY : e.clientY;
    this.lastX = clientX - rect.left;
    this.lastY = clientY - rect.top;
  },

  draw(e) {
    if (!this.isDrawing) return;

    e.preventDefault();
    const rect = this.canvas.getBoundingClientRect();
    const clientX = e.touches ? e.touches[0].clientX : e.clientX;
    const clientY = e.touches ? e.touches[0].clientY : e.clientY;
    const currentX = clientX - rect.left;
    const currentY = clientY - rect.top;

    this.ctx.beginPath();
    this.ctx.moveTo(this.lastX, this.lastY);
    this.ctx.lineTo(currentX, currentY);
    this.ctx.stroke();

    this.lastX = currentX;
    this.lastY = currentY;

    // Update hidden input with canvas data
    this.updateHiddenInput();
  },

  stopDrawing() {
    this.isDrawing = false;
    this.updateHiddenInput();
  },

  updateHiddenInput() {
    const hiddenInput = this.el.querySelector('input[type="hidden"]');
    if (hiddenInput) {
      hiddenInput.value = this.canvas.toDataURL("image/png");
    }
  },

  clear() {
    this.ctx.fillStyle = "#ffffff";
    this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
    this.updateHiddenInput();
  }
};

