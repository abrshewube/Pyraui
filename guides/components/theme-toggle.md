# Theme Toggle

> Live demo: [`/docs/theme-toggle`](https://pyraui.onrender.com/docs/theme-toggle)

Theme toggles let users shift between light and dark aesthetics with micro-interactions worthy of a premium brand.

## Highlights

- Variants for lever, pill, and icon-based toggles.
- Optional animations with gradients, stars, and planet motifs.
- Emits LiveView events to persist theme preferences per session.

## Quick usage

```heex
<.theme_toggle
  id="mode-switch"
  value={@theme}
  on_change="toggle_theme"
  labels={%{light: "Day", dark: "Night"}}
/>
```

## Tips

- Store the selected theme in user settings or cookies to remember preference.
- Pair with `<.theme_config>` for deeper customization beyond light/dark.
- Ensure contrast remains accessible in both modes—test key flows in each.

