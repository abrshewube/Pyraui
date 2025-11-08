# Video Player

> Live demo: [`/docs/video-player`](https://pyraui.onrender.com/docs/video-player)

The PyraUI video player delivers cinematic playback with LiveView-friendly controls. It supports progressive streaming, chapter markers, and overlays—perfect for product walkthroughs, tutorials, and marketing content.

## Highlights

- Customizable control bar with play/pause, volume, captions, and fullscreen.
- Chapter list slot lets you surface timeline markers for quick navigation.
- Supports poster images, ambient overlays, and blur backgrounds.
- Emits events you can hook into for analytics or synchronized UI updates.

## Quick usage

```heex
<.video_player
  id="product-tour"
  src="https://cdn.pyraui.dev/demos/product-tour.mp4"
  poster="/images/product-tour-poster.jpg"
  subtitles={[
    %{label: "English", src: "/captions/product-tour.en.vtt", kind: "subtitles", default: true}
  ]}
>
  <:chapters>
    <.video_player_chapter time={0} label="Intro" />
    <.video_player_chapter time={42} label="Live dashboards" />
    <.video_player_chapter time={120} label="Collaboration" />
  </:chapters>
</.video_player>
```

## Tips

- Listen for `phx-hook="PyrauiVideoPlayer"` events to sync playback with other components.
- Provide multiple subtitle tracks to keep accessibility front and center.
- Pair with `<.toast>` for milestone callouts when the viewer reaches key timestamps.

