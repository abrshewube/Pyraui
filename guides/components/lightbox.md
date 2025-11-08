# Lightbox

> Live demo: [`/docs/lightbox`](https://pyraui.onrender.com/docs/lightbox)

Lightboxes elevate media galleries, screenshots, and product demos with immersive zooming. Users stay focused on content while controls remain intuitive.

## Highlights

- Keyboard and touch gestures for navigation.
- Caption, credit, and metadata slots underneath the media.
- Backdrop blur and animated scaling for premium polish.

## Quick usage

```heex
<.lightbox id="gallery" images={@screenshots} start_index={@active_index}>
  <:trigger>
    <.grid columns={3} gap="md">
      <:item :for={{screenshot, idx} <- Enum.with_index(@screenshots)}>
        <button type="button" phx-click="open_lightbox" phx-value-index={idx}>
          <img class="rounded-xl" src={screenshot.thumb} alt="" />
        </button>
      </:item>
    </.grid>
  </:trigger>
</.lightbox>
```

## Tips

- Preload high-res assets when possible to avoid loading delays mid-experience.
- Use consistent aspect ratios for a cohesive gallery.
- Combine with `<.carousel>` for storytelling that mixes copy and media.

