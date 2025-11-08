# Hero Section

> Live demo: [`/docs/hero`](https://pyraui.onrender.com/docs/hero)

Hero sections deliver first impressions with bold headings, gradients, and animated accents. PyraUI heroes are the backbone of launch pages, docs portals, and marketing campaigns.

## Highlights

- Slots for eyebrow, title, description, and call-to-actions.
- Optional decorative glow, background media, and accent icons.
- Responsive typography tuned for large headlines.

## Quick usage

```heex
<.hero title="Build stunning LiveView apps" eyebrow="PyraUI 1.0">
  <:description>
    Premium components, glassmorphism-inspired visuals, and realtime UX—all in one toolkit.
  </:description>
  <:actions>
    <.button variant={:primary} size={:lg}>Launch demo</.button>
    <.button variant={:ghost} size={:lg}>Browse docs</.button>
  </:actions>
</.hero>
```

## Tips

- Keep copy sharp and focused; combine with `<.stats>` to show instant proof.
- Update imagery seasonally to keep your hero feeling fresh.
- Pair with `<.carousel>` or `<.video_player>` for immersive storytelling.

