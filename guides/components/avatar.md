# Avatars

> Live demo: [`/docs/avatar`](https://pyraui.onrender.com/docs/avatar)

Avatars visualize people, teams, and brands with crisp borders and adaptable status indicators. Use them in headers, tables, and live presence dashboards.

## Highlights

- Built-in support for initials, images, and fallback gradients.
- Presence dot, ring, and pulse styles convey online states instantly.
- Sizes scale from `:xs` to `:xl` with balanced typography.

## Quick usage

```heex
<.avatar
  src={@user.photo_url}
  initials={@user.initials}
  size={:lg}
  presence={:online}
/>
```

## Tips

- Provide both `src` and `initials` to ensure a graceful fallback.
- Wrap avatars with `<.tooltip>` when you need richer hover information.
- Combine with `<.avatar_group>` for collaborative experiences.

