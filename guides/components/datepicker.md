# Date Picker Styling Guide

PyraUI’s `datepicker/1` component surfaces multiple calendar modes with soft gradients, outline variants, and size controls. This playbook covers configuration, advanced attributes, and constraint logic.

> Live demo: [`/docs/datepicker`](http://localhost:4000/docs/datepicker)

## Component attributes

```elixir
attr :id, :string, required: true
attr :name, :string
attr :label, :string
attr :value, :string
attr :type, :string, default: "date", values: ["date", "time", "datetime-local"]
attr :variant, :atom, default: :soft, values: [:soft, :outline]
attr :size, :atom, default: :md, values: [:sm, :md, :lg]
attr :icon, :boolean, default: true
attr :icon_class, :string, default: ""
attr :min, :string
attr :max, :string
attr :disabled, :boolean, default: false
attr :required, :boolean, default: false
attr :error, :string
```

## Recipes

### 1. Soft morning scheduler

```heex
<.datepicker
  id="standup-date"
  name="meeting[date]"
  label="Standup date"
  value={@meeting.date}
  hint="Schedule within the next two weeks"
  min={Date.utc_today() |> Date.add(-1) |> Date.to_iso8601()}
  max={Date.utc_today() |> Date.add(14) |> Date.to_iso8601()}
/> 
```

### 2. Outline variant with large size

```heex
<.datepicker
  id="launch-window"
  label="Launch window"
  value={@launch_at}
  variant={:outline}
  size={:lg}
  icon={false}
  placeholder="Select a date"
/> 
```

### 3. Time + datetime inputs for booking flows

```heex
<div class="grid gap-6 sm:grid-cols-2">
  <.datepicker id="start-time" label="Start time" type="time" value={@start_time} />
  <.datepicker id="end-time" label="End time" type="time" value={@end_time} />
  <.datepicker id="handoff" label="Handoff" type="datetime-local" variant={:outline} />
</div>
```

### 4. Error messaging

```heex
<.datepicker
  id="billing-cycle"
  label="Billing cycle"
  value={@form[:billing_cycle].value}
  error={@form[:billing_cycle].errors |> Enum.map(&elem(&1, 0)) |> Enum.join(", ")}
/>
```

## LiveView validation pattern

```elixir
def handle_event("validate", %{"plan" => params}, socket) do
  changeset = Plan.changeset(socket.assigns.plan, params) |> Map.put(:action, :validate)
  {:noreply, assign(socket, :form, to_form(changeset))}
end
```

```heex
<.form for={@form} id="plan-form" phx-change="validate">
  <.datepicker field={@form[:renew_on]} label="Renew on" />
</.form>
```

## Styling notes

- `variant={:soft}` adds a subtle gradient and drop shadow. `:outline` keeps the field minimal with focus rings.
- Adjust icon color by passing `icon_class="text-indigo-400"`.
- When embedding inside dark surfaces, override `class` with `bg-slate-900 text-slate-100` and set `icon_class` accordingly.

Combine with the wizard component inside the interactive docs for multi-step scheduling flows or the [Table playbook](table.md) to list upcoming reservations.

