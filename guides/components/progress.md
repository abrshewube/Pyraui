# Progress Indicators

> Live demo: [`/docs/progress`](https://pyraui.onrender.com/docs/progress)

Progress indicators visualize loading, steps, and completion rates with fluid animation and clear typography.

## Highlights

- Linear, radial, and segmented variants.
- Optional labels, value text, and helper descriptions.
- Smooth transitions for LiveView-driven updates.

## Quick usage

```heex
<.progress value={@completion} label="Deployment progress">
  {:percentage, @completion}
</.progress>
```

## Tips

- Keep progress updates minimal (10–20 per operation) to avoid overwhelming the socket.
- Pair with `<.toast>` to announce when progress reaches 100%.
- Use segmented mode for multi-stage pipelines or upload batches.

