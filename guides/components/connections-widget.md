# Connections Widget

> Live demo: [`/docs/connections-widget`](https://pyraui.onrender.com/docs/connections-widget)

The connections widget highlights collaborators, integration partners, and shared resources with a social flair. It blends avatars, badges, and action buttons for inviting cross-team energy.

## Highlights

- Supports stacked avatars, follow buttons, and status pills.
- Responsive layout adapts to dashboards, sidebars, or modals.
- Stream-friendly updates let you show new connections instantly.

## Quick usage

```heex
<.connections_widget title="Live collaborators" connections={@connections}>
  <:connection :for={conn <- @connections} key={conn.id}>
    <.avatar src={conn.photo} initials={conn.initials} presence={conn.state} />
    <span class="text-sm text-white/90">{conn.name}</span>
    <.badge tone={:sky} variant={:soft}>{conn.role}</.badge>
  </:connection>
</.connections_widget>
```

## Tips

- Use `stream/3` to append new collaborators without re-rendering the widget.
- Surface invite or remove actions inside the slot to keep controls contextual.
- Pair with `<.toast>` or `<.modal>` when connections trigger secondary flows.

