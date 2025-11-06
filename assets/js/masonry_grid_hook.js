// Masonry Grid Hook
export const MasonryGridHook = {
  mounted() {
    this.columns = parseInt(this.el.dataset.columns) || 3;
    this.layout();
    window.addEventListener("resize", () => this.layout());
  },

  updated() {
    this.layout();
  },

  layout() {
    const items = Array.from(this.el.querySelectorAll(".masonry-item"));
    if (items.length === 0) return;

    // Reset positions
    items.forEach(item => {
      item.style.position = "";
      item.style.top = "";
      item.style.left = "";
    });

    // Get container width
    const containerWidth = this.el.offsetWidth;
    const gap = parseInt(window.getComputedStyle(this.el).gap) || 16;
    const columnWidth = (containerWidth - (gap * (this.columns - 1))) / this.columns;

    // Calculate column heights
    const columnHeights = new Array(this.columns).fill(0);

    items.forEach((item, index) => {
      const columnIndex = index % this.columns;
      const itemHeight = item.offsetHeight;

      item.style.position = "absolute";
      item.style.width = `${columnWidth}px`;
      item.style.left = `${columnIndex * (columnWidth + gap)}px`;
      item.style.top = `${columnHeights[columnIndex]}px`;

      columnHeights[columnIndex] += itemHeight + gap;
    });

    // Set container height
    const maxHeight = Math.max(...columnHeights);
    this.el.style.height = `${maxHeight}px`;
    this.el.style.position = "relative";
  }
};

