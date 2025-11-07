# PyraUI – Phoenix LiveView Component System

PyraUI is a premium, production-ready component system for Phoenix LiveView. It combines meticulously crafted HEEx components, Tailwind-powered styling, and interactive LiveView demos so teams can ship polished UIs without reinventing basic patterns.

---

## ✨ Highlights

- **100+ LiveView-first components** spanning form controls, data viz, overlays, navigation, and layout primitives
- **Zero JS build pipeline** – most interactivity is delivered via LiveView assigns and hook helpers
- **World-class docs & playground** – `/docs/*` pages showcase every component with multiple variants
- **Drop-in theming** – consistent spacing, color tokens, and glassmorphism-inspired effects out of the box
- **Hex-ready** – available from Hex with API docs on [hexdocs.pm/pyraui](https://hexdocs.pm/pyraui)

---

## 📦 Installation

Add PyraUI to your Phoenix project from Hex:

```elixir
def deps do
  [
    {:pyraui, "~> 0.1.0"}
  ]
end
```

Fetch deps:

```bash
mix deps.get
```

Wire PyraUI helpers into your web layer (usually `lib/my_app_web.ex`):

```elixir
defmodule MyAppWeb do
  use PyrauiWeb, :html

  # ...existing definitions
end
```

You now have every component available inside your HEEx templates:

```heex
<.button variant={:primary} size={:lg}>
  Launch Experience
</.button>

<.card class="max-w-md">
  <.badge variant={:solid} icon="sparkles">New</.badge>
  <h3 class="mt-4 text-xl font-semibold">Glass Panels</h3>
  <p class="mt-2 text-sm text-slate-500">
    Drag-resizable panels with frosted-glass surfaces and motion accents.
  </p>
</.card>

<.alert variant={:celebrate} badge="Ship it!" icon="party-popper">
  Your rollout finished with 0 regressions.
  <:actions>
    <.button variant={:ghost}>Share</.button>
  </:actions>
</.alert>
```

---

## 📚 Documentation & Playground

| Resource | Description |
| --- | --- |
| **Component Docs** | [hexdocs.pm/pyraui](https://hexdocs.pm/pyraui) – API reference generated via ExDoc |
| **Interactive Gallery** | Run the demo (`mix phx.server`) and visit [`http://localhost:4000/docs`](http://localhost:4000/docs) to explore every component live |
| **Guides & Recipes** | Coming soon – will cover theming, component composition, and deployment best practices |

Popular entry points in the playground:

- `/docs/alert` – richly-styled toast & alert variations with gradients and actions
- `/docs/theme-switch` – theme toggles with glass, gradient, and pill styles
- `/docs/table` – dense, outlined, and elevated tables with badges & metrics
- `/docs/live-chat` – real-time conversation UI with typing indicators & quick replies

---

## 🧩 Component Catalog (Snapshot)

| Category | Components |
| --- | --- |
| **Forms & Inputs** | `button`, `input`, `textarea`, `select`, `checkbox`, `radio`, `toggle`, `slider`, `rating`, `tag_input`, `multi_select`, `password_strength_meter`, `date_picker` |
| **Feedback & Overlays** | `alert`, `toast`, `modal`, `drawer`, `tooltip` (soon), `progress`, `badge`, `badge_card` |
| **Navigation & Layout** | `navbar`, `tabs`, `accordion`, `breadcrumbs`, `drawer`, `dock`, `stepper`, `wizard`, `card`, `skeleton`, `grid`, `masonry_grid`, `resizable_panels`, `filter_panel` |
| **Data Visualization** | `chart` (line, bar, pie, stacked), `animated_chart`, `gauge`, `heatmap`, `map`, `timeline`, `countdown` |
| **Collaboration & Social** | `live_chat`, `live_feed`, `avatar`, `avatar_group`, `connections_widget`, `user_profile_card` |
| **Productivity** | `kanban`, `gantt`, `sortable_list`, `signature_pad`, `file_upload`, `live_data_table` |

Every component ships with:

1. API (`attr`/`slot`) documentation
2. Multiple curated examples in the LiveView docs
3. Tailwind-based styling with extensible class overrides

---

## ⚡️ Quick Start (Demo App)

Clone the repo and explore the full playground locally:

```bash
git clone https://github.com/AbrhamWube/ashui.git pyraui
cd pyraui
mix deps.get
mix phx.server
```

Navigate to `http://localhost:4000` for the landing page and `http://localhost:4000/docs` for the interactive component explorer. You can tweak assigns live and see the UI respond instantly thanks to LiveView streams.

---

## 🗺 Roadmap

- [ ] Dark mode & tokenized theme support
- [ ] Rich markdown guides published to HexDocs
- [ ] Motion presets & micro-interaction utilities
- [ ] Additional chart renderers (sparkline, radar, area)
- [ ] CLI for scaffolding new components

Follow updates and contribute ideas via [GitHub issues](https://github.com/AbrhamWube/ashui/issues).

---

## 📄 License

PyraUI is released under the [Apache 2.0 License](LICENSE).
