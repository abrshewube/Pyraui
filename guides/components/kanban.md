# Kanban Boards

> Live demo: [`/docs/kanban`](https://pyraui.onrender.com/docs/kanban)

Build collaborative planning tools with PyraUI's kanban component. It streams column updates, drag-and-drop reordering, and real-time presence so distributed teams stay aligned on priorities.

## Highlights

- Columns and cards defined via assigns for instant customization.
- Drag interactions emit `phx-drop` events you can handle to persist ordering.
- Supports avatars, tags, and status chips inside cards.
- Works with LiveView streams to broadcast updates to everyone connected.

## Quick usage

```heex
<.kanban id="roadmap-board" columns={@columns}>
  <:column :let={column} id={column.id} title={column.title}>
    <:card :for={task <- column.tasks} id={task.id}>
      <div class="flex items-center justify-between">
        <span class="font-medium text-white">{task.title}</span>
        <.badge tone={task.tone}>{task.status}</.badge>
      </div>
      <p class="text-sm text-slate-400 mt-3">{task.summary}</p>
    </:card>
  </:column>
</.kanban>
```

## Tips

- Stream cards into each column with `stream/4` so moves replicate in real time.
- Use `phx-hook="PyrauiKanban"` to integrate custom drag behaviors when needed.
- Combine with `<.modal>` for editing card details without navigating away.

