# Drawer

> Live demo: [`/docs/drawer`](https://pyraui.onrender.com/docs/drawer)

Drawers slide in contextual panels without disrupting the primary flow—perfect for detail views, filters, and creation flows.

## Highlights

- Positions on any edge with frosted glass styling.
- Focus trap and ESC-to-close behaviour included by default.
- Supports stacked headers, content, and footer slots for actions.

## Quick usage

```heex
<.drawer id="filters" show={@drawer_open?} on_cancel="close_drawer">
  <:header title="Refine results" subtitle="Tune what appears in your feed" />
  <:content>
    <.input type="search" label="Keyword" field={@form[:keyword]} />
    <.checkbox field={@form[:only_favorites]} label="Only favorites" />
  </:content>
  <:footer>
    <.button variant={:ghost} phx-click="close_drawer">Cancel</.button>
    <.button phx-click="apply_filters">Apply filters</.button>
  </:footer>
</.drawer>
```

## Tips

- Drive `show` from assigns to ensure LiveView controls the open state.
- Keep actions in the footer to reinforce a clear exit path.
- Pair with `<.overlay>` components when the background needs to dim for focus.

