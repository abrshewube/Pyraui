# Modal Component Experiences

PyraUI’s `modal/1` component offers immersive dialogs with tone-aware styling, smooth transitions, and accessible semantics. Use this guide to wire classic confirmations, glassmorphism coaching modals, and destructive flows.

> Live demo: [`/docs/modal`](http://localhost:4000/docs/modal)

## API surface

```elixir
attr :id, :string, required: true
attr :show, :boolean, default: false
attr :on_cancel, :any
attr :variant, :atom, default: :classic, values: [:classic, :glass, :danger]
attr :size, :atom, default: :md, values: [:sm, :md, :lg, :xl]

slot :title
slot :subtitle
slot :body
slot :footer
```

## Patterns

### 1. Classic confirmation flow

```elixir
# LiveView
def handle_event("open-modal", %{"id" => id}, socket) do
  {:noreply, assign(socket, String.to_existing_atom("#{id}_open"), true)}
end

def handle_event("close-modal", %{"id" => id}, socket) do
  {:noreply, assign(socket, String.to_existing_atom("#{id}_open"), false)}
end
```

```heex
<.button variant={:primary} phx-click="open-modal" phx-value-id="archive-modal">
  Archive project
</.button>

<.modal id="archive-modal" show={@archive_modal_open}>
  <:title>Archive project?</:title>
  <:subtitle>This removes it from dashboards but keeps analytics.</:subtitle>
  <:body>
    <p class="text-sm text-slate-600">
      You can restore the project within 30 days from settings.
    </p>
  </:body>
  <:footer>
    <.button variant={:secondary} phx-click="close-modal" phx-value-id="archive-modal">Cancel</.button>
    <.button>Archive</.button>
  </:footer>
</.modal>
```

### 2. Glass coaching modal with toolbar

```heex
<.modal id="coach-modal" variant={:glass} size={:lg} show={@coach_modal_open}>
  <:title>Aura redesign playbook</:title>
  <:subtitle>Three tips to harmonize your theme across surfaces.</:subtitle>
  <:body>
    <ul class="space-y-4 text-sm text-slate-100">
      <li><strong>Contrast tokens.</strong> Anchor each surface with an 8:1 ratio.</li>
      <li><strong>Chromatic rhythm.</strong> Rotate accent colors to guide the eye.</li>
      <li><strong>Motion cue.</strong> Pair hover states with subtle Z-depth.</li>
    </ul>
  </:body>
  <:footer>
    <.button variant={:ghost} phx-click="close-modal" phx-value-id="coach-modal">Close</.button>
    <.button variant={:primary}>Show me examples</.button>
  </:footer>
</.modal>
```

### 3. Danger variant for destructive actions

```heex
<.modal id="delete-modal" variant={:danger} size={:sm} show={@delete_modal_open}>
  <:title>Delete feature flag?</:title>
  <:body>
    <p class="text-sm text-rose-100">
      This action cannot be undone. Clients relying on `checkout-flow` will lose access.
    </p>
  </:body>
  <:footer>
    <.button variant={:ghost} phx-click="close-modal" phx-value-id="delete-modal">Cancel</.button>
    <.button variant={:danger}>Delete</.button>
  </:footer>
</.modal>
```

`variant={:danger}` shifts the header accent line and backdrop to warning hues while keeping the glass motion subtle.

## Accessibility & interactions

- The component handles focus trapping and `Esc` key cancellation out of the box.
- Pass `on_cancel={JS.push("close-modal", value: %{id: "..."})}` to hook into LiveView without explicit click handlers.
- Combine with `phx-window-keydown` events on the parent LiveView to close modals when users press `Esc` anywhere.

## Design guidance

- Size presets adjust max-width: `:sm` (24rem), `:md` (32rem), `:lg` (40rem), `:xl` (48rem).
- For stacked modals, offset the `class` with `mt-20` or custom `translate-y` values to avoid overlap.
- Pair with [Table](table.md) for more-info drawers or [Date Picker](datepicker.md) to schedule actions inside the modal.

