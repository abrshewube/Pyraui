# Tabs

> Live demo: [`/docs/tabs`](https://pyraui.onrender.com/docs/tabs)

Tabs organize content into digestible sections with animated indicators and keyboard-friendly navigation.

## Highlights

- Variants for underline, pill, and block styles.
- Supports icons, badges, and counts within tab labels.
- Integrates with LiveView to load panels lazily or instantaneously.

## Quick usage

```heex
<.tabs id="billing-tabs" current={@tab}>
  <:tab id="overview" label="Overview" />
  <:tab id="usage" label="Usage">
    <.badge tone={:emerald} variant={:soft}>New</.badge>
  </:tab>
  <:tab id="invoices" label="Invoices" />
</.tabs>
```

## Tips

- Keep tab labels short and descriptive; use tooltips for extra context.
- Handle tab changes server-side with `phx-click` or `phx-change` to fetch data on demand.
- Pair with `<.card>` or `<.grid>` to structure content inside panels.

