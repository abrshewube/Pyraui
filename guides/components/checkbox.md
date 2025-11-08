# Checkboxes

> Live demo: [`/docs/checkbox`](https://pyraui.onrender.com/docs/checkbox)

Checkboxes provide tactile toggles for dense forms, boards, and batch selection. PyraUI’s implementations include focus rings, subtle shadows, and descriptive labels by default.

## Highlights

- Supports indeterminate state for partial selections.
- Accessible markup with descriptive helper text slots.
- Aligns with Tailwind spacing tokens for seamless layouts.

## Quick usage

```heex
<.checkbox
  field={@form[:privacy]}
  label="Keep my workspace discoverable"
  description="We only index the name and hero image."
/>
```

## Tips

- Use the `description` slot to clarify context instead of stacking paragraphs below.
- Drive indeterminate state from assigns when some, but not all, children are checked.
- Combine with `<.list>` or `<.grid>` to create modern checklist interfaces.

