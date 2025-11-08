# Live Data Table

> Live demo: [`/docs/live-data-table`](https://pyraui.onrender.com/docs/live-data-table)

The live data table renders paginated, filterable datasets that stay in sync with LiveView assigns. It excels at dashboards, admin tools, and realtime monitoring thanks to streaming-friendly updates and accessible markup.

## Highlights

- Declarative column definitions with support for icons, badges, and actions.
- Sticky headers, responsive layouts, and zebra striping available via assigns.
- Integrates with LiveView streams to update rows without re-rendering the table.
- Optional toolbar slot for search inputs, filters, and batch actions.

## Quick usage

```heex
<.live_data_table
  id="team-table"
  rows={@streams.members}
  columns={[
    %{label: "Name", field: :name},
    %{label: "Role", field: :role},
    %{label: "Status", field: :status, render: fn row -> <.badge tone={:emerald}>{row.status}</.badge> end}
  ]}
  visible_rows={8}
/>
```

## Tips

- Pair with a separate assign like `@member_count` to display totals since streams are not enumerable.
- Use the `:empty_state` slot to show a friendly message when no rows are present.
- Combine with `<.pagination>` controls or LiveView events to handle server-side paging.

