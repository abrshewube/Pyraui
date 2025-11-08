# Conditional Form

> Live demo: [`/docs/conditional-form`](https://pyraui.onrender.com/docs/conditional-form)

Conditional forms reveal follow-up fields based on user choices, keeping complex flows approachable. Use them for onboarding surveys, pricing configurators, and support workflows.

## Highlights

- Declarative `:if` slots to toggle sections without losing focus.
- Integrates with LiveView validation to keep state consistent server-side.
- Works with `<.input>`, `<.select>`, and custom components inside each branch.

## Quick usage

```heex
<.conditional_form id="workspace-survey" form={@form}>
  <:section title="Workspace type">
    <.select field={@form[:workspace_type]} options={@workspace_types} />
  </:section>

  <:section
    title="Company details"
    if={Ecto.Changeset.get_field(@form.source, :workspace_type) == "company"}
  >
    <.input field={@form[:team_size]} label="Team size" type="number" />
    <.input field={@form[:industry]} label="Industry" />
  </:section>
</.conditional_form>
```

## Tips

- Use `Ecto.Changeset.get_field/2` to evaluate current selections safely.
- Keep conditional sections focused—two to three additional inputs per branch works best.
- Pair with `<.toast>` to confirm when conditional data saves successfully.

