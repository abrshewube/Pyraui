// Chart.js hook for Phoenix LiveView
import { Chart, registerables } from "chart.js"

// Register all Chart.js components
Chart.register(...registerables)

export const ChartHook = {
  mounted() {
    this.chart = this.initChart()
  },

  updated() {
    if (this.chart) {
      this.updateChart()
    } else {
      this.chart = this.initChart()
    }
  },

  destroyed() {
    if (this.chart) {
      this.chart.destroy()
    }
  },

  initChart() {
    const canvas = this.el.querySelector("canvas")
    if (!canvas) return null

    const config = JSON.parse(this.el.dataset.config || "{}")
    const ctx = canvas.getContext("2d")

    return new Chart(ctx, config)
  },

  updateChart() {
    const config = JSON.parse(this.el.dataset.config || "{}")
    this.chart.data = config.data
    this.chart.options = config.options
    this.chart.update()
  }
}

