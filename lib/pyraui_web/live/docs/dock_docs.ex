defmodule PyrauiWeb.DocsLive.DockDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-slate-900 dark:text-slate-100 pb-32">
      <header class="mb-10 space-y-4">
        <span class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-blue-600 dark:border-blue-500/30 dark:bg-blue-500/10 dark:text-blue-200">
          PyraDock
        </span>
        <h1 class="text-4xl font-bold tracking-tight text-slate-900 dark:text-white">Dock</h1>
        <p class="max-w-2xl text-lg leading-relaxed text-slate-600 dark:text-slate-300">
          A polished bottom navigation surface with icon-forward actions, active state accents, and glassmorphic styling for mobile layouts or secondary command bars.
        </p>
      </header>

      <div class="space-y-12">
        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900 dark:text-white">Luminous Dock</h2>
              <p class="text-sm text-slate-600 dark:text-slate-300">
                Blur, soft gradients, and active states make the dock feel at home over rich backgrounds.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-white/20 bg-white/30 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-white backdrop-blur dark:border-white/10 dark:bg-white/10">
              Inline mode
            </div>
          </div>

          <div class="relative overflow-hidden rounded-[2.5rem] border border-slate-200/40 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-10 shadow-2xl shadow-slate-900/40 dark:border-white/10">
            <div class="absolute -top-24 -left-24 h-48 w-48 rounded-full bg-blue-500/40 blur-3xl">
            </div>
            <div class="absolute -bottom-20 right-12 h-40 w-40 rounded-full bg-indigo-500/20 blur-3xl">
            </div>

            <div class="relative grid gap-10 lg:grid-cols-[1.1fr_0.9fr] items-center text-slate-100">
              <div class="space-y-4">
                <span class="inline-flex items-center gap-2 rounded-full border border-white/20 bg-white/10 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-white/80">
                  Now Playing
                </span>
                <h3 class="text-3xl font-semibold text-white leading-tight">
                  Create immersive navigation
                </h3>
                <p class="text-sm text-slate-200/80 leading-relaxed">
                  Swap icons, pulse notifications, and slide the dock inline in product tours or device frames. The inline mode keeps it inside your layout so the rest of the doc stays perfectly readable.
                </p>
                <ul class="space-y-2 text-sm text-slate-200/70">
                  <li class="flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-blue-400"></span>
                    Soft blur glass treatment pairs with bold iconography.
                  </li>
                  <li class="flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-blue-300"></span>
                    Active states glow with light rings and subtle scale.
                  </li>
                  <li class="flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-indigo-300"></span>
                    Perfect for onboarding modals, app previews, and hero mockups.
                  </li>
                </ul>
              </div>

              <div class="flex justify-center">
                <Pyraui.Components.Dock.dock
                  id="docs-dock-luminous"
                  position={:inline}
                  class="border border-white/10 bg-white/85 shadow-2xl shadow-blue-500/30 backdrop-blur-xl dark:border-white/10 dark:bg-slate-900/70"
                >
                  <:item icon="hero-home" label="Home" active={true} />
                  <:item icon="hero-magnifying-glass" label="Search" />
                  <:item icon="hero-bolt" label="Actions" />
                  <:item icon="hero-bell-alert" label="Alerts" />
                  <:item icon="hero-user-circle" label="Account" />
                </Pyraui.Components.Dock.dock>
              </div>
            </div>
          </div>

          <div class="rounded-xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700 dark:border-slate-700 dark:bg-slate-900/40 dark:text-slate-200">
            <pre><code phx-no-curly-interpolation>
            &lt;.dock id="mobile-dock" position={:inline} class="border border-white/20 bg-white/80 backdrop-blur-xl"&gt;
              &lt;:item icon="hero-home" label="Home" active={true} /&gt;
              &lt;:item icon="hero-magnifying-glass" label="Search" /&gt;
              &lt;:item icon="hero-bolt" label="Actions" /&gt;
              &lt;:item icon="hero-bell-alert" label="Alerts" /&gt;
              &lt;:item icon="hero-user-circle" label="Account" /&gt;
            &lt;/.dock&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900 dark:text-white">Anchored Dock</h2>
              <p class="text-sm text-slate-600 dark:text-slate-300">
                Use
                <code class="rounded bg-slate-200 px-1 py-0.5 text-xs dark:bg-slate-800">
                  position={:inline}
                </code>
                alongside utility classes to simulate a pinned dock inside marketing shots or prototypes.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-slate-600 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-300">
              Viewport anchored
            </div>
          </div>

          <div class="relative overflow-hidden rounded-3xl border border-slate-200 bg-gradient-to-br from-slate-100 via-white to-slate-200 shadow-lg dark:border-slate-700 dark:from-slate-900 dark:via-slate-950 dark:to-slate-900/60">
            <div class="absolute inset-0 bg-[radial-gradient(circle_at_top,rgba(56,189,248,0.18),transparent_60%)]">
            </div>
            <div class="relative flex flex-col items-center gap-8 px-8 py-14">
              <div class="max-w-lg text-center">
                <h3 class="text-xl font-semibold text-slate-800 dark:text-slate-100">
                  Float the dock above any dashboard canvas
                </h3>
                <p class="mt-3 text-sm text-slate-600 dark:text-slate-300">
                  Inline mode paired with absolute positioning lets you build polished hero shots or in-app previews without fighting fixed positioning on the docs page.
                </p>
              </div>

              <div class="relative w-full max-w-2xl">
                <div class="absolute inset-x-12 -top-6 h-24 rounded-full bg-gradient-to-r from-cyan-300/30 via-blue-500/30 to-purple-400/30 blur-3xl">
                </div>
                <Pyraui.Components.Dock.dock
                  id="docs-dock-floating"
                  position={:inline}
                  class="relative mx-auto max-w-xl border border-slate-200/80 bg-white/95 shadow-2xl shadow-slate-900/15 backdrop-blur-lg dark:border-slate-700/70 dark:bg-slate-900/85"
                >
                  <:item icon="hero-home-modern" label="Dashboard" active={true} />
                  <:item icon="hero-chart-bar" label="Metrics" />
                  <:item icon="hero-plus-circle" label="New" />
                  <:item icon="hero-inbox-stack" label="Inbox" />
                </Pyraui.Components.Dock.dock>
              </div>
            </div>
          </div>

          <div class="rounded-xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700 dark:border-slate-700 dark:bg-slate-900/40 dark:text-slate-200">
            <pre><code phx-no-curly-interpolation>
            &lt;.dock id="app-dock" position={:inline} class="mx-auto max-w-xl border border-slate-200/80 bg-white/95 backdrop-blur-lg"&gt;
              &lt;:item icon="hero-home-modern" label="Dashboard" active={true} /&gt;
              &lt;:item icon="hero-chart-bar" label="Metrics" /&gt;
              &lt;:item icon="hero-plus-circle" label="New" /&gt;
              &lt;:item icon="hero-inbox-stack" label="Inbox" /&gt;
            &lt;/.dock&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-4 border-t border-slate-200 pt-8 dark:border-slate-800">
          <h2 class="text-2xl font-semibold text-slate-900 dark:text-white">Props</h2>
          <p class="text-sm text-slate-600 dark:text-slate-300">
            Configure icon labels, navigation targets, and choose between fixed or inline positioning for prototype or production use.
          </p>

          <div class="overflow-hidden rounded-2xl border border-slate-200 dark:border-slate-800">
            <table class="min-w-full divide-y divide-slate-200 text-sm dark:divide-slate-800">
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
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">id</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">—</td>
                  <td class="px-6 py-4">Unique ID for the dock element.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">position</td>
                  <td class="px-6 py-4">:fixed | :inline</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">:fixed</td>
                  <td class="px-6 py-4">
                    Choose viewport anchored behavior or inline/glass surface rendering.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">""</td>
                  <td class="px-6 py-4">
                    Append utility classes for custom palettes, shadows, or width.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900 dark:text-white">item slot</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-slate-400 dark:text-slate-500">—</td>
                  <td class="px-6 py-4">
                    Define each dock item’s icon, label, navigation target, and active state.
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
