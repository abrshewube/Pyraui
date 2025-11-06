// Animated Chart Hook
export const AnimatedChartHook = {
  mounted() {
    this.chartId = this.el.id;
    this.type = this.el.dataset.type;
    this.duration = parseInt(this.el.dataset.duration) || 1000;
    this.renderChart();
  },

  updated() {
    this.renderChart();
  },

  renderChart() {
    const svg = this.el.querySelector("svg");
    if (!svg) return;

    const data = JSON.parse(this.el.dataset.data || "[]");
    const labels = JSON.parse(this.el.dataset.labels || "[]");
    const width = parseInt(this.el.dataset.width) || 400;
    const height = parseInt(this.el.dataset.height) || 300;
    const colors = this.el.dataset.colors ? JSON.parse(this.el.dataset.colors) : null;

    // Clear previous content
    svg.innerHTML = "";

    if (data.length === 0) return;

    const padding = 40;
    const chartWidth = width - padding * 2;
    const chartHeight = height - padding * 2;

    // Normalize data
    const maxValue = Math.max(...data);
    const normalizedData = data.map(val => (val / maxValue) * chartHeight);

    if (this.type === "line" || this.type === "area") {
      this.renderLineOrArea(svg, normalizedData, chartWidth, chartHeight, padding, colors, this.type === "area");
    } else if (this.type === "bar") {
      this.renderBar(svg, normalizedData, chartWidth, chartHeight, padding, colors);
    }
  },

  renderLineOrArea(svg, data, width, height, padding, colors, isArea) {
    const pointSpacing = width / (data.length - 1 || 1);
    const points = data.map((val, i) => {
      const x = padding + i * pointSpacing;
      const y = padding + height - val;
      return `${x},${y}`;
    }).join(" ");

    if (isArea) {
      // Area chart
      const areaPath = `M ${padding},${padding + height} L ${points} L ${padding + width},${padding + height} Z`;
      const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
      path.setAttribute("d", areaPath);
      path.setAttribute("fill", colors?.[0] || "rgba(59, 130, 246, 0.3)");
      path.setAttribute("class", "animate-fade-in");
      svg.appendChild(path);
    }

    // Line
    const linePath = `M ${points}`;
    const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
    path.setAttribute("d", linePath);
    path.setAttribute("fill", "none");
    path.setAttribute("stroke", colors?.[0] || "#3b82f6");
    path.setAttribute("stroke-width", "2");
    path.setAttribute("class", "animate-draw-line");
    path.style.strokeDasharray = path.getTotalLength();
    path.style.strokeDashoffset = path.getTotalLength();
    svg.appendChild(path);

    // Animate line drawing
    setTimeout(() => {
      path.style.transition = `stroke-dashoffset ${this.duration}ms ease-in-out`;
      path.style.strokeDashoffset = 0;
    }, 100);
  },

  renderBar(svg, data, width, height, padding, colors) {
    const barWidth = width / data.length * 0.6;
    const barSpacing = width / data.length;

    data.forEach((val, i) => {
      const x = padding + i * barSpacing + (barSpacing - barWidth) / 2;
      const y = padding + height - val;
      const barHeight = val;

      const rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
      rect.setAttribute("x", x);
      rect.setAttribute("y", padding + height);
      rect.setAttribute("width", barWidth);
      rect.setAttribute("height", 0);
      rect.setAttribute("fill", colors?.[i % colors.length] || "#3b82f6");
      rect.setAttribute("class", "animate-grow-bar");
      svg.appendChild(rect);

      // Animate bar growth
      setTimeout(() => {
        rect.setAttribute("y", y);
        rect.setAttribute("height", barHeight);
        rect.style.transition = `height ${this.duration}ms ease-out, y ${this.duration}ms ease-out`;
      }, i * 50);
    });
  }
};

