# Countdown

> Live demo: [`/docs/countdown`](https://pyraui.onrender.com/docs/countdown)

Countdown timers build anticipation for launches, events, and feature unlocks. PyraUI pairs bold typography with subtle glows to make every second feel premium.

## Highlights

- Accepts datetimes or durations for dynamic ticking.
- Supports labels, subtext, and chip-style dividers.
- Works alongside LiveView events to trigger follow-up actions when the timer completes.

## Quick usage

```heex
<.countdown
  id="launch-timer"
  target={DateTime.add(DateTime.utc_now(), 86_400, :second)}
  label="Next big release"
/>
```

## Tips

- Use `handle_info/2` or `handle_event/3` to react when the countdown finishes.
- Combine with `<.hero>` or `<.card>` blocks for immersive marketing moments.
- For evergreen timers, reset the `target` assign after completion to loop.

