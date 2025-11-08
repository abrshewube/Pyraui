# Charts

> Live demo: [`/docs/chart`](https://pyraui.onrender.com/docs/chart)

Charts deliver fast, focused insights using LiveView-backed datasets. From product analytics to revenue dashboards, PyraUI charts keep visuals sharp and responsive.

## Highlights

- Supports line, bar, pie, stacked, and combo configurations.
- Themed palettes match Tailwind tokens with ease.
- Optional markers, legends, and tooltips via assigns.

## Quick usage

```heex
<.chart
  id="mrr"
  type={:area}
  data={@monthly_revenue}
  title="Monthly recurring revenue"
  legend={true}
/>
```

## Tips

- Pre-format numbers on the server to keep the chart focused on visualization.
- Use stacked variants for composition breakdowns across plans or segments.
- Combine with `<.grid>` and `<.card>` to build analytical dashboard layouts.

