# Buttons

> Live demo: [`/docs/button`](https://pyraui.onrender.com/docs/button)

PyraUI buttons cover everything from high-impact primary CTAs to low-profile ghost actions. Each variant ships with carefully tuned spacing, focus outlines, and motion states so interactions feel effortless and consistent.

## Highlights

- Size presets from `:xs` through `:xl` keep typography and padding balanced.
- `:primary`, `:secondary`, `:ghost`, and `:danger` variants adapt to light or dark surfaces automatically.
- Icon slots and loading spinners are built in for seamless micro-interactions.
- Works with LiveView events via `phx-click` or plain links using the `href` attribute.

## Quick usage

```heex
<.button variant={:primary} size={:lg} phx-click="launch">
  Launch experience
</.button>

<.button variant={:ghost} size={:sm} href="https://pyraui.onrender.com/docs/button" target="_blank">
  View docs
</.button>
```

## Tips

- Wrap adjacent buttons in a flex container with `gap-x-3` for balanced spacing.
- Use the `:icon` slot when you want to lead with an icon without custom markup.
- Combine with `<.button_group>` from the docs to create segmented controls or toolbars.

