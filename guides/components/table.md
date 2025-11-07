# Table Component Playbook

PyraUI’s `table/1` component balances dense data layouts with refined presentation. This guide outlines the available knobs, shows how to render custom cells, and explains how to handle blank states in LiveView.

> Live demo: [`/docs/table`](http://localhost:4000/docs/table)

## API highlights

```elixir
attr :rows, :list, default: []
attr :variant, :atom, default: :elevated, values: [:elevated, :outlined, :minimal]
attr :density, :atom, default: :normal, values: [:relaxed, :normal, :compact]
attr :striped, :boolean, default: false
attr :rounded, :boolean, default: true
attr :caption, :string
attr :empty_label, :string, default: "No data available"

slot :col do
  attr :label, :string, required: true
  attr :field, :atom
  attr :align, :atom, values: [:left, :center, :right]
end
```

## Recipes

### 1. Elevated directory with custom cell content

```heex
<.table
  rows={@team_members}
  caption="Product design team"
  variant={:elevated}
  density={:relaxed}
>
  <:col label="Member" :let={row}>
    <div class="flex items-center gap-3">
      <.avatar label={row.name} size="sm" />
      <div>
        <p class="font-semibold text-slate-900">{row.name}</p>
        <p class="text-xs text-slate-500">{row.role}</p>
      </div>
    </div>
  </:col>
  <:col label="Location" field={:location} />
  <:col label="Status" :let={row}>
    <.badge variant={row.status} size={:sm}>{String.capitalize(to_string(row.status))}</.badge>
  </:col>
</.table>
```

### 2. Outlined metrics with zebra striping

```heex
<.table
  rows={@metrics}
  variant={:outlined}
  striped={true}
  density={:compact}
>
  <:col label="Service" field={:service} />
  <:col label="Uptime" align={:center} :let={row}>
    <span class="font-semibold">{row.uptime}%</span>
  </:col>
  <:col label="Incidents" align={:center} field={:incidents} />
  <:col label="Trend" align={:right} :let={row}>
    <span class={trend_class(row.trend)}>{row.trend}</span>
  </:col>
</.table>
```

```elixir
defp trend_class("▲"), do: "text-emerald-600"
defp trend_class("▼"), do: "text-rose-500"
defp trend_class(_), do: "text-slate-500"
```

### 3. Minimal billing breakdown with empty state

```heex
<.table
  rows={@invoices}
  variant={:minimal}
  rounded={false}
  empty_label="No invoices yet"
>
  <:col label="Invoice" field={:number} />
  <:col label="Due" field={:due_on} />
  <:col label="Amount" align={:right} :let={row}>
    <span class="font-semibold">${row.amount}</span>
  </:col>
</.table>
```

If `@invoices` is empty, the component renders a single row containing the `empty_label` message with subtle styling.

## LiveView integration tips

- Compose `rows` on the LiveView assigns: `assign(socket, :metrics, fetch_metrics())`.
- For sortable columns, hook the header label into `phx-click` events and reorder `rows` before reassigning.
- Use the `:col` slot with `:let={row}` for computed values instead of mutating data structures.

## Theming

- Tailwind classes handle density spacing. Override with `class` to enforce team-specific rhythm.
- Toggle zebra stripes with the `striped` boolean; the component applies `odd:bg-slate-50` automatically.
- Pair with [Alert](alert.md) or [Modal](modal.md) guides for contextual actions adjacent to your table.

