# Resizable Panels

> Live demo: [`/docs/resizable-panels`](https://pyraui.onrender.com/docs/resizable-panels)

Resizable panels split the screen into flexible workspaces. Ideal for IDE-like layouts, analytics workbenches, and dual-pane editing.

## Highlights

- Drag handles with snap points and min/max widths.
- Vertical and horizontal orientation options.
- Remembers user preferences using LiveView assigns or local storage hooks.

## Quick usage

```heex
<.resizable_panels id="designer" panes={@panes}>
  <:pane id="preview" size="2fr">
    <.hero title="Live preview" />
  </:pane>
  <:pane id="config" size="1fr">
    <.filter_panel form={@form} />
  </:pane>
</.resizable_panels>
```

## Tips

- Persist pane sizes on `phx-hook` callbacks to restore layouts on reload.
- Provide keyboard shortcuts to reset or swap panels for power users.
- Pair with `<.wizard>` or `<.tabs>` to organize complex configuration flows.

