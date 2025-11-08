# Form Labels

> Live demo: [`/docs/label`](https://pyraui.onrender.com/docs/label)

Labels reinforce clarity and accessibility across forms. PyraUI labels work alongside inputs, checkboxes, radios, and toggles with consistent typography.

## Highlights

- Supports primary label, optional hint, and required indicator.
- Inline and block display modes.
- Works with IDs to announce associations for screen readers.

## Quick usage

```heex
<.label for="workspace-name">
  Workspace name
  <:hint>Visible to your teammates.</:hint>
</.label>
<.input id="workspace-name" field={@form[:workspace_name]} />
```

## Tips

- Always pair labels with form controls; avoid placeholder-only experiences.
- Use hints sparingly to prevent cognitive overload.
- Combine with `<.input>` and `<.checkbox>` to create cohesive forms.

