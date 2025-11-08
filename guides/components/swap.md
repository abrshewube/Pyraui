# Swap

> Live demo: [`/docs/swap`](https://pyraui.onrender.com/docs/swap)

The swap component transitions between two states—great for toggling icons, text, or CTA labels with delightful motion.

## Highlights

- Crossfade, slide, and scale animations.
- Works with `phx-click` or LiveView assigns to flip state.
- Accessible announcements ensure screen readers track changes.

## Quick usage

```heex
<.swap id="favorite-toggle" show={@favorited?} phx-click="toggle_favorite">
  <:on>
    <.icon name="hero-heart-solid" class="h-6 w-6 text-rose-400" />
  </:on>
  <:off>
    <.icon name="hero-heart" class="h-6 w-6 text-white/70" />
  </:off>
</.swap>
```

## Tips

- Keep the swapped elements similar in size to avoid layout shifts.
- Use animation variants that match the context; crossfade for calm, slide for expressive.
- Combine with `<.toast>` or `<.badge>` to communicate the result of the swap action.

