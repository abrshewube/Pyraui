defmodule PyrauiWeb.LandingLive do
  use PyrauiWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    feature_cards = [
      %{
        icon: "hero-bolt",
        title: "Realtime-ready",
        description:
          "Phoenix-native components tuned for WebSocket throughput and LiveView streaming.",
        gradient: "from-purple-500/20 to-blue-500/20"
      },
      %{
        icon: "hero-paint-brush",
        title: "Beautifully styled",
        description:
          "Tailwind-first design language with premium defaults and effortless customization.",
        gradient: "from-amber-500/20 to-orange-500/20"
      },
      %{
        icon: "hero-puzzle-piece",
        title: "60+ components",
        description:
          "From foundational inputs to advanced data visualizations and workspace surfaces.",
        gradient: "from-emerald-500/20 to-teal-500/20"
      },
      %{
        icon: "hero-wrench-screwdriver",
        title: "Plug & play",
        description:
          "Drop-in APIs, ergonomic slots, and presets that ship with production-ready polish.",
        gradient: "from-rose-500/20 to-pink-500/20"
      },
      %{
        icon: "hero-book-open",
        title: "Typed & documented",
        description:
          "Comprehensive guides, typed assigns, and executable examples for every component.",
        gradient: "from-indigo-500/20 to-purple-500/20"
      },
      %{
        icon: "hero-rocket-launch",
        title: "Performance first",
        description: "Optimized for minimal bundle size and lightning-fast LiveView updates.",
        gradient: "from-cyan-500/20 to-blue-500/20"
      }
    ]

    nav_links = [
      %{label: "Docs", navigate: ~p"/docs"},
      %{label: "Components", navigate: ~p"/docs/components"},
      %{label: "Playground", href: "https://demo.ashui.dev"},
      %{label: "Roadmap", navigate: ~p"/docs/roadmap"},
      %{label: "GitHub", href: "https://github.com/abrshewube/Pyraui", target: "_blank"}
    ]

    component_gallery = [
      %{
        category: "Basics",
        description: "Buttons, inputs, alerts, and form patterns designed for clarity and speed.",
        preview: :basics,
        gradient: "from-blue-500/10 to-cyan-500/10",
        code: """
        <.button variant={:primary}>Save changes</.button>
        <.input type="email" label="Work email" placeholder="you@studio.app" />
        <.alert variant={:success}>Deployment ready</.alert>
        """
      },
      %{
        category: "Layout",
        description: "Cards, modals, grids, and responsive shells that snap into place.",
        preview: :layout,
        gradient: "from-purple-500/10 to-pink-500/10",
        code: """
        <.card class="max-w-md">
          <.card_header>
            <.card_title>Launch checklist</.card_title>
            <.card_description>Stay on schedule.</.card_description>
          </.card_header>
          <.card_content>
            <.stack>
              <.checkbox label="Wireframe flow" checked />
              <.checkbox label="QA critical paths" />
            </.stack>
          </.card_content>
        </.card>
        """
      },
      %{
        category: "Data Display",
        description: "Tables, charts, stats, and dashboards tuned for live data.",
        preview: :data_display,
        gradient: "from-emerald-500/10 to-teal-500/10",
        code: """
        <.live_data_table rows={rows} columns={columns} visible_rows={5} />
        """
      },
      %{
        category: "Interactive",
        description: "Carousels, wizards, toasts, and flows that feel delightful.",
        preview: :interactive,
        gradient: "from-amber-500/10 to-orange-500/10",
        code: """
        <.wizard current_step={2} total_steps={4}>
          <:step title="Design review" />
        </.wizard>
        <.toast variant={:info}>Asset synced live.</.toast>
        """
      },
      %{
        category: "Advanced",
        description: "Maps, live feeds, file uploads, rich text editors, and beyond.",
        preview: :advanced,
        gradient: "from-rose-500/10 to-pink-500/10",
        code: """
        <Pyraui.Components.Gantt.gantt tasks={tasks} />
        <Pyraui.Components.LiveDataTable.live_data_table rows={rows} />
        """
      },
      %{
        category: "Navigation",
        description: "Sidebars, tabs, breadcrumbs, and menus with smooth transitions.",
        preview: :navigation,
        gradient: "from-indigo-500/10 to-purple-500/10",
        code: """
        <.sidebar>
          <:item icon="hero-home" active>Dashboard</:item>
          <:item icon="hero-chart-bar">Analytics</:item>
          <:item icon="hero-cog">Settings</:item>
        </.sidebar>
        """
      }
    ]

    integration_highlights = [
      %{
        name: "Phoenix LiveView",
        description: "Optimized assigns, diff-friendly components, and stream-ready collections.",
        version: ">= 1.7",
        icon: "hero-fire",
        gradient: "from-orange-500/20 to-red-500/20"
      },
      %{
        name: "Tailwind CSS",
        description: "Tailwind v4 tokens with layered design system and responsive choreography.",
        version: ">= 4.0",
        icon: "hero-paint-brush",
        gradient: "from-cyan-500/20 to-blue-500/20"
      },
      %{
        name: "Ecto + Ash Framework",
        description: "Data-driven workflows with Ash resources and live-backed forms.",
        version: "Ash >= 3.0",
        icon: "hero-cube-transparent",
        gradient: "from-purple-500/20 to-indigo-500/20"
      },
      %{
        name: "Phoenix Presence",
        description:
          "Built-in presence tracking with beautiful UI components for live user states.",
        version: ">= 1.5",
        icon: "hero-user-group",
        gradient: "from-emerald-500/20 to-green-500/20"
      }
    ]

    testimonials = [
      %{
        quote:
          "PyraUI made our Phoenix LiveView dashboard feel like a polished SaaS in a weekend. The component API is incredibly intuitive.",
        author: "Marina Chen",
        role: "Principal Engineer, Northwind Labs",
        avatar: "/images/avatars/marina.jpg"
      },
      %{
        quote:
          "Finally, a Tailwind UI for Elixir that embraces realtime UX. The micro-interactions and animations are absolutely stunning.",
        author: "Devon Ortiz",
        role: "Founder, Beamship",
        avatar: "/images/avatars/devon.jpg"
      },
      %{
        quote:
          "The docs + live playground meant onboarding the team took hours, not days. Game-changer for Phoenix development.",
        author: "Elias Wolde",
        role: "Lead Designer, Emberline",
        avatar: "/images/avatars/elias.jpg"
      },
      %{
        quote:
          "Performance is incredible. Our dashboard loads 3x faster with PyraUI compared to our previous custom solution.",
        author: "Sophie Zhang",
        role: "Engineering Manager, Quantum Labs",
        avatar: "/images/avatars/sophie.jpg"
      }
    ]

    install_commands = [
      %{
        label: "Install CLI archive",
        cmd: "mix archive.install hex ashui",
        icon: "hero-command-line"
      },
      %{label: "Add to mix.exs", cmd: "{:pyraui, \"~> 0.1.0\"}", icon: "hero-cog"},
      %{
        label: "Import components",
        cmd: "import Pyraui.Components.{Button, Input}",
        icon: "hero-code-bracket"
      }
    ]

    quickstart_code = """
    defmodule MyAppWeb.HelloLive do
      use MyAppWeb, :live_view
      import Pyraui.Components.{Button, Card, Input}

      def render(assigns) do
        ~H\"\"\"
        <Layouts.app flash={@flash}>
          <div class=\"p-10 space-y-8\">
            <Card.card class=\"max-w-md\">
              <Card.card_header>
                <Card.card_title>Welcome to PyraUI</Card.card_title>
                <Card.card_description>
                  Start building beautiful LiveView apps instantly.
                </Card.card_description>
              </Card.card_header>
              <Card.card_content class=\"space-y-4\">
                <Input.input
                  type=\"email\"
                  label=\"Work email\"
                  placeholder=\"you@studio.app\"
                />
                <Button.button variant={:primary} size={:lg}>
                  Get started with PyraUI
                </Button.button>
              </Card.card_content>
            </Card.card>
          </div>
        </Layouts.app>
        \"\"\"
      end
    end
    """

    socket =
      socket
      |> assign(:feature_cards, feature_cards)
      |> assign(:nav_links, nav_links)
      |> assign(:component_gallery, component_gallery)
      |> assign(:integration_highlights, integration_highlights)
      |> assign(:testimonials, testimonials)
      |> assign(:install_commands, install_commands)
      |> assign(:quickstart_code, quickstart_code)
      |> assign(:demo_clicks, 0)
      |> assign(:demo_modal_open?, false)
      |> assign(:demo_toast, nil)
      |> assign(:copy_feedback, nil)
      |> assign(:active_tab, "all")

    {:ok, socket}
  end

  @impl true
  def handle_event("demo_increment", _params, socket) do
    {:noreply, update(socket, :demo_clicks, &(&1 + 1))}
  end

  @impl true
  def handle_event("demo_toggle_modal", _params, socket) do
    {:noreply, update(socket, :demo_modal_open?, &(!&1))}
  end

  @impl true
  def handle_event("demo_trigger_toast", _params, socket) do
    Process.send_after(self(), :clear_toast, 2500)

    {:noreply,
     socket
     |> assign(:demo_toast, "Live update shipped in real-time ⚡")
     |> assign(:copy_feedback, nil)}
  end

  @impl true
  def handle_event("copy_gallery_code", %{"component" => component}, socket) do
    Process.send_after(self(), {:clear_copy_feedback, component}, 2000)

    {:noreply, assign(socket, :copy_feedback, component)}
  end

  @impl true
  def handle_event("set_active_tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, :active_tab, tab)}
  end

  @impl true
  def handle_info(:clear_toast, socket) do
    {:noreply, assign(socket, :demo_toast, nil)}
  end

  @impl true
  def handle_info({:clear_copy_feedback, component}, socket) do
    if socket.assigns.copy_feedback == component do
      {:noreply, assign(socket, :copy_feedback, nil)}
    else
      {:noreply, socket}
    end
  end

  defp copy_button_class(category, copy_feedback) do
    base =
      "border border-white/20 px-4 py-2.5 text-sm font-semibold text-white/90 transition-all duration-300 hover:scale-105 hover:bg-white/10 backdrop-blur-sm"

    accent =
      " border-emerald-400 text-emerald-300 bg-emerald-500/20 shadow-lg shadow-emerald-500/25"

    if copy_feedback == category do
      base <> accent
    else
      base
    end
  end

  defp tab_class(active_tab, tab) do
    base = "px-6 py-3 rounded-2xl text-sm font-semibold transition-all duration-300 transform"

    if active_tab == tab do
      base <> " bg-white/10 text-white shadow-lg shadow-blue-500/25 backdrop-blur-sm scale-105"
    else
      base <> " text-white/70 hover:text-white hover:bg-white/5"
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="relative overflow-hidden bg-slate-950">
        <!-- Animated background elements -->
        <div class="absolute inset-0 -z-10">
          <div class="absolute -top-40 -right-32 h-80 w-80 rounded-full bg-blue-500/10 blur-3xl">
          </div>
          <div class="absolute top-1/3 -left-20 h-60 w-60 rounded-full bg-purple-500/10 blur-3xl">
          </div>
          <div class="absolute bottom-0 right-1/4 h-96 w-96 rounded-full bg-cyan-500/10 blur-3xl">
          </div>
          <div class="absolute -bottom-20 left-1/3 h-64 w-64 rounded-full bg-emerald-500/10 blur-3xl">
          </div>

    <!-- Grid pattern -->
          <div class="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:64px_64px] [mask-image:radial-gradient(ellipse_80%_50%_at_50%_0%,black,transparent)]">
          </div>
        </div>

    <!-- Header -->
        <header class="relative z-10 px-6 pt-10 md:px-12 xl:px-20">
          <div class="mx-auto flex max-w-7xl items-center justify-between gap-6">
            <.link
              navigate={~p"/"}
              class="flex items-center gap-4 text-sm font-semibold uppercase tracking-[0.35em] text-white/90 transition hover:text-white"
            >
              <div class="flex h-14 w-14 items-center justify-center rounded-full bg-white shadow-xl shadow-blue-500/30">
                <img
                  src={~p"/images/pyraui-logo.png"}
                  alt="PyraUI logo"
                  class="h-11 w-11 object-contain"
                />
              </div>
              PyraUI
            </.link>

            <nav class="hidden items-center gap-8 text-sm font-semibold text-white/70 lg:flex">
              <%= for nav <- @nav_links do %>
                <.link
                  :if={nav[:navigate]}
                  navigate={nav.navigate}
                  class="transition-colors duration-200 hover:text-white"
                >
                  {nav.label}
                </.link>
                <.link
                  :if={nav[:href]}
                  href={nav.href}
                  target={nav[:target]}
                  class="transition-colors duration-200 hover:text-white"
                >
                  {nav.label}
                </.link>
              <% end %>
            </nav>

            <div class="hidden items-center lg:flex">
              <Pyraui.Components.Button.button
                variant={:primary}
                size={:sm}
                class="px-5 py-2 text-sm font-semibold shadow-lg shadow-blue-500/30 hover:shadow-blue-400/40 transition hover:-translate-y-0.5"
                navigate={~p"/docs/getting-started"}
                id="header-cta"
              >
                Launch PyraUI
              </Pyraui.Components.Button.button>
            </div>

            <div class="flex items-center lg:hidden">
              <Pyraui.Components.Button.button
                variant={:ghost}
                size={:sm}
                class="border border-white/10 px-4 py-2 text-xs font-semibold text-white/90 hover:bg-white/10"
                navigate={~p"/docs"}
                id="header-mobile-cta"
              >
                Docs
              </Pyraui.Components.Button.button>
            </div>
          </div>
        </header>

    <!-- Hero Section -->
        <section class="relative isolate px-6 pt-32 pb-40 md:px-12 xl:px-20 overflow-hidden">
          <!-- Floating elements -->
          <div class="absolute top-20 left-10 animate-float">
            <div class="w-4 h-4 bg-blue-400 rounded-full blur-sm"></div>
          </div>
          <div class="absolute top-40 right-20 animate-float-delayed">
            <div class="w-6 h-6 bg-purple-400 rounded-full blur-sm"></div>
          </div>
          <div class="absolute bottom-40 left-1/4 animate-float-slow">
            <div class="w-3 h-3 bg-cyan-400 rounded-full blur-sm"></div>
          </div>

          <div class="mx-auto grid max-w-7xl items-center gap-20 lg:grid-cols-2">
            <div class="text-slate-100 relative">
              <!-- Hero badge -->
              <div class="inline-flex items-center gap-3 rounded-2xl border border-white/10 bg-gradient-to-r from-blue-500/10 to-purple-500/10 px-6 py-3 text-sm font-semibold uppercase tracking-wide text-blue-200 backdrop-blur-sm shadow-lg shadow-blue-500/10 mb-8 animate-pulse">
                <.icon name="hero-sparkles" class="h-5 w-5" />
                <span>Introducing PyraUI 1.0</span>
              </div>

              <h1 class="text-5xl font-bold tracking-tight text-white sm:text-7xl bg-gradient-to-br from-white via-blue-100 to-cyan-200 bg-clip-text text-transparent leading-tight">
                Build Stunning
                <span class="bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">
                  LiveView
                </span>
                Apps
              </h1>

              <p class="mt-8 text-xl text-slate-300 leading-relaxed max-w-2xl">
                The most <span class="text-cyan-300 font-semibold">beautiful</span>, <span class="text-purple-300 font-semibold">reactive</span>, and
                <span class="text-blue-300 font-semibold">performant</span>
                UI library for Phoenix.
                Prebuilt components that feel amazing out of the box.
              </p>

    <!-- CTA Buttons -->
              <div class="mt-12 flex flex-wrap items-center gap-4">
                <Pyraui.Components.Button.button
                  variant={:primary}
                  size={:xl}
                  class="px-10 py-4 text-lg font-semibold shadow-2xl shadow-blue-500/40 hover:shadow-blue-400/60 transition-all duration-300 hover:scale-105 group relative overflow-hidden"
                  navigate={~p"/docs/getting-started"}
                  id="cta-get-started"
                >
                  <span class="relative z-10 flex items-center gap-2">
                    Get Started
                    <.icon
                      name="hero-arrow-right"
                      class="h-5 w-5 group-hover:translate-x-1 transition-transform"
                    />
                  </span>
                  <div class="absolute inset-0 bg-gradient-to-r from-blue-600 to-cyan-600 transition-opacity group-hover:from-blue-500 group-hover:to-cyan-500">
                  </div>
                </Pyraui.Components.Button.button>

                <Pyraui.Components.Button.button
                  variant={:ghost}
                  size={:xl}
                  class="px-10 py-4 text-lg font-semibold text-white/90 border-white/20 hover:bg-white/10 hover:border-white/30 backdrop-blur-sm transition-all duration-300 hover:scale-105"
                  href="https://github.com/abrshewube/Pyraui"
                  id="cta-view-github"
                  target="_blank"
                >
                  <span class="flex items-center gap-2">
                    <.icon name="hero-star" class="h-5 w-5 text-amber-400" /> Star on GitHub
                  </span>
                </Pyraui.Components.Button.button>
              </div>
            </div>

    <!-- Hero Visual -->
            <div class="relative">
              <!-- Main card -->
              <div class="relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/80 via-slate-900/60 to-slate-900/40 p-8 shadow-2xl shadow-blue-500/20 backdrop-blur-xl transform hover:scale-[1.02] transition-all duration-500">
                <!-- Animated border -->
                <div class="absolute inset-0 rounded-3xl bg-gradient-to-r from-blue-500/20 via-purple-500/20 to-cyan-500/20 animate-pulse">
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-slate-900/95"></div>

                <div class="relative z-10">
                  <div class="flex items-center justify-between text-xs uppercase tracking-wide text-slate-400">
                    <span class="flex items-center gap-2">
                      <span class="h-2 w-2 animate-pulse rounded-full bg-emerald-400"></span>
                      Live Dashboard
                    </span>
                    <span class="inline-flex items-center gap-2 rounded-full bg-gradient-to-r from-blue-500/20 to-cyan-500/20 px-3 py-1 text-[0.6rem] font-semibold text-cyan-200 backdrop-blur-sm">
                      Live preview
                    </span>
                  </div>

                  <div class="mt-8 grid gap-6">
                    <!-- Stats row -->
                    <div class="grid grid-cols-3 gap-4">
                      <div
                        :for={_i <- 1..3}
                        class="rounded-2xl border border-white/5 bg-gradient-to-br from-blue-500/10 to-purple-500/10 p-4 backdrop-blur-sm"
                      >
                        <div class="text-xs uppercase text-blue-200">Metric</div>
                        <div class="mt-2 text-2xl font-semibold text-white">
                          {Enum.random(100..999)}
                        </div>
                        <div class="mt-1 text-[0.6rem] text-slate-400">+{Enum.random(5..15)}%</div>
                      </div>
                    </div>

    <!-- Chart preview -->
                    <div class="rounded-2xl border border-white/5 bg-gradient-to-br from-slate-900/80 to-slate-900/60 p-4 backdrop-blur-sm">
                      <div class="flex items-center justify-between">
                        <div class="text-xs uppercase text-slate-400">Performance</div>
                        <div class="flex gap-1 text-[0.6rem]">
                          <span class="rounded-full bg-emerald-500/20 px-2 py-1 text-emerald-300">
                            Live
                          </span>
                        </div>
                      </div>
                      <div class="mt-4 flex items-end gap-1 h-12">
                        <div
                          :for={height <- [20, 32, 28, 40, 24, 36, 30, 26, 38, 22]}
                          class="flex-1 rounded-t bg-gradient-to-t from-blue-500 to-cyan-400 opacity-80 transition-all duration-500 hover:opacity-100"
                          style={"height: #{height}px"}
                        >
                        </div>
                      </div>
                    </div>

    <!-- Components preview -->
                    <div class="rounded-2xl border border-white/5 bg-gradient-to-br from-slate-900/80 to-slate-900/60 p-4 backdrop-blur-sm">
                      <div class="text-xs uppercase text-slate-400">Components</div>
                      <div class="mt-3 flex flex-wrap gap-2">
                        <span
                          :for={name <- ~w(Button Table Chart Modal Toast Form)}
                          class="rounded-full bg-white/5 px-3 py-1.5 text-xs text-slate-300 backdrop-blur-sm border border-white/5"
                        >
                          {name}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

    <!-- Floating elements around card -->
              <div class="absolute -top-4 -right-4 w-8 h-8 bg-purple-400 rounded-full blur-xl animate-pulse">
              </div>
              <div class="absolute -bottom-4 -left-4 w-6 h-6 bg-cyan-400 rounded-full blur-xl animate-pulse delay-1000">
              </div>
            </div>
          </div>
        </section>

    <!-- Features Section -->
        <section class="relative py-32 overflow-hidden">
          <!-- Background -->
          <div class="absolute inset-0 bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_80%_at_50%_-20%,rgba(120,119,198,0.15),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="text-center">
              <p class="text-sm font-semibold uppercase tracking-[0.35em] text-blue-400">
                Why PyraUI?
              </p>
              <h2 class="mt-6 text-4xl font-bold text-white sm:text-5xl">
                Built for the modern
                <span class="bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">
                  web experience
                </span>
              </h2>
              <p class="mt-6 max-w-2xl mx-auto text-lg text-slate-300">
                Every component is engineered for performance, accessibility, and that premium feel your users deserve.
              </p>
            </div>

            <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-3">
              <div
                :for={feature <- @feature_cards}
                class="group relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/60 to-slate-900/40 p-8 backdrop-blur-xl transition-all duration-500 hover:scale-105 hover:border-white/20 hover:shadow-2xl"
                style="box-shadow: 0 0 80px -20px rgba(99, 102, 241, 0.3);"
              >
                <!-- Gradient overlay -->
                <div class={"absolute inset-0 bg-gradient-to-br #{feature.gradient} opacity-0 group-hover:opacity-100 transition-opacity duration-500"}>
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-slate-900/95"></div>

                <div class="relative z-10">
                  <div class="inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-white/5 text-white shadow-lg backdrop-blur-sm transition-all duration-300 group-hover:scale-110 group-hover:bg-white/10">
                    <.icon name={feature.icon} class="h-8 w-8" />
                  </div>
                  <h3 class="mt-6 text-xl font-semibold text-white">{feature.title}</h3>
                  <p class="mt-3 text-sm leading-relaxed text-slate-300">{feature.description}</p>
                </div>
              </div>
            </div>
          </div>
        </section>

    <!-- Interactive Demo Section -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-br from-slate-900 via-slate-950 to-blue-950">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_50%_at_50%_50%,rgba(56,189,248,0.1),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="grid gap-16 lg:grid-cols-2">
              <!-- Demo content -->
              <div>
                <p class="text-sm font-semibold uppercase tracking-[0.35em] text-cyan-400">
                  Live Demo
                </p>
                <h2 class="mt-6 text-4xl font-bold text-white">
                  Experience the
                  <span class="bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                    magic
                  </span>
                  firsthand
                </h2>
                <p class="mt-6 text-lg text-slate-300">
                  See how PyraUI components respond instantly to user interactions with buttery-smooth animations and real-time updates.
                </p>

    <!-- Demo controls -->
                <div class="mt-8 grid gap-4">
                  <Pyraui.Components.Button.button
                    variant={:primary}
                    size={:lg}
                    class="w-full justify-center px-8 py-4 text-base font-semibold shadow-xl shadow-blue-500/30 transition-all duration-300 hover:scale-105 group"
                    phx-click="demo_increment"
                    id="demo-cta-action"
                  >
                    <span class="flex items-center gap-3">
                      <.icon name="hero-hand-raised" class="h-5 w-5" /> Click me — Live update
                      <span class="bg-white/20 px-2 py-1 rounded-lg text-sm">
                        {@demo_clicks}
                      </span>
                    </span>
                  </Pyraui.Components.Button.button>

                  <div class="grid grid-cols-2 gap-4">
                    <Pyraui.Components.Button.button
                      variant={:secondary}
                      size={:lg}
                      class="justify-center px-6 py-4 text-base font-semibold border-white/20 hover:bg-white/10 transition-all duration-300 hover:scale-105"
                      phx-click="demo_toggle_modal"
                      id="demo-cta-modal"
                    >
                      <span class="flex items-center gap-2">
                        <.icon name="hero-square-3-stack-3d" class="h-5 w-5" /> Toggle modal
                      </span>
                    </Pyraui.Components.Button.button>

                    <Pyraui.Components.Button.button
                      variant={:secondary}
                      size={:lg}
                      class="justify-center px-6 py-4 text-base font-semibold border-white/20 hover:bg-white/10 transition-all duration-300 hover:scale-105"
                      phx-click="demo_trigger_toast"
                      id="demo-cta-toast"
                    >
                      <span class="flex items-center gap-2">
                        <.icon name="hero-megaphone" class="h-5 w-5" /> Show toast
                      </span>
                    </Pyraui.Components.Button.button>
                  </div>
                </div>

    <!-- Demo feedback -->
                <div class="mt-8 space-y-6">
                  <div class="rounded-2xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm">
                    <div class="flex items-center gap-3">
                      <div class="flex h-10 w-10 items-center justify-center rounded-full bg-emerald-500/20 text-emerald-400">
                        <.icon name="hero-bolt" class="h-5 w-5" />
                      </div>
                      <div>
                        <p class="font-semibold text-white">Real-time updates</p>
                        <p class="text-sm text-slate-400">Watch the counter change instantly</p>
                      </div>
                    </div>
                  </div>

                  <%= if @demo_toast do %>
                    <div class="rounded-2xl border border-emerald-500/20 bg-emerald-500/10 p-6 backdrop-blur-sm animate-in slide-in-from-bottom">
                      <div class="flex items-center gap-3">
                        <div class="flex h-10 w-10 items-center justify-center rounded-full bg-emerald-500/20 text-emerald-400">
                          <.icon name="hero-check-circle" class="h-5 w-5" />
                        </div>
                        <div>
                          <p class="font-semibold text-emerald-300">Live notification</p>
                          <p class="text-sm text-emerald-200/80">{@demo_toast}</p>
                        </div>
                      </div>
                    </div>
                  <% end %>
                </div>
              </div>

    <!-- Demo visual -->
              <div class="relative">
                <div class="relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/80 to-slate-900/60 p-8 shadow-2xl shadow-blue-500/20 backdrop-blur-xl">
                  <div class="flex items-center justify-between text-xs uppercase tracking-wide text-slate-400">
                    <span>Interactive Playground</span>
                    <span class="flex items-center gap-2 text-cyan-400">
                      <span class="h-2 w-2 animate-pulse rounded-full bg-cyan-400"></span>
                      Live session
                    </span>
                  </div>

                  <div class="mt-8 space-y-6">
                    <!-- Counter display -->
                    <div class="rounded-2xl border border-white/5 bg-gradient-to-br from-blue-500/10 to-purple-500/10 p-6 text-center">
                      <div class="text-6xl font-bold text-white bg-gradient-to-br from-white to-cyan-200 bg-clip-text text-transparent">
                        {@demo_clicks}
                      </div>
                      <p class="mt-2 text-sm text-slate-400">LiveView events processed</p>
                    </div>

    <!-- Status indicators -->
                    <div class="grid grid-cols-2 gap-4">
                      <div class="rounded-2xl border border-white/5 bg-slate-900/60 p-4 text-center">
                        <div class="text-2xl font-bold text-emerald-400">
                          {if @demo_modal_open?, do: "Open", else: "Closed"}
                        </div>
                        <p class="text-xs text-slate-400 mt-1">Modal state</p>
                      </div>
                      <div class="rounded-2xl border border-white/5 bg-slate-900/60 p-4 text-center">
                        <div class="text-2xl font-bold text-amber-400">
                          {if @demo_toast, do: "Active", else: "Ready"}
                        </div>
                        <p class="text-xs text-slate-400 mt-1">Toast state</p>
                      </div>
                    </div>
                  </div>
                </div>

    <!-- Floating elements -->
                <div class="absolute -top-6 -right-6 w-12 h-12 bg-blue-400 rounded-full blur-xl opacity-50 animate-pulse">
                </div>
                <div class="absolute -bottom-6 -left-6 w-10 h-10 bg-purple-400 rounded-full blur-xl opacity-50 animate-pulse delay-700">
                </div>
              </div>
            </div>
          </div>

    <!-- Demo Modal -->
          <%= if @demo_modal_open? do %>
            <div class="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/80 backdrop-blur-xl transition-opacity animate-in fade-in duration-300">
              <div class="relative w-full max-w-2xl rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900 to-slate-800 p-8 shadow-2xl shadow-blue-500/20 animate-in zoom-in duration-300">
                <!-- Animated border -->
                <div class="absolute inset-0 rounded-3xl bg-gradient-to-r from-blue-500/30 via-purple-500/30 to-cyan-500/30 animate-pulse">
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-gradient-to-br from-slate-900 to-slate-800">
                </div>

                <div class="relative z-10">
                  <button
                    type="button"
                    class="absolute right-4 top-4 inline-flex h-10 w-10 items-center justify-center rounded-full border border-white/10 bg-white/10 text-white transition-all duration-300 hover:scale-110 hover:border-white/30 hover:bg-white/20"
                    phx-click="demo_toggle_modal"
                    id="demo-modal-close"
                  >
                    <.icon name="hero-x-mark" class="h-5 w-5" />
                  </button>

                  <div class="flex items-center gap-4">
                    <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-gradient-to-r from-blue-500 to-cyan-500 text-white">
                      <.icon name="hero-sparkles" class="h-6 w-6" />
                    </div>
                    <div>
                      <h3 class="text-2xl font-semibold text-white">Experience PyraUI in action</h3>
                      <p class="mt-2 text-slate-300">
                        This modal showcases the smooth animations and premium feel you get with every PyraUI component.
                      </p>
                    </div>
                  </div>

                  <div class="mt-6 grid gap-4 sm:grid-cols-2">
                    <div class="rounded-2xl border border-white/5 bg-white/5 p-4">
                      <p class="text-sm font-semibold text-white">Smooth transitions</p>
                      <p class="mt-2 text-xs text-slate-400">Enter/exit animations built-in</p>
                    </div>
                    <div class="rounded-2xl border border-white/5 bg-white/5 p-4">
                      <p class="text-sm font-semibold text-white">Focus management</p>
                      <p class="mt-2 text-xs text-slate-400">Accessible by default</p>
                    </div>
                  </div>

                  <Pyraui.Components.Button.button
                    variant={:primary}
                    class="mt-6 px-6 py-3 text-sm font-semibold shadow-lg shadow-blue-500/30 hover:-translate-y-0.5 transition-transform"
                    navigate={~p"/docs/components/modal"}
                    id="demo-modal-link"
                  >
                    Explore modal documentation
                  </Pyraui.Components.Button.button>
                </div>
              </div>
            </div>
          <% end %>
        </section>

    <!-- Components Gallery -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-b from-slate-950 to-slate-900">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_50%_at_50%_50%,rgba(139,92,246,0.1),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="text-center">
              <p class="text-sm font-semibold uppercase tracking-[0.35em] text-purple-400">
                Components Gallery
              </p>
              <h2 class="mt-6 text-4xl font-bold text-white sm:text-5xl">
                Discover
                <span class="bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
                  everything
                </span>
                you can build
              </h2>
              <p class="mt-6 max-w-2xl mx-auto text-lg text-slate-300">
                From simple buttons to complex data visualizations. Every component is designed to work beautifully together.
              </p>
            </div>

    <!-- Category tabs -->
            <div class="mt-12 flex flex-wrap justify-center gap-4">
              <button
                :for={tab <- ["all"] ++ Enum.map(@component_gallery, & &1.category)}
                class={tab_class(@active_tab, tab)}
                phx-click="set_active_tab"
                phx-value-tab={tab}
              >
                {if tab == "all", do: "All Components", else: tab}
              </button>
            </div>

            <div class="mt-12 grid gap-8 lg:grid-cols-2">
              <div
                :for={gallery <- @component_gallery}
                class="group relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/60 to-slate-900/40 p-8 backdrop-blur-xl transition-all duration-500 hover:scale-105 hover:border-white/20 hover:shadow-2xl"
                style="box-shadow: 0 0 60px -15px rgba(139, 92, 246, 0.2);"
              >
                <!-- Gradient overlay -->
                <div class={"absolute inset-0 bg-gradient-to-br #{gallery.gradient} opacity-0 group-hover:opacity-100 transition-opacity duration-500"}>
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-slate-900/95"></div>

                <div class="relative z-10">
                  <div class="flex items-start justify-between gap-4">
                    <div>
                      <h3 class="text-2xl font-semibold text-white">{gallery.category}</h3>
                      <p class="mt-2 text-sm text-slate-300">{gallery.description}</p>
                    </div>
                    <Pyraui.Components.Button.button
                      variant={:ghost}
                      size={:sm}
                      class={copy_button_class(gallery.category, @copy_feedback)}
                      phx-click="copy_gallery_code"
                      phx-value-component={gallery.category}
                      id={"copy-code-#{gallery.category}"}
                    >
                      <%= if @copy_feedback == gallery.category do %>
                        <.icon name="hero-check" class="h-4 w-4" /> Copied!
                      <% else %>
                        <.icon name="hero-clipboard" class="h-4 w-4" /> Copy
                      <% end %>
                    </Pyraui.Components.Button.button>
                  </div>

    <!-- Component preview -->
                  <div class="mt-6 relative overflow-hidden rounded-2xl border border-white/5 bg-slate-900/80 p-6 backdrop-blur-sm">
                    <div class="absolute inset-x-6 top-4 flex items-center gap-2 text-[0.65rem] uppercase tracking-wide text-slate-400">
                      <span class="inline-flex items-center gap-1 rounded-full bg-white/10 px-3 py-1 text-blue-300 backdrop-blur-sm">
                        <.icon name="hero-eye" class="h-3.5 w-3.5" /> Live preview
                      </span>
                    </div>

                    <div class="mt-10">
                      <%= case gallery.preview do %>
                        <% :basics -> %>
                          <div class="space-y-4">
                            <Pyraui.Components.Button.button
                              variant={:primary}
                              class="px-5 py-3 text-sm font-semibold shadow-lg shadow-blue-500/30"
                            >
                              Launch feature
                            </Pyraui.Components.Button.button>
                            <Pyraui.Components.Input.input
                              type="email"
                              label="Work email"
                              placeholder="you@studio.app"
                            />
                            <div class="rounded-2xl border border-emerald-500/20 bg-emerald-500/10 px-4 py-3 text-sm text-emerald-300">
                              <strong class="font-semibold">Success:</strong> Deployment ready
                            </div>
                          </div>
                        <% :layout -> %>
                          <div class="grid gap-4">
                            <div class="rounded-2xl border border-white/5 bg-white/5 p-4 shadow-sm">
                              <p class="text-sm font-semibold text-white">Team velocity</p>
                              <p class="mt-1 text-xs text-slate-400">Up 14% this sprint</p>
                            </div>
                          </div>
                        <% :data_display -> %>
                          <div class="space-y-2">
                            <div
                              :for={_i <- 1..3}
                              class="flex items-center justify-between rounded-lg bg-white/5 px-3 py-2"
                            >
                              <span class="text-sm text-white">Project item</span>
                              <span class="rounded-full bg-emerald-500/20 px-2 py-1 text-xs text-emerald-300">
                                Active
                              </span>
                            </div>
                          </div>
                        <% :interactive -> %>
                          <div class="space-y-4">
                            <div class="flex items-center justify-between rounded-2xl border border-white/5 bg-white/5 px-4 py-3">
                              <div>
                                <p class="text-xs uppercase tracking-wide text-slate-400">Wizard</p>
                                <p class="text-sm font-semibold text-white">
                                  Step 2 of 4
                                </p>
                              </div>
                              <div class="flex items-center gap-1 text-slate-400">
                                <span class="text-blue-400">●</span>
                                <span class="text-blue-400">●</span>
                                <span>○</span>
                                <span>○</span>
                              </div>
                            </div>
                          </div>
                        <% :advanced -> %>
                          <div class="space-y-3">
                            <div
                              :for={_i <- 1..2}
                              class="flex items-center gap-3 rounded-lg bg-white/5 p-3"
                            >
                              <div class="h-3 w-3 rounded-full bg-blue-400"></div>
                              <div class="flex-1">
                                <div class="h-2 w-3/4 rounded bg-white/20"></div>
                              </div>
                            </div>
                          </div>
                        <% :navigation -> %>
                          <div class="space-y-2">
                            <div
                              :for={name <- ~w(Dashboard Analytics Settings)}
                              class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-white hover:bg-white/5"
                            >
                              <.icon name="hero-folder" class="h-4 w-4 text-slate-400" />
                              {name}
                            </div>
                          </div>
                      <% end %>
                    </div>
                  </div>

    <!-- Code snippet -->
                  <pre class="mt-6 overflow-x-auto rounded-2xl border border-white/5 bg-slate-950 p-6 text-xs leading-relaxed text-blue-200 backdrop-blur-sm">
    {gallery.code}
                  </pre>
                </div>
              </div>
            </div>
          </div>
        </section>

    <!-- Installation Section -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-br from-slate-900 via-blue-950 to-slate-950">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_50%_at_50%_50%,rgba(56,189,248,0.15),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="grid gap-16 lg:grid-cols-2">
              <div>
                <p class="text-sm font-semibold uppercase tracking-[0.35em] text-cyan-400">
                  Get Started
                </p>
                <h2 class="mt-6 text-4xl font-bold text-white">
                  Install in
                  <span class="bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                    minutes
                  </span>
                </h2>
                <p class="mt-6 text-lg text-slate-300">
                  Add PyraUI to your Phoenix project and start building beautiful interfaces immediately.
                </p>

    <!-- Installation steps -->
                <div class="mt-8 space-y-4">
                  <div
                    :for={step <- @install_commands}
                    class="flex items-center gap-4 rounded-2xl border border-white/10 bg-white/5 p-6 backdrop-blur-sm transition-all duration-300 hover:scale-105 hover:border-white/20"
                  >
                    <.icon name={step.icon} class="h-6 w-6 text-cyan-400" />
                    <div class="flex-1">
                      <p class="font-semibold text-white">{step.label}</p>
                      <code class="mt-2 block rounded-lg bg-black/40 px-3 py-2 text-sm text-cyan-300 font-mono">
                        {step.cmd}
                      </code>
                    </div>
                  </div>
                </div>
              </div>

    <!-- Code example -->
              <div class="relative">
                <div class="relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/80 to-slate-900/60 p-8 shadow-2xl shadow-cyan-500/20 backdrop-blur-xl">
                  <div class="flex items-center justify-between text-xs uppercase tracking-wide text-slate-400">
                    <span>Quick start example</span>
                    <span class="rounded-full bg-cyan-500/20 px-3 py-1 text-[0.6rem] font-semibold text-cyan-200 backdrop-blur-sm">
                      LiveView ready
                    </span>
                  </div>
                  <pre class="mt-6 overflow-x-auto rounded-2xl bg-slate-950/90 p-6 text-sm leading-relaxed text-cyan-200 font-mono">
    {@quickstart_code}
                  </pre>
                </div>

    <!-- Floating elements -->
                <div class="absolute -top-6 -right-6 w-12 h-12 bg-cyan-400 rounded-full blur-xl opacity-50 animate-pulse">
                </div>
                <div class="absolute -bottom-6 -left-6 w-10 h-10 bg-blue-400 rounded-full blur-xl opacity-50 animate-pulse delay-500">
                </div>
              </div>
            </div>
          </div>
        </section>

    <!-- Integrations Section -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-b from-slate-950 to-slate-900">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_50%_at_50%_50%,rgba(139,92,246,0.1),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="text-center">
              <p class="text-sm font-semibold uppercase tracking-[0.35em] text-purple-400">
                Integrations
              </p>
              <h2 class="mt-6 text-4xl font-bold text-white sm:text-5xl">
                Works seamlessly with your
                <span class="bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
                  Phoenix stack
                </span>
              </h2>
              <p class="mt-6 max-w-2xl mx-auto text-lg text-slate-300">
                Built to complement the tools you already love. No adapters, no guesswork — just frictionless integration.
              </p>
            </div>

            <div class="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-4">
              <div
                :for={integration <- @integration_highlights}
                class="group relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/60 to-slate-900/40 p-8 backdrop-blur-xl transition-all duration-500 hover:scale-105 hover:border-white/20 hover:shadow-2xl text-center"
                style="box-shadow: 0 0 60px -15px rgba(139, 92, 246, 0.2);"
              >
                <!-- Gradient overlay -->
                <div class={"absolute inset-0 bg-gradient-to-br #{integration.gradient} opacity-0 group-hover:opacity-100 transition-opacity duration-500"}>
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-slate-900/95"></div>

                <div class="relative z-10">
                  <div class="inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-white/5 text-white shadow-lg backdrop-blur-sm transition-all duration-300 group-hover:scale-110 group-hover:bg-white/10 mx-auto">
                    <.icon name={integration.icon} class="h-8 w-8" />
                  </div>
                  <h3 class="mt-6 text-xl font-semibold text-white">{integration.name}</h3>
                  <p class="mt-3 text-sm leading-relaxed text-slate-300">{integration.description}</p>
                  <div class="mt-4 inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/5 px-4 py-2 text-xs font-semibold uppercase tracking-wide text-purple-200 backdrop-blur-sm">
                    Version {integration.version}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

    <!-- Testimonials Section -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-b from-slate-900 to-slate-950">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_50%_at_50%_50%,rgba(16,185,129,0.1),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-7xl px-6 lg:px-12 relative">
            <div class="text-center">
              <p class="text-sm font-semibold uppercase tracking-[0.35em] text-emerald-400">
                Testimonials
              </p>
              <h2 class="mt-6 text-4xl font-bold text-white sm:text-5xl">
                Loved by teams shipping
                <span class="bg-gradient-to-r from-emerald-400 to-cyan-400 bg-clip-text text-transparent">
                  with Phoenix
                </span>
              </h2>
            </div>

            <div class="mt-20 grid gap-8 md:grid-cols-2">
              <div
                :for={testimonial <- @testimonials}
                class="group relative overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-slate-900/60 to-slate-900/40 p-8 backdrop-blur-xl transition-all duration-500 hover:scale-105 hover:border-white/20 hover:shadow-2xl"
                style="box-shadow: 0 0 60px -15px rgba(16, 185, 129, 0.2);"
              >
                <!-- Gradient overlay -->
                <div class="absolute inset-0 bg-gradient-to-br from-emerald-500/10 to-cyan-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
                </div>
                <div class="absolute inset-[1px] rounded-3xl bg-slate-900/95"></div>

                <div class="relative z-10">
                  <div class="text-4xl text-emerald-400/20">"</div>
                  <p class="text-lg text-slate-100 -mt-4">&ldquo;{testimonial.quote}&rdquo;</p>
                  <div class="mt-6 flex items-center gap-4">
                    <div class="flex h-12 w-12 items-center justify-center rounded-full bg-gradient-to-r from-emerald-500 to-cyan-500 text-white font-semibold">
                      {String.at(testimonial.author, 0)}
                    </div>
                    <div>
                      <p class="font-semibold text-white">{testimonial.author}</p>
                      <p class="text-sm text-slate-400">{testimonial.role}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

    <!-- Final CTA Section -->
        <section class="relative py-32 overflow-hidden">
          <div class="absolute inset-0 bg-gradient-to-br from-blue-950 via-slate-950 to-purple-950">
            <div class="absolute inset-0 bg-[radial-gradient(ellipse_80%_80%_at_50%_50%,rgba(99,102,241,0.2),transparent)]">
            </div>
          </div>

          <div class="mx-auto max-w-4xl px-6 lg:px-12 text-center relative">
            <p class="text-sm font-semibold uppercase tracking-[0.35em] text-blue-400">
              Ready to start building?
            </p>
            <h2 class="mt-6 text-4xl font-bold text-white sm:text-6xl">
              Build your next
              <span class="bg-gradient-to-r from-blue-400 via-purple-400 to-cyan-400 bg-clip-text text-transparent">
                masterpiece
              </span>
              with PyraUI
            </h2>
            <p class="mt-6 text-xl text-slate-300 max-w-2xl mx-auto">
              Join thousands of developers building beautiful, reactive applications with the most comprehensive UI library for Phoenix LiveView.
            </p>

            <div class="mt-12 flex flex-wrap justify-center gap-6">
              <Pyraui.Components.Button.button
                variant={:primary}
                size={:xl}
                class="px-12 py-4 text-lg font-semibold shadow-2xl shadow-blue-500/40 hover:shadow-blue-400/60 transition-all duration-300 hover:scale-110 group"
                navigate={~p"/docs/getting-started"}
                id="final-cta"
              >
                <span class="flex items-center gap-3">
                  Start building for free
                  <.icon
                    name="hero-rocket-launch"
                    class="h-5 w-5 group-hover:scale-110 transition-transform"
                  />
                </span>
              </Pyraui.Components.Button.button>

              <Pyraui.Components.Button.button
                variant={:ghost}
                size={:xl}
                class="px-12 py-4 text-lg font-semibold text-white/90 border-white/20 hover:bg-white/10 hover:border-white/30 backdrop-blur-sm transition-all duration-300 hover:scale-110"
                href="https://github.com/abrshewube/Pyraui"
                target="_blank"
              >
                <span class="flex items-center gap-3">
                  <.icon name="hero-star" class="h-5 w-5 text-amber-400" /> Star on GitHub
                </span>
              </Pyraui.Components.Button.button>
            </div>

            <div class="mt-8 text-sm text-slate-400">
              No credit card required • Open source • MIT Licensed
            </div>
          </div>
        </section>

    <!-- Footer -->
        <footer class="relative bg-slate-950/95 py-16 text-slate-300 border-t border-white/10">
          <div class="absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-blue-500/40 to-transparent">
          </div>
          <div class="mx-auto max-w-7xl px-6 lg:px-12">
            <div class="grid gap-12 lg:grid-cols-4">
              <div class="lg:col-span-2">
                <h3 class="text-2xl font-semibold text-white bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">
                  PyraUI
                </h3>
                <p class="mt-4 text-slate-400 max-w-md">
                  The modern toolkit for building beautiful, reactive applications with Phoenix LiveView.
                  Built with ❤️ by the Elixir community.
                </p>
                <div class="mt-6 flex gap-4">
                  <.link
                    href="https://github.com/abrshewube/Pyraui"
                    class="flex h-10 w-10 items-center justify-center rounded-full border border-white/10 bg-white/5 text-white transition-all duration-300 hover:scale-110 hover:bg-white/10 hover:border-white/20"
                  >
                    <.icon name="hero-github" class="h-5 w-5" />
                  </.link>
                  <.link
                    href="https://twitter.com/"
                    class="flex h-10 w-10 items-center justify-center rounded-full border border-white/10 bg-white/5 text-white transition-all duration-300 hover:scale-110 hover:bg-white/10 hover:border-white/20"
                  >
                    <.icon name="hero-twitter" class="h-5 w-5" />
                  </.link>
                  <.link
                    href="https://discord.gg/"
                    class="flex h-10 w-10 items-center justify-center rounded-full border border-white/10 bg-white/5 text-white transition-all duration-300 hover:scale-110 hover:bg-white/10 hover:border-white/20"
                  >
                    <.icon name="hero-chat-bubble-left-right" class="h-5 w-5" />
                  </.link>
                </div>
              </div>

              <div>
                <h4 class="text-sm font-semibold uppercase tracking-wider text-white">Resources</h4>
                <div class="mt-4 space-y-3">
                  <.link
                    navigate={~p"/docs"}
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Documentation
                  </.link>
                  <.link
                    navigate={~p"/docs/components"}
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Components
                  </.link>
                  <.link
                    navigate={~p"/docs/getting-started"}
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Getting Started
                  </.link>
                  <.link
                    href="https://github.com/abrshewube/Pyraui"
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    GitHub
                  </.link>
                </div>
              </div>

              <div>
                <h4 class="text-sm font-semibold uppercase tracking-wider text-white">Community</h4>
                <div class="mt-4 space-y-3">
                  <.link
                    href="https://github.com/abrshewube/Pyraui/discussions"
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Discussions
                  </.link>
                  <.link
                    href="https://github.com/abrshewube/Pyraui/issues"
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Issues
                  </.link>
                  <.link
                    href="https://twitter.com/"
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Twitter
                  </.link>
                  <.link
                    href="https://elixirforum.com/"
                    class="block text-slate-400 hover:text-white transition-colors"
                  >
                    Elixir Forum
                  </.link>
                </div>
              </div>
            </div>

            <div class="mt-12 pt-8 border-t border-white/10 flex flex-col sm:flex-row justify-between items-center gap-4 text-sm text-slate-500">
              <p>Copyright © 2025 PyraUI. All rights reserved.</p>
              <div class="flex gap-6">
                <.link
                  href="https://github.com/abrshewube/Pyraui/blob/main/LICENSE"
                  class="hover:text-slate-400 transition-colors"
                >
                  MIT License
                </.link>
                <.link href="#" class="hover:text-slate-400 transition-colors">
                  Privacy
                </.link>
                <.link href="#" class="hover:text-slate-400 transition-colors">
                  Terms
                </.link>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </Layouts.app>
    """
  end
end
