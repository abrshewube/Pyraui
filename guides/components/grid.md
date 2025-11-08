# Grid

> Live demo: [`/docs/grid`](https://pyraui.onrender.com/docs/grid)

Grids orchestrate responsive layouts without wrestling with utility classes. PyraUI grids handle spacing, breakpoints, and card placement for you.

## Highlights

- Multi-column layout that adapts from mobile to desktop with consistent rhythm.
- Gap controls and `align` options for fine-grained positioning.
- Works seamlessly with cards, stats, and masonry sections.

## Quick usage

```heex
<.grid columns={3} gap="lg">
  <:item :for={component <- @featured_components}>
    <.card class="h-full">
      <.card_header>
        <.card_title>{component.title}</.card_title>
      </.card_header>
      <.card_content>{component.summary}</.card_content>
    </.card>
  </:item>
</.grid>
```

## Tips

- Mix grid with `<.masonry_grid>` when content height varies heavily.
- Keep column counts low (2-4) for dashboards to maintain breathing room.
- Pair with `<.section>` headings to label each grid grouping.

