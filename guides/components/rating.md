# Rating

> Live demo: [`/docs/rating`](https://pyraui.onrender.com/docs/rating)

Rating inputs collect feedback with customizable icons, half-step support, and animated fills—great for reviews, surveys, and satisfaction tracking.

## Highlights

- Supports stars, hearts, emojis, and custom icon sets.
- Keyboard-accessible with clear focus outlines.
- Emits LiveView events for instant persistence.

## Quick usage

```heex
<.rating
  id="session-rating"
  value={@rating}
  max={5}
  on_change="rate_session"
  icon="hero-star"
/>
```

## Tips

- Persist ratings as soon as they change to avoid losing feedback on disconnect.
- Use tooltips to label each rating step (e.g., “Loved it!”, “Needs work”).
- Pair with `<.textarea>` for optional freeform feedback.

