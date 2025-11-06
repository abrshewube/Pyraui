// Live Data Table Hook - handles table-level events (filtering, sorting, selection)
export const LiveDataTableHook = {
  mounted() {
    this.tableId = this.el.id;
    // Virtual scrolling is handled by VirtualScrollHook on the scroll container
  },

  updated() {
    // Update visible rows info in footer when total rows change
    const newTotalRows = parseInt(this.el.dataset.totalRows) || 0;
    const totalEl = document.getElementById(`${this.tableId}-total`);
    if (totalEl) {
      totalEl.textContent = newTotalRows;
    }
  }
};

// Virtual Scroll Hook (separate hook for the scroll container)
export const VirtualScrollHook = {
  mounted() {
    this.containerId = this.el.dataset.containerId;
    this.rowHeight = parseInt(this.el.dataset.rowHeight) || 50;
    this.totalRows = parseInt(this.el.dataset.totalRows) || 0;
    
    this.scrollTop = 0;
    this.startIndex = 0;
    this.endIndex = Math.min(10, this.totalRows);

    this.el.addEventListener("scroll", () => this.handleScroll());
    this.updateVisibleRows();
  },

  updated() {
    const newTotalRows = parseInt(this.el.dataset.totalRows) || 0;
    if (newTotalRows !== this.totalRows) {
      this.totalRows = newTotalRows;
      this.updateVisibleRows();
    }
  },

  handleScroll() {
    this.scrollTop = this.el.scrollTop;
    this.updateVisibleRows();
  },

  updateVisibleRows() {
    const spacerTop = document.getElementById(`${this.containerId}-spacer-top`);
    const spacerBottom = document.getElementById(`${this.containerId}-spacer-bottom`);
    const visibleStartEl = document.getElementById(`${this.containerId}-visible-start`);
    const visibleEndEl = document.getElementById(`${this.containerId}-visible-end`);
    const totalEl = document.getElementById(`${this.containerId}-total`);

    if (!spacerTop || !spacerBottom) return;

    const containerHeight = this.el.clientHeight;
    const buffer = 3;
    
    this.startIndex = Math.max(0, Math.floor(this.scrollTop / this.rowHeight) - buffer);
    this.endIndex = Math.min(
      this.totalRows,
      Math.ceil((this.scrollTop + containerHeight) / this.rowHeight) + buffer
    );

    const topHeight = this.startIndex * this.rowHeight;
    const bottomHeight = (this.totalRows - this.endIndex) * this.rowHeight;

    spacerTop.style.height = `${topHeight}px`;
    spacerBottom.style.height = `${bottomHeight}px`;

    // Update visible rows info in footer
    if (visibleStartEl) {
      visibleStartEl.textContent = this.totalRows > 0 ? this.startIndex + 1 : 0;
    }
    if (visibleEndEl) {
      visibleEndEl.textContent = this.endIndex;
    }
    if (totalEl) {
      totalEl.textContent = this.totalRows;
    }
  }
};

