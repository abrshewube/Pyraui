# Autocomplete

> Live demo: [`/docs/autocomplete`](https://pyraui.onrender.com/docs/autocomplete)

The autocomplete input delivers lightning-fast search experiences with keyboard navigation, soft shadows, and adaptive sizing—ideal for command palettes or location pickers.

## Highlights

- Debounced LiveView events for filtering remote data sources.
- Highlighted matches and empty states handled via slots.
- Supports avatars, icons, and secondary metadata inside results.

## Quick usage

```heex
<.autocomplete
  id="team-selector"
  placeholder="Assign to teammate..."
  options={@teammates}
  phx-change="filter_teammates"
  phx-target={@myself}
/>
```

## Tips

- Store the search query in assigns to rehydrate the field after reconnects.
- Use the `:option` slot to customize result layout with badges or stacked text.
- Combine with `<.avatar>` components to display user identities inside results.

