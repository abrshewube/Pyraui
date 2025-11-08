# Breadcrumbs

> Live demo: [`/docs/breadcrumbs`](https://pyraui.onrender.com/docs/breadcrumbs)

Breadcrumbs keep users oriented in nested experiences. PyraUI versions feature responsive truncation, icons, and accessible separators.

## Highlights

- Automatic collapsing on small viewports.
- Supports icons, tooltips, and overflow menus.
- Keyboard navigable with semantic `<nav>` markup built in.

## Quick usage

```heex
<.breadcrumbs id="docs-trail">
  <:item label="Docs" navigate={~p"/docs"} />
  <:item label="Components" navigate={~p"/docs/components"} />
  <:item label="Breadcrumbs" current />
</.breadcrumbs>
```

## Tips

- Mark the last item with `current` so screen readers announce it correctly.
- Pair with `<.menu>` or `<.dropdown>` when you need overflow behaviour beyond the provided truncation.
- Use concise labels; breadcrumbs work best when they read like a sentence.

