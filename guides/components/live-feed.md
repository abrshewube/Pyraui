# Live Feed

> Live demo: [`/docs/live-feed`](https://pyraui.onrender.com/docs/live-feed)

Live feeds surface real-time events with animated entry and presence cues. Great for activity dashboards, notification centers, and collaborative spaces.

## Highlights

- Stream-friendly updates with animated insertion and removal.
- Slots for avatars, media attachments, and call-to-action buttons.
- Built-in empty state styling when no events exist.

## Quick usage

```heex
<.live_feed id="activity-stream" events={@streams.events}>
  <:event :for={{dom_id, event} <- @streams.events} id={dom_id}>
    <.avatar src={event.actor.photo} initials={event.actor.initials} size={:sm} />
    <div>
      <p class="text-white/90">{event.message}</p>
      <p class="text-xs text-slate-400">{event.inserted_at}</p>
    </div>
  </:event>
</.live_feed>
```

## Tips

- Use `stream/3` with `reset: true` to refresh feeds after filtering.
- Pair with `<.toast>` for high-priority alerts that need extra attention.
- Keep messages concise to maintain the feed’s pace and readability.

