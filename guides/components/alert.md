# Alert Component Spotlight

PyraUI’s `alert/1` component delivers cinematic notifications built for LiveView—complete with badges, action slots, and glassmorphism effects. This guide walks through the API, real-world configurations, and how to tie alerts to runtime assigns.

> Live demo: run the playground and open [`/docs/alert`](https://pyraui.onrender.com/docs/alert) for hover previews and dismissible interactions.

## API overview

```elixir
attr :variant, :atom,
  default: :neutral,
  values: [:neutral, :note, :celebrate, :info, :warning, :danger]

attr :badge, :string
attr :icon, :string
slot :actions
```

- **`variant`** tunes the palette, glow, and accent bar.
- **`badge`** renders a pill above the headline—great for status codes or tags.
- **`icon`** accepts any Heroicons glyph (PyraUI bundles the optimized set).
- **`actions` slot** positions CTA buttons to the right of the content block.

## Quick recipes

### 1. Product launch celebration

```heex
<.alert variant={:celebrate} badge="Success" icon="sparkles">
  <h3 class="text-lg font-semibold">Launch deployed worldwide</h3>
  <p class="mt-1 text-sm text-indigo-50/80">
    Zero regressions detected. All regions picked up version 5.3.1.
  </p>
  <:actions>
    <.button variant={:ghost} size={:sm}>Share update</.button>
    <.button size={:sm}>Open release notes</.button>
  </:actions>
</.alert>
```

### 2. Inline validation error

```heex
<.alert variant={:danger} icon="exclamation-triangle">
  Please resolve the highlighted fields before submitting the form.
</.alert>
```

### 3. Sticky system banner

```heex
<.alert variant={:note} badge="Scheduled">
  We will upgrade database clusters on Saturday at 02:00 UTC. Expect 3–5 minutes of read-only mode.
</.alert>
```

## Wiring alerts to LiveView assigns

Pair the component with a simple assign to render contextual feedback:

```elixir
def handle_event("save", params, socket) do
  case Accounts.update_profile(socket.assigns.user, params) do
    {:ok, _profile} ->
      {:noreply, assign(socket, :flash_alert,
        {:celebrate, "Profile updated", "Your new settings are live."}
      )}

    {:error, changeset} ->
      {:noreply, socket |> assign(:changeset, changeset) |> assign(:flash_alert,
        {:danger, "Update failed", "Please review the highlighted errors."}
      )}
  end
end
```

```heex
<%= if {@flash_alert && {variant, title, body} = @flash_alert} do %>
  <.alert variant={variant} icon={variant == :danger && "shield-exclamation"}
          badge={variant == :celebrate && "Success"}>
    <h3 class="text-base font-semibold">{title}</h3>
    <p class="text-sm opacity-80">{body}</p>
  </.alert>
<% end %>
```

## Design notes

- Alerts use Tailwind utility tokens. To theme them globally, override classes via the `class` assign or update Tailwind layers in `assets/css/app.css`.
- Badges inherit the variant palette—set `badge=""` to render the accent bar without text.
- Animations (hover lift, glow) are controlled by utility classes. Removing them is as easy as adding `class="shadow-none"`.

Continue exploring the live documentation for additional variants like dismissible banners, stacked alerts, and compact inline notices.

