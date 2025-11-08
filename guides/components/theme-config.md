# Theme Configurator

> Live demo: [`/docs/theme-config`](https://pyraui.onrender.com/docs/theme-config)

The theme configurator exposes brand tokens, typography, and surface settings in one polished UI—ideal for white-label products or design systems.

## Highlights

- Controls for color palettes, radius, shadows, and glassmorphism intensity.
- Live preview slot to show instant impact on your components.
- Persists selections via LiveView assigns or storage hooks.

## Quick usage

```heex
<.theme_config id="brand-theme" config={@theme} on_change="update_theme">
  <:preview>
    <.card class="max-w-sm">
      <.card_header>
        <.card_title>Welcome aboard</.card_title>
      </.card_header>
      <.card_content>
        <.button>Try PyraUI</.button>
      </.card_content>
    </.card>
  </:preview>
</.theme_config>
```

## Tips

- Use `on_change` to persist theme tokens per tenant or workspace.
- Provide sensible defaults so design explorations start from a strong baseline.
- Pair with `<.color_picker>` and `<.slider>` for granular adjustments.

