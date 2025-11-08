# Theme Switch Component Spotlight

The `theme_toggle/1` component lets users flip between light, dark, and custom modes with delightful micro-interactions. This guide covers the available variants, integrating with LiveView assigns, and tying toggle events into your own theme logic.

> Live demo: [`/docs/theme-switch`](https://pyraui.onrender.com/docs/theme-switch)

## Variants at a glance

PyraUI ships five toggle skins, each tuned for different surfaces:

| Variant | Description |
| --- | --- |
| `:solid` | Bold background, ideal for dashboards |
| `:glass` | Translucent glass with blur—pairs with frosted layouts |
| `:outline` | Minimal ring, perfect for subtle toolbars |
| `:gradient` | Animated gradient sweep with glow |
| `:pill` | Rounded pill with icon and label stacking |

Each variant also respects `size` (`:xs` – `:xl`), `icon_style` (`:dual`, `:emoji`, `:dots`), and `label_position` (`:inline`, `:stacked`).

## Example: stacked gradient toggle

```heex
<.theme_toggle
  name="app-theme"
  variant={:gradient}
  icon_style={:dual}
  label="Interface Theme"
  label_position={:stacked}
  hint="Choose the vibe to match your environment"
  current_theme={@theme}
  size={:lg}
/> 
```

## Hooking into LiveView state

The component emits `phx-change` events with the selected theme. Here’s a simple pattern using the supplied helper hook:

```elixir
def handle_event("theme-toggle", %{"theme" => theme}, socket) do
  socket =
    socket
    |> assign(:theme, theme)
    |> push_event("set-theme", %{theme: theme})

  {:noreply, socket}
end
```

```heex
<.theme_toggle
  id="primary-theme-toggle"
  name="theme"
  current_theme={@theme}
  variant={:glass}
  icon_style={:emoji}
  phx-change="theme-toggle"
/>
```

On the client, PyraUI’s `ThemeToggleHook` updates CSS variables so Tailwind classes react instantly.

## Custom copy & quick actions

Use the `hint` and `macro` buttons to create contextual prompts:

```heex
<.theme_toggle
  id="workspace-theme"
  label="Workspace style"
  hint="Light for focus, dark for night flights"
  variant={:pill}
  icon_style={:dots}
  actions={[{ "Light", "light" }, { "Glow", "neon" }, { "Dark", "dark" }]}
  phx-change="theme-toggle"
/>
```

## Styling tips

- Override colors by targeting the toggle ID/class in your Tailwind CSS file and setting custom gradients or shadows.
- To disable transitions entirely, set `class="transition-none"` on the component.
- Combine with `theme_config` components inside the docs to present full theme dashboards.

Browse the interactive examples in the docs to copy/paste layouts ranging from minimalist toggles to cinematic onboarding prompts.

