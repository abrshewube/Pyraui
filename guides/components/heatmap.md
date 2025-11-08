# Heatmap

> Live demo: [`/docs/heatmap`](https://pyraui.onrender.com/docs/heatmap)

Heatmaps visualize density, engagement, or activity with smooth gradients. Perfect for product telemetry, team utilization, and geographic overlays.

## Highlights

- Accepts matrix data or keyed maps for flexible ingestion.
- Tooltip slot reveals precise values on hover.
- Matches Tailwind palettes while keeping contrast accessible.

## Quick usage

```heex
<.heatmap
  id="engagement-grid"
  data={@weekly_activity}
  x_labels={~w(Mon Tue Wed Thu Fri Sat Sun)}
  y_labels={@teams}
/>
```

## Tips

- Normalize datasets to ensure colors convey meaningful differences.
- Use tooltips to show exact counts so users can trust the visual.
- Pair with `<.chart>` or `<.stats>` to give additional context around peaks.

