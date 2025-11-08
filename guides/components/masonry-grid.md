# Masonry Grid

> Live demo: [`/docs/masonry-grid`](https://pyraui.onrender.com/docs/masonry-grid)

Masonry grids arrange cards with varying heights into a balanced collage. Ideal for inspiration walls, media galleries, and changelog timelines.

## Highlights

- Auto-balances columns for even visual weight.
- Supports responsive breakpoints with custom column counts.
- Integrates with `<.card>` and `<.lightbox>` for media-heavy layouts.

## Quick usage

```heex
<.masonry_grid columns={{2, :sm}, {3, :lg}}>
  <:item :for={entry <- @entries} key={entry.id}>
    <.card class="h-full">
      <.card_header>
        <.card_title>{entry.title}</.card_title>
      </.card_header>
      <.card_content>{entry.body}</.card_content>
    </.card>
  </:item>
</.masonry_grid>
```

## Tips

- Use consistent padding inside cards to keep the grid feeling cohesive.
- Mix column counts carefully; 2–3 columns often give the best results.
- Pair with `<.filter_panel>` or `<.tag_input>` to let users refine the grid content.

