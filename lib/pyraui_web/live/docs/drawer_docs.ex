defmodule PyrauiWeb.DocsLive.DrawerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    assigns =
      assigns
      |> assign(:drawer_open_state, Map.get(assigns, :"drawer-docs_open", false))
      |> assign(:drawer_open_state_right, Map.get(assigns, :"drawer-docs-right_open", false))

    ~H"""
    <div class="text-slate-900 dark:text-slate-100 pb-24">
      <header class="mb-12 space-y-4">
        <span class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-blue-600 dark:border-blue-500/30 dark:bg-blue-500/10 dark:text-blue-200">
          Drawer System
        </span>
        <h1 class="text-4xl font-bold tracking-tight text-slate-900 dark:text-white">Drawer</h1>
        <p class="max-w-2xl text-lg leading-relaxed text-slate-600 dark:text-slate-300">
          Off-canvas surfaces for navigation, filters, and contextual actions. Switch sides, toggle overlays, and nest secondary actions without rebuilding the shell.
        </p>
      </header>

      <div class="space-y-14">
        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900 dark:text-white">
                Command Palette Drawer
              </h2>
              <p class="text-sm text-slate-600 dark:text-slate-300">
                Slide from the left with an overlay. Perfect for navigation menus or project switchers.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-blue-50 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-blue-600 dark:border-blue-500/40 dark:bg-blue-500/10 dark:text-blue-200">
              side = :left · overlay = true
            </div>
          </div>

          <div class="relative overflow-hidden rounded-3xl border border-slate-200 bg-gradient-to-br from-white via-slate-50 to-slate-100 p-10 shadow-xl dark:border-slate-700 dark:from-slate-900 dark:via-slate-950 dark:to-slate-900/80">
            <div class="absolute -top-20 -left-16 h-48 w-48 rounded-full bg-blue-500/20 blur-3xl dark:bg-blue-500/10">
            </div>
            <div class="absolute bottom-8 right-10 h-40 w-40 rounded-full bg-indigo-500/20 blur-3xl dark:bg-indigo-500/20">
            </div>

            <div class="relative flex flex-col gap-8 md:flex-row md:items-center md:justify-between">
              <div class="space-y-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white">
                  Global Navigation
                </h3>
                <p class="text-sm leading-relaxed text-slate-600 dark:text-slate-300">
                  Combine trigger slots with tinted overlays so the drawer reads as a premium command palette. Clicking outside or pressing Esc closes it instantly.
                </p>
                <ul class="space-y-2 text-sm text-slate-500 dark:text-slate-400">
                  <li class="flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-blue-500"></span>
                    Supports Lists, forms, quick actions, and nested sections.
                  </li>
                  <li class="flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-indigo-400"></span>
                    Works with both `:navigate` and `href` triggers.
                  </li>
                </ul>
              </div>

              <div class="relative flex-1 rounded-2xl border border-slate-200 bg-white/90 p-6 shadow-lg backdrop-blur dark:border-slate-700 dark:bg-slate-900/80">
                <Pyraui.Components.Drawer.drawer
                  id="drawer-docs"
                  open={@drawer_open_state}
                  side={:left}
                  overlay={true}
                >
                  <:trigger>
                    <span class="inline-flex items-center gap-2 rounded-xl bg-blue-600 px-5 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-blue-700">
                      <.icon name="hero-bars-3" class="h-4 w-4" /> Open Drawer
                    </span>
                  </:trigger>

                  <:content>
                    <div class="space-y-6">
                      <div>
                        <p class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500 dark:text-slate-400">
                          Navigation
                        </p>
                        <nav class="mt-3 space-y-2">
                          <a
                            href="#"
                            class="flex items-center gap-3 rounded-lg px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-blue-50 hover:text-blue-600 dark:text-slate-200 dark:hover:bg-slate-800"
                          >
                            <.icon name="hero-home" class="h-4 w-4" /> Home
                          </a>
                          <a
                            href="#"
                            class="flex items-center gap-3 rounded-lg px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-blue-50 hover:text-blue-600 dark:text-slate-200 dark:hover:bg-slate-800"
                          >
                            <.icon name="hero-chart-pie" class="h-4 w-4" /> Analytics
                          </a>
                          <a
                            href="#"
                            class="flex items-center gap-3 rounded-lg px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-blue-50 hover:text-blue-600 dark:text-slate-200 dark:hover:bg-slate-800"
                          >
                            <.icon name="hero-cog-6-tooth" class="h-4 w-4" /> Settings
                          </a>
                        </nav>
                      </div>

                      <div class="rounded-xl border border-slate-200/70 bg-slate-50 px-4 py-3 text-xs text-slate-500 dark:border-slate-700 dark:bg-slate-800/50 dark:text-slate-400">
                        Tip: Use `phx-click="toggle-drawer"` in other components to open/close the same drawer programmatically.
                      </div>
                    </div>
                  </:content>
                </Pyraui.Components.Drawer.drawer>
              </div>
            </div>
          </div>

          <div class="rounded-xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700 dark:border-slate-700 dark:bg-slate-900/40 dark:text-slate-200">
            <pre><code phx-no-curly-interpolation>
            &lt;.drawer id="nav-drawer" open={@drawer_open_state} side={:left} overlay={true}&gt;
              &lt;:trigger&gt;
                &lt;span class="inline-flex items-center gap-2 rounded-xl bg-blue-600 px-5 py-2 text-sm font-semibold text-white"&gt;
                  &lt;.icon name="hero-bars-3" class="h-4 w-4" /&gt;
                  Open Drawer
                &lt;/span&gt;
              &lt;/:trigger&gt;
              &lt;:content&gt;
                &lt;nav class="space-y-2"&gt;
                  ...
                &lt;/nav&gt;
              &lt;/:content&gt;
            &lt;/.drawer&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900 dark:text-white">
                Filter Panel Drawer
              </h2>
              <p class="text-sm text-slate-600 dark:text-slate-300">
                Slide from the right without an overlay. Perfect for staying co-visible with the page.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-emerald-600 dark:border-emerald-500/30 dark:bg-emerald-500/10 dark:text-emerald-200">
              side = :right · overlay = false
            </div>
          </div>

          <div class="relative overflow-hidden rounded-3xl border border-slate-200 bg-white p-10 shadow-xl dark:border-slate-700 dark:bg-slate-900/80">
            <div class="grid gap-10 lg:grid-cols-[1fr_1.1fr]">
              <div class="space-y-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white">
                  Live product filters with preview
                </h3>
                <p class="text-sm text-slate-600 dark:text-slate-300">
                  Disable the overlay so the drawer feels like part of the canvas. Use background blur or border accents to distinguish from the underlying content.
                </p>
                <div class="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3 text-xs text-slate-500 dark:border-slate-700 dark:bg-slate-800/40 dark:text-slate-400">
                  Combine with LiveView streams so filtering results re-render while the drawer stays open.
                </div>
              </div>

              <div class="relative flex justify-end">
                <div class="h-80 w-full max-w-2xl rounded-3xl border border-slate-200 bg-gradient-to-br from-slate-100 via-white to-slate-100 shadow-inner dark:border-slate-700 dark:from-slate-900 dark:via-slate-950 dark:to-slate-900">
                  <Pyraui.Components.Drawer.drawer
                    id="drawer-docs-right"
                    open={@drawer_open_state_right}
                    side={:right}
                    overlay={false}
                    class="shadow-2xl shadow-slate-900/10 dark:shadow-slate-900/30"
                  >
                    <:trigger>
                      <span class="absolute right-6 top-6 inline-flex items-center gap-2 rounded-lg border border-emerald-200 bg-white px-4 py-2 text-sm font-semibold text-emerald-600 shadow-sm transition hover:border-emerald-300 hover:bg-emerald-50 dark:border-emerald-500/30 dark:bg-slate-900/70 dark:text-emerald-200">
                        <.icon name="hero-funnel" class="h-4 w-4" /> Open Filters
                      </span>
                    </:trigger>

                    <:content>
                      <div class="space-y-5">
                        <div>
                          <p class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500 dark:text-slate-400">
                            Filters
                          </p>
                          <div class="mt-3 space-y-3 text-xs text-slate-500 dark:text-slate-300">
                            <label class="flex items-center gap-2">
                              <input
                                type="checkbox"
                                class="rounded border-slate-300 text-emerald-500 focus:ring-emerald-500"
                              /> Free shipping
                            </label>
                            <label class="flex items-center gap-2">
                              <input
                                type="checkbox"
                                class="rounded border-slate-300 text-emerald-500 focus:ring-emerald-500"
                              /> In stock
                            </label>
                            <label class="flex items-center gap-2">
                              <input
                                type="checkbox"
                                class="rounded border-slate-300 text-emerald-500 focus:ring-emerald-500"
                              /> 4★ &amp; up
                            </label>
                          </div>
                        </div>

                        <button
                          type="button"
                          class="w-full rounded-lg bg-emerald-500 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-emerald-600"
                          phx-click="close-drawer"
                          phx-value-id="drawer-docs-right"
                        >
                          Apply filters
                        </button>
                      </div>
                    </:content>
                  </Pyraui.Components.Drawer.drawer>
                </div>
              </div>
            </div>
          </div>

          <div class="rounded-xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700 dark:border-slate-700 dark:bg-slate-900/40 dark:text-slate-200">
            <pre><code phx-no-curly-interpolation>
            &lt;.drawer id="filters-drawer" open={@filters_open?} side={:right} overlay={false}&gt;
              &lt;:trigger&gt;
                &lt;span class="rounded-lg border border-emerald-200 px-4 py-2 text-sm font-semibold text-emerald-600"&gt;
                  Open Filters
                &lt;/span&gt;
              &lt;/:trigger&gt;
                &lt;:content&gt;
                ...
              &lt;/:content&gt;
                &lt;/.drawer&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Props</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200 text-sm dark:divide-slate-800 border border-slate-200 dark:border-slate-800">
              <thead class="bg-slate-50 text-xs uppercase tracking-[0.3em] text-slate-500 dark:bg-slate-900 dark:text-slate-400">
                <tr>
                  <th class="px-6 py-3 text-left">Prop</th>
                  <th class="px-6 py-3 text-left">Type</th>
                  <th class="px-6 py-3 text-left">Default</th>
                  <th class="px-6 py-3 text-left">Description</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-slate-200 bg-white text-slate-700 dark:divide-slate-800 dark:bg-slate-950 dark:text-slate-200">
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">side</td>
                  <td class="px-6 py-4">:left | :right</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">:left</td>
                  <td class="px-6 py-4">
                    Drawer origin. Right-hand drawers pair well with filters or inspector panels.
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">overlay</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">true</td>
                  <td class="px-6 py-4">
                    Add a dimming layer behind the drawer. Set to false when you want split views.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">""</td>
                  <td class="px-6 py-4">
                    Extend styling—rounded corners, borders, or custom widths.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">trigger</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">[]</td>
                  <td class="px-6 py-4">
                    Optional slot; when omitted, manage the drawer with your own actions (phx-click).
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
