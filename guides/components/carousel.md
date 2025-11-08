# Carousel

> Live demo: [`/docs/carousel`](https://pyraui.onrender.com/docs/carousel)

Carousels showcase feature highlights, testimonials, and media in motion-rich frames. PyraUI balances immersive visuals with accessible controls.

## Highlights

- Looping, autoplay, and pause-on-hover options.
- Touch, keyboard, and button navigation all supported out of the box.
- Slot-based slides let you compose any content—including forms and charts.

## Quick usage

```heex
<.carousel id="hero-showcase" autoplay interval={6000}>
  <:slide>
    <.card class="max-w-xl">
      <.card_header>
        <.card_title>Realtime dashboards</.card_title>
      </.card_header>
      <.card_content>
        Ship metrics with buttery transitions and zero JS build.
      </.card_content>
    </.card>
  </:slide>
  <:slide>
    <.hero title="Craft premium UX">
      <:description>Beautiful defaults, endless customization.</:description>
    </.hero>
  </:slide>
</.carousel>
```

## Tips

- Expose controls for autoplay to ensure accessibility requirements are met.
- Keep slide content focused—two or three slides per carousel works best.
- Pair with `<.badge>` or `<.stats>` to reinforce key metrics inside slides.

