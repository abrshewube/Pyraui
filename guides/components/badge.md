# Badges

> Live demo: [`/docs/badge`](https://pyraui.onrender.com/docs/badge)

Badges surface status, metadata, and quick hints using rounded capsules and embossed styles. Use them in tables, cards, and navigation.

## Highlights

- Variants for `:solid`, `:soft`, `:outline`, and `:glow`.
- Optional leading icon slot and dismiss button.
- Works inline with text or as standalone UI elements.

## Quick usage

```heex
<.badge tone={:emerald} variant={:solid} icon="hero-sparkles">
  New feature
</.badge>
```

## Tips

- Pair with `<.tooltip>` when badge text is abbreviated.
- Use subtle variants like `:soft` for secondary metadata so primary content stays loud.
- Combine with `<.badge_card>` for richer metric displays.

