# Stats

> Live demo: [`/docs/stats`](https://pyraui.onrender.com/docs/stats)

Stats cards highlight key metrics with gradients, icons, and trend indicators. Use them to anchor dashboards and hero sections.

## Highlights

- Variants for compact pills, large cards, and icon-forward layouts.
- Trend chip support (+11%, -2%) with motion hints.
- Works with LiveView streams for real-time metric updates.

## Quick usage

```heex
<.stats
  value="3.2x"
  label="Faster builds"
  tone={:indigo}
  trend={%{direction: :up, value: "+18%"}}
/>
```

## Tips

- Pair two to four stats together for a high-impact KPI row.
- Keep labels concise so values remain the focal point.
- Combine with `<.chart>` or `<.animated_chart>` to expand on trends.

