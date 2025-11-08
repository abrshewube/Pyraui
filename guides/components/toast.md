# Toast Notifications

> Live demo: [`/docs/toast`](https://pyraui.onrender.com/docs/toast)

PyraUI toasts deliver timed feedback, async status updates, and confirmations with polished motion and theming. Variants span success, info, warning, and celebrate to cover most notification use cases out of the box.

## Highlights

- Auto-dismiss timers with progress bar indicators.
- Inline action slot for undo links or follow-up buttons.
- Adaptive layout that gracefully handles multi-line content.
- Works with LiveView streams to push notifications reactively.

## Quick usage

```heex
<.toast variant={:success} title="Report exported" timeout={4000}>
  Your dashboard was emailed to billing@northwind.io.
  <:actions>
    <.button variant={:ghost} size={:xs} phx-click="view-report">
      View
    </.button>
  </:actions>
</.toast>
```

## Tips

- Trigger from LiveView events with `push_event/3` to show toasts after async operations.
- Stack toasts in a vertical flex container with `gap-3` for consistent spacing.
- Use the `:celebrate` variant alongside confetti animations for milestone moments.

