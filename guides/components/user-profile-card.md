# User Profile Card

> Live demo: [`/docs/user-profile-card`](https://pyraui.onrender.com/docs/user-profile-card)

User profile cards showcase team members with avatars, roles, stats, and social actions. They fit perfectly in team directories, invite flows, and onboarding moments.

## Highlights

- Hero area for cover images or gradients.
- Slots for bio, action buttons, and metrics.
- Responsive layout adapts to sidebars or modals.

## Quick usage

```heex
<.user_profile_card user={@user}>
  <:actions>
    <.button variant={:primary} size={:sm}>Invite to project</.button>
    <.button variant={:ghost} size={:sm}>Message</.button>
  </:actions>
  <:metrics>
    <.stats value="24" label="Projects" tone={:emerald} />
    <.stats value="4.9" label="Rating" tone={:amber} />
  </:metrics>
</.user_profile_card>
```

## Tips

- Include social badges (GitHub, LinkedIn) to encourage networking.
- Keep bios concise and highlight role-specific expertise.
- Pair with `<.connections_widget>` to show related team members.

