# Card Layouts

> Live demo: [`/docs/card`](https://pyraui.onrender.com/docs/card)

Cards provide elevated containers for product highlights, dashboards, and onboarding flows. PyraUI cards include structured slots for headers, content, and footers so you can stack complex layouts without fighting CSS.

## Highlights

- Glassmorphism-inspired surfaces with graceful hover motion baked in.
- Slots for `:header`, `:content`, and `:footer` keep markup clean and expressive.
- Responsive padding scales automatically between breakpoints.
- Works beautifully alongside grids, masonry layouts, and drawers.

## Quick usage

```heex
<.card class="max-w-md">
  <.card_header>
    <.card_title>Upgrade plan</.card_title>
    <.card_description>Unlock advanced analytics and collaboration.</.card_description>
  </.card_header>
  <.card_content class="space-y-4">
    <.stats value="3.2x" label="Faster iterations" tone={:indigo} />
    <.button variant={:primary}>View pricing</.button>
  </.card_content>
  <.card_footer class="text-sm text-slate-400">
    Trusted by product teams worldwide.
  </.card_footer>
</.card>
```

## Tips

- Mix cards with `Pyraui.Components.Grid.grid` for responsive galleries.
- Apply translucent backgrounds using utility classes like `bg-white/5` when stacking on dark surfaces.
- Pair cards and `<.badge>` for concise status summaries in dashboards.

