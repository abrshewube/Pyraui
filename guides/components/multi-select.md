# Multi-select

> Live demo: [`/docs/multi-select`](https://pyraui.onrender.com/docs/multi-select)

Multi-select inputs capture multiple values with pill chips, keyboard navigation, and smart suggestions. They shine in tagging, permissions, and configuration experiences.

## Highlights

- Async suggestions via LiveView events.
- Drag-to-reorder chips or remove with backspace.
- Built-in empty and max-count states.

## Quick usage

```heex
<.multi_select
  field={@form[:segments]}
  suggestions={@segment_suggestions}
  placeholder="Add customer segment"
/>
```

## Tips

- Track selected values via `Ecto.Changeset.get_field/2` when conditionally rendering UI.
- Provide helpful default suggestions to minimize typing.
- Combine with `<.tag_input>` for quick entry of new tokens alongside existing options.

