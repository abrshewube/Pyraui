# Skeleton Layouts

> Live demo: [`/docs/skeleton-layout`](https://pyraui.onrender.com/docs/skeleton-layout)

Skeleton layouts provide page-level placeholders for dashboards, settings, and analytics screens. Instead of individual components, you get an entire scaffold.

## Highlights

- Prebuilt header, sidebar, and content arrangements.
- Adjustable columns and section placeholders to match real pages.
- Keeps loading transitions calm and polished.

## Quick usage

```heex
<.skeleton_layout variant={:dashboard}>
  <:header />
  <:sidebar />
  <:content />
</.skeleton_layout>
```

## Tips

- Match the variant to the page structure you will eventually render.
- Swap skeletons for real content using LiveView assigns once data arrives.
- Combine with `<.progress>` or `<.toast>` to notify users about loading stages.

