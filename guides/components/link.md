# Links

> Live demo: [`/docs/link`](https://pyraui.onrender.com/docs/link)

PyraUI links transform standard anchors into branded interactions with focus rings, underline animations, and icon support.

## Highlights

- Variants for inline, button-like, and subtle navigation links.
- Optional leading or trailing icons with automatic spacing.
- Accessible focus states ensure keyboard navigation shines.

## Quick usage

```heex
<.link href="https://pyraui.onrender.com/docs" class="text-sky-400 hover:text-sky-300">
  Explore the docs
  <.icon name="hero-arrow-up-right" class="h-4 w-4" />
</.link>
```

## Tips

- Use `navigate` or `patch` assigns for LiveView-aware navigation.
- Reserve brightest colors for primary actions to maintain hierarchy.
- Pair with `<.icon>` to reinforce external actions or file downloads.

