# Sortable List

> Live demo: [`/docs/sortable-list`](https://pyraui.onrender.com/docs/sortable-list)

Sortable lists introduce drag-and-drop ordering to collections. Ideal for prioritizing backlogs, customizing menus, or reordering playlists.

## Highlights

- Smooth drag motion with ghost previews and drop indicators.
- Works with LiveView events to persist ordering changes.
- Supports handles, multi-select, and nested items.

## Quick usage

```heex
<.sortable_list id="feature-priority" items={@features} phx-drop="reorder">
  <:item :for={feature <- @features} id={feature.id}>
    <span class="font-medium text-white/90">{feature.title}</span>
    <.badge tone={:amber} variant={:soft}>{feature.score}</.badge>
  </:item>
</.sortable_list>
```

## Tips

- Use a drag handle icon to signal that items can be rearranged.
- Persist the new order immediately inside your `phx-drop` handler.
- Combine with `<.kanban>` or `<.list>` to support drag targets across components.

