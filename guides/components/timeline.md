# Timeline

> Live demo: [`/docs/timeline`](https://pyraui.onrender.com/docs/timeline)

Timelines communicate project history, release cadence, and audit trails with elegant vertical markers.

## Highlights

- Supports icons, badges, and avatars per milestone.
- Alternating alignment or single-column options.
- Works with LiveView streams for real-time event inserts.

## Quick usage

```heex
<.timeline id="release-history">
  <:event :for={release <- @releases} key={release.id}>
    <.badge tone={:sky} variant={:soft}>{release.version}</.badge>
    <p class="text-white/90">{release.title}</p>
    <p class="text-xs text-slate-400">{release.date}</p>
  </:event>
</.timeline>
```

## Tips

- Keep entries concise; link to detail pages for deeper context.
- Use icons to communicate event type (deploy, incident, announcement).
- Pair with `<.diff>` or `<.live_feed>` for additional context around each milestone.

