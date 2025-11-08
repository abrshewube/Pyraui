# Filter Panel

> Live demo: [`/docs/filter-panel`](https://pyraui.onrender.com/docs/filter-panel)

Filter panels orchestrate complex query controls with smart defaults and polished UI. Use them for analytics dashboards, product catalogs, and admin lists.

## Highlights

- Sections, chips, and reset buttons ready for immediate use.
- Works with LiveView events to update results without page reloads.
- Responsive layout keeps inputs accessible on mobile and desktop.

## Quick usage

```heex
<.filter_panel id="analytics-filter" form={@form} phx-change="change_filter" phx-submit="apply_filter">
  <:section title="Timeline">
    <.select field={@form[:range]} options={@ranges} />
  </:section>
  <:section title="Channels">
    <.tag_input field={@form[:channels]} suggestions={@channel_suggestions} />
  </:section>
</.filter_panel>
```

## Tips

- Provide a `phx-change` handler to reflect quick filter changes in real time.
- Pair with `<.badge>` or `<.chip>` to show active filters outside the panel.
- Add analytics by tracking which filters are applied and how often.

