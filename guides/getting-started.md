# Getting Started with PyraUI

PyraUI ships as a standard Hex dependency and integrates seamlessly with any Phoenix LiveView project. This guide walks you through installation, configuration, and a first render.

## 1. Install the Hex package

Add PyraUI to your mix dependencies and fetch it:

```elixir
# mix.exs
def deps do
  [
    {:pyraui, "~> 0.1.0"}
  ]
end
```

```bash
mix deps.get
```

## 2. Wire helpers into your web module

PyraUI exposes `PyrauiWeb` which mirrors Phoenix’s `MyAppWeb`. Import it where you declare HTML helpers (usually `lib/my_app_web.ex`):

```elixir
defmodule MyAppWeb do
  use PyrauiWeb, :html

  # your existing imports/aliases...
end
```

All PyraUI components become available to every template that uses `MyAppWeb, :html`.

## 3. Render your first component

Open any LiveView or HEEx template and drop in components:

```heex
<.button variant={:primary} icon="rocket-launch" size={:lg}>
  Deploy Changes
</.button>

<.card class="max-w-md">
  <h3 class="text-xl font-semibold">Welcome aboard</h3>
  <p class="mt-2 text-sm text-slate-500">
    You now have access to 100+ LiveView components styled with Tailwind and motion-ready tokens.
  </p>
</.card>
```

## 4. Explore the interactive docs

Run the bundled demo to browse every component variant:

```bash
mix phx.server
```

Visit [`https://pyraui.onrender.com/docs`](https://pyraui.onrender.com/docs) to open the LiveView documentation index. Each page demonstrates real-time interactions, theme switches, and code snippets you can copy straight into your application.

## 5. Next steps

- Read the component spotlights for deep dives:
  - [Alert Variants](components/alert.md)
  - [Theme Switch Gallery](components/theme-switch.md)
  - [Live Chat Experience](components/live-chat.md)
- Customize Tailwind tokens or layer PyraUI on top of your design system by overriding the `class` assign on any component.
- Join the conversation or report issues on [GitHub](https://github.com/abrshewube/Pyraui/issues).

Happy shipping! 🚀

