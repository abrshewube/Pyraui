# Lists

> Live demo: [`/docs/list`](https://pyraui.onrender.com/docs/list)

Lists present collections with avatars, badges, and actions. They shine in inboxes, activity feeds, and settings menus.

## Highlights

- Supports dense and relaxed spacing modes.
- Item slots incorporate icons, labels, meta descriptions, and trailing actions.
- Handles selection states for navigation-driven lists.

## Quick usage

```heex
<.list id="activity-feed">
  <:item :for={event <- @events} key={event.id}>
    <.avatar src={event.actor.photo} initials={event.actor.initials} size={:sm} />
    <div>
      <p class="text-white/90">{event.title}</p>
      <p class="text-xs text-slate-400">{event.timestamp}</p>
    </div>
    <.badge tone={:violet} variant={:soft}>{event.status}</.badge>
  </:item>
</.list>
```

## Tips

- Keep icons consistent in size to preserve rhythm.
- Leverage trailing slots for toggles, buttons, or dropdown menus.
- Switch to `<.masonry_grid>` or `<.grid>` when content height varies greatly.

