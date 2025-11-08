# Stepper

> Live demo: [`/docs/stepper`](https://pyraui.onrender.com/docs/stepper)

Steppers guide users through linear flows with numbered or icon-based steps. They excel in onboarding, checkout, and verification journeys.

## Highlights

- Horizontal and vertical layouts with adaptive spacing.
- Completed and current states reinforced with color and icons.
- Works with LiveView assigns to keep the active step in sync.

## Quick usage

```heex
<.stepper current_step={@step} steps={[
  %{title: "Account"},
  %{title: "Workspace"},
  %{title: "Invite team"},
  %{title: "Finish"}
]}/>
```

## Tips

- Provide concise titles; add optional subtitles if extra context is needed.
- Pair with `<.wizard>` to combine high-level progress and detailed screens.
- Keep the number of steps reasonable (3–5) to maintain momentum.

