# Keyboard Keys

> Live demo: [`/docs/kbd`](https://pyraui.onrender.com/docs/kbd)

The KBD component highlights keyboard shortcuts with tactile styling. Ideal for command palettes, onboarding hints, or docs snippets.

## Highlights

- Compact pill design with subtle shadows and borders.
- Groups multiple keys (e.g., `⌘ + K`) with consistent spacing.
- Dark-mode optimized contrast.

## Quick usage

```heex
<.kbd combo="⌘ + K" label="Command palette" />
```

## Tips

- Keep combos short and well-known; provide alternatives for non-mac keyboards when necessary.
- Pair with `<.toast>` or `<.tooltip>` to teach users new shortcuts contextually.
- Use inside `<.hero>` or `<.card>` to emphasize quick actions.

