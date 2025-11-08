# Component Usage Patterns

> Live demo: [`/docs/usage`](https://pyraui.onrender.com/docs/usage)

The usage guide covers best practices for composing PyraUI components into polished interfaces—from consistent spacing to micro-interactions.

## Highlights

- Layout recipes for dashboards, modals, drawers, and multi-step flows.
- Guidance on pairs that work well together (e.g., `<.card>` + `<.stats>`).
- Performance tips for LiveView streams and assigns.

## Quick usage

```heex
<.section title="Realtime analytics workspace">
  <.grid columns={3} gap="xl">
    <:item><.stats value="98%" label="SLA" tone={:emerald} /></:item>
    <:item><.stats value="3.2x" label="Build speed" tone={:violet} /></:item>
    <:item><.stats value="11k" label="Active users" tone={:sky} /></:item>
  </.grid>
  <.resizable_panels>
    <:pane id="overview">
      <.animated_chart type={:line} data={@velocity} />
    </:pane>
    <:pane id="details">
      <.live_data_table rows={@streams.accounts} visible_rows={8} />
    </:pane>
  </.resizable_panels>
</.section>
```

## Tips

- Anchor layouts with consistent spacing tokens (`gap="lg"` across grids and stacks).
- Mix motion components sparingly—let primary interactions stand out.
- Favor LiveView streams for collections to keep memory usage predictable.

