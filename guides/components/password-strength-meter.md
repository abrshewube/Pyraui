# Password Strength Meter

> Live demo: [`/docs/password-strength-meter`](https://pyraui.onrender.com/docs/password-strength-meter)

The password strength meter blends real-time validation with subtle motion, helping users craft secure credentials.

## Highlights

- Calculates entropy, length, and character variety for a combined score.
- Animated gradient bar and textual feedback.
- Works with LiveView validations so suggestions update immediately.

## Quick usage

```heex
<.password_strength_meter password={@form[:password].value}>
  <:tips>
    Add symbols and numbers for stronger security.
  </:tips>
</.password_strength_meter>
```

## Tips

- Run validations on every `phx-change` to keep feedback responsive.
- Provide actionable tips rather than just labeling the password “weak”.
- Pair with `<.input type="password">` for a cohesive signup experience.

