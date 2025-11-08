# Radio Buttons

> Live demo: [`/docs/radio`](https://pyraui.onrender.com/docs/radio)

Radio groups help users pick one option from a set with polished focus rings and expressive states. Perfect for pricing tiers, notification preferences, and onboarding questions.

## Highlights

- Supports stacked or horizontal layouts.
- Optional description and icon slots per option.
- Integrates tightly with LiveView forms and validations.

## Quick usage

```heex
<.radio
  field={@form[:plan]}
  options={[
    %{label: "Starter", value: "starter", description: "Essential features"},
    %{label: "Growth", value: "growth", description: "Advanced automation"},
    %{label: "Scale", value: "scale", description: "Enterprise grade"}
  ]}
/>
```

## Tips

- Keep option labels concise while using descriptions for supporting info.
- Use icons to add personality—e.g., `hero-sparkles` for premium tiers.
- Pair with `<.conditional_form>` to reveal follow-up questions based on selection.

