# Skeleton Loading

> Live demo: [`/docs/skeleton`](https://pyraui.onrender.com/docs/skeleton)

Skeleton placeholders maintain layout stability while data loads. PyraUI offers linear shimmers, card mockups, and avatar placeholders.

## Highlights

- Supports animated shimmer or static placeholder styles.
- Slots for avatar, text lines, and media blocks.
- Matches your Tailwind color tokens for cohesive loading states.

## Quick usage

```heex
<.skeleton variant={:card} lines={3}>
  <:avatar />
  <:line width="80%" />
  <:line width="60%" />
</.skeleton>
```

## Tips

- Keep skeleton height consistent with the eventual content to avoid layout jumps.
- Pair with `<.live_feed>` or `<.list>` for loading states in collections.
- Use shorter durations if loading completes quickly to prevent flicker.

