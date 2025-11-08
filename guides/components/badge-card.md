# Badge Cards

> Live demo: [`/docs/badge-card`](https://pyraui.onrender.com/docs/badge-card)

Badge cards wrap badges, stats, and actions in one cohesive module—ideal for highlights, upgrade prompts, and onboarding moments.

## Highlights

- Dedicated slots for title, description, metric, and actions.
- Glassmorphism background with animated hover accents.
- Supports icons, CTA buttons, and gradients for standout visuals.

## Quick usage

```heex
<.badge_card tone={:violet} label="Ship it!">
  <:title>Launch complete</:title>
  <:metric>0 regressions</:metric>
  <:description>Your deployment passed every check.</:description>
  <:actions>
    <.button variant={:ghost} size={:sm}>Share</.button>
  </:actions>
</.badge_card>
```

## Tips

- Use `tone` to align the card with your brand palette.
- Keep descriptions short—badge cards shine with concise copy.
- Stack multiple cards in a responsive grid to build celebration walls.

