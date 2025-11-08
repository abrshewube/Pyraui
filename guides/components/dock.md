# Dock

> Live demo: [`/docs/dock`](https://pyraui.onrender.com/docs/dock)

Docked toolbars keep essential actions accessible across complex screens. Think macOS dock vibes for your admin, design, or collaboration experience.

## Highlights

- Floating glassmorphism container with magnet-like hover animations.
- Supports pill buttons, avatars, badges, and status lights.
- Optional collapse mode for mobile layouts.

## Quick usage

```heex
<.dock id="workspace-dock" position={:bottom_center}>
  <:item icon="hero-home" label="Home" active />
  <:item icon="hero-chart-bar" label="Analytics" />
  <:item icon="hero-user-group" label="Team" badge="3" />
  <:item icon="hero-bolt" label="Automations" />
</.dock>
```

## Tips

- Stick the dock to `:left` or `:right` when building creative tooling.
- Use badges sparingly—highlight only the most important notifications.
- Combine with `<.tooltip>` for verbose descriptions without crowding the UI.

