# Mockup Frames

> Live demo: [`/docs/mockup`](https://pyraui.onrender.com/docs/mockup)

Mockup frames display product screenshots inside device shells with lighting effects. Showcase your app in context without exporting from design tools.

## Highlights

- Includes laptop, tablet, and phone chrome styles.
- Supports background gradients, ambient glows, and floating elements.
- Slot-based so you can render LiveView components directly inside the frame.

## Quick usage

```heex
<.mockup device={:laptop} ambient_glow>
  <.card class="rounded-3xl">
    <.card_header>
      <.card_title>Realtime dashboards</.card_title>
    </.card_header>
    <.card_content>
      <.chart type={:line} data={@metrics} />
    </.card_content>
  </.card>
</.mockup>
```

## Tips

- Match background gradients to your brand colors to keep the frame cohesive.
- Use ambient elements (particles, badges) to add motion without overwhelming the screenshot.
- Pair with `<.carousel>` for multi-screen storytelling.

