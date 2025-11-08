# Animated Charts

> Live demo: [`/docs/animated-chart`](https://pyraui.onrender.com/docs/animated-chart)

Animated charts breathe life into metrics by blending real-time data with motion design. Use them for KPIs, growth dashboards, and marketing hero sections.

## Highlights

- Prebuilt variants for line, bar, and area charts with easing curves tuned for clarity.
- Stream-friendly updates keep animations smooth when new data arrives.
- Supports annotations, gradients, and badges directly in assigns.

## Quick usage

```heex
<.animated_chart
  id="signup-velocity"
  type={:line}
  data={@trend_points}
  title="Weekly signups"
  subtitle="Motion-enhanced analytics"
/>
```

## Tips

- Normalize datasets on the server to keep animations fluid.
- Use the `title` and `subtitle` assigns to provide context when embedding in cards.
- Pair with `<.stats>` for secondary metrics beneath the chart.

