# Avatar Groups

> Live demo: [`/docs/avatar-group`](https://pyraui.onrender.com/docs/avatar-group)

Avatar groups showcase teams, collaborators, and live participants with layered styling. Perfect for dashboards, comments, and project timelines.

## Highlights

- Automatic stacking and spacing with overflow counters.
- Supports mixed presence states and tooltips per member.
- Optional direction control for left or right stacking.

## Quick usage

```heex
<.avatar_group size={:md} members={@team_members} overlap="tight">
  <:member :for={member <- @team_members} key={member.id}>
    <.avatar src={member.photo} initials={member.initials} presence={member.status} />
  </:member>
</.avatar_group>
```

## Tips

- Use the `:overflow` slot to customize the "+5" indicator with text or icons.
- Mix sizes carefully—keeping a consistent size across the group preserves balance.
- Combine with `<.badge>` or `<.tooltip>` to describe roles and responsibilities.

