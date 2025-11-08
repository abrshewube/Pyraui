# Map

> Live demo: [`/docs/map`](https://pyraui.onrender.com/docs/map)

Maps emphasise geographic data with smooth panning, markers, and clustering. PyraUI integrates gracefully with Phoenix data sources and LiveView updates.

## Highlights

- Vector styling that respects dark/light themes.
- Marker slots for avatars, metrics, or action buttons.
- Supports drawing tools, region highlighting, and location search.

## Quick usage

```heex
<.map
  id="customer-map"
  center={{37.7749, -122.4194}}
  zoom={10}
  markers={@markers}
>
  <:marker :for={marker <- @markers} lat={marker.lat} lng={marker.lng}>
    <.badge tone={:sky} variant={:solid}>{marker.count}</.badge>
  </:marker>
</.map>
```

## Tips

- Debounce updates when tracking device location to avoid flooding LiveView.
- Pair with `<.filter_panel>` for region filters and segmentation controls.
- Use custom marker slots to embed avatars or quick action menus.

