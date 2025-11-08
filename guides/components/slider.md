# Slider

> Live demo: [`/docs/slider`](https://pyraui.onrender.com/docs/slider)

Sliders let users pick numeric ranges with tactile handles and gradient tracks. Perfect for pricing, filters, and configuration panels.

## Highlights

- Single or double-handle (range) modes.
- Step, min, and max configuration with tick marks.
- Emits LiveView events while dragging or after release.

## Quick usage

```heex
<.slider
  id="budget"
  min={0}
  max={10_000}
  step={100}
  value={@budget}
  on_change="update_budget"
/>
```

## Tips

- Debounce updates if you only need the final value after release.
- Display the selected range alongside the slider for clarity.
- Pair with `<.filter_panel>` to enrich analytics filtering experiences.

