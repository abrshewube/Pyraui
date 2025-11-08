# Color Picker

> Live demo: [`/docs/color-picker`](https://pyraui.onrender.com/docs/color-picker)

Color pickers allow users to explore palettes, tweak branding tokens, and preview gradients in real time. PyraUI couples a spectrum slider with swatch grids for quick decisions.

## Highlights

- HSL and HEX value synchronization with copy-to-clipboard helpers.
- Preset palette slot for theme tokens or saved favorites.
- Subtle transitions keep updates smooth when adjusting sliders.

## Quick usage

```heex
<.color_picker
  id="brand-accent"
  value={@accent_hex}
  on_change="update_accent"
/>
```

## Tips

- Persist selections via LiveView events to keep colors sticky across sessions.
- Pair with `<.card>` to contextualize how the chosen color appears in UI elements.
- Offer both light and dark sample swatches so users can evaluate contrast.

