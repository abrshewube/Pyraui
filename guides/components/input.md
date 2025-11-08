# Inputs

> Live demo: [`/docs/input`](https://pyraui.onrender.com/docs/input)

Inputs are the foundation of PyraUI forms. They feature floating labels, helper text, and validation feedback styled for modern SaaS.

## Highlights

- Types for text, email, password, number, and more with consistent styling.
- Error and success states with iconography and color-coded borders.
- Optional prefix/suffix slots for icons or units.

## Quick usage

```heex
<.input
  field={@form[:email]}
  type="email"
  label="Work email"
  placeholder="you@studio.app"
  autofocus
/>
```

## Tips

- Always drive K/V pairs from `to_form/2` assigns to keep errors in sync.
- Use prefixes for icons like `hero-envelope` to reinforce affordances.
- Pair with `<.progress>` or `<.password_strength_meter>` for secure flows.

