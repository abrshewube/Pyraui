# Wizard Flows

> Live demo: [`/docs/wizard`](https://pyraui.onrender.com/docs/wizard)

Use the wizard component to guide users through multi-step onboarding, configuration, or checkout experiences. It combines progress indicators, slots, and keyboard-friendly navigation in a single, elegant wrapper.

## Highlights

- Displays current step, total steps, and optional subtitles.
- Emits semantic markup for screen readers with `aria-current` and proper labels.
- Works with LiveView assigns so you can update `current_step` reactively.
- Flexible slot structure for injecting forms, media, and contextual help.

## Quick usage

```heex
<.wizard current_step={@step} total_steps={4}>
  <:header>
    <h2 class="text-xl font-semibold text-white">Launch checklist</h2>
    <p class="text-sm text-slate-400">Step {@step} of 4</p>
  </:header>

  <:step title="Configure product" subtitle="Connect your data sources">
    <.form for={@form} id="wizard-step" phx-change="validate" phx-submit="save">
      <.input field={@form[:workspace_name]} label="Workspace name" />
      <.button type="submit" variant={:primary}>Continue</.button>
    </.form>
  </:step>
</.wizard>
```

## Tips

- Persist the current step in the LiveView assigns to handle reconnects gracefully.
- Combine with `<.toast>` or `<.modal>` to surface contextual help on complex steps.
- Use the `:footer` slot to add back/next buttons or progress summaries.

