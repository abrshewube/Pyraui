defmodule PyrauiWeb.DocsLive.ThemeSwitchDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-sky-200 bg-sky-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-sky-600">
            Theme Switch <span class="h-1 w-1 rounded-full bg-sky-400"></span> Docs
          </span>
          <h1 class="text-4xl font-semibold tracking-tight text-slate-900">Theme Switch</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Accessible toggles powered by the bundled <code class="rounded bg-slate-100 px-1.5 py-0.5 text-sm text-slate-700">ThemeToggleHook</code>. Deliver effortless transitions between light and dark palettes with crisp visuals, icons, hints, and layout options.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(15,23,42,0.08)] transition-all duration-200 hover:-translate-y-1">
          <div class="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Sizes & Defaults</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Minimal toggles for dashboards, preferences, and settings drawers. Pick a size and add optional helper text for clarity.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Compact by design
            </div>
          </div>

          <div class="mt-6 grid gap-6 md:grid-cols-2">
            <div class="space-y-3">
              <Pyraui.Components.ThemeSwitch.theme_switch
                size={:sm}
                hint="Silent, space-friendly toggle."
              />
              <p class="text-xs text-slate-500">
                Small footprint — perfect for dense tables or settings lists.
              </p>
            </div>
            <div class="space-y-3">
              <Pyraui.Components.ThemeSwitch.theme_switch
                size={:md}
                show_label={true}
                hint="Inline labels keep context obvious."
              />
              <p class="text-xs text-slate-500">
                Default size with inline labels for balanced readability.
              </p>
            </div>
            <div class="space-y-3">
              <Pyraui.Components.ThemeSwitch.theme_switch
                size={:lg}
                label_position={:stacked}
                show_label={true}
                hint="Use stacked labels for hero placements."
              />
              <p class="text-xs text-slate-500">
                Large and expressive — ideal for onboarding screens or marketing pages.
              </p>
            </div>
            <div class="space-y-3">
              <Pyraui.Components.ThemeSwitch.theme_switch hint="No labels, just the toggle." />
              <p class="text-xs text-slate-500">
                Default configuration without labels for quick theme access.
              </p>
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.theme_switch size={:sm} hint="Compact toggle" /&gt;
    &lt;.theme_switch size={:md} show_label hint="Inline labels" /&gt;
    &lt;.theme_switch size={:lg} show_label label_position={:stacked} hint="Stacked labels" /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(59,130,246,0.08)] transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Visual Variants</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Swap styles to echo your brand language: solid, glassmorphism, gradient, outline, or pill.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-100 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Tone-aware
            </div>
          </div>

          <div class="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-5">
            <div class="flex flex-col items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <span class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500">
                Solid
              </span>
              <Pyraui.Components.ThemeSwitch.theme_switch variant={:solid} />
            </div>
            <div class="flex flex-col items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <span class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500">
                Glass
              </span>
              <Pyraui.Components.ThemeSwitch.theme_switch variant={:glass} />
            </div>
            <div class="flex flex-col items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <span class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500">
                Outline
              </span>
              <Pyraui.Components.ThemeSwitch.theme_switch variant={:outline} />
            </div>
            <div class="flex flex-col items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <span class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500">
                Gradient
              </span>
              <Pyraui.Components.ThemeSwitch.theme_switch variant={:gradient} />
            </div>
            <div class="flex flex-col items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <span class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-500">
                Pill
              </span>
              <Pyraui.Components.ThemeSwitch.theme_switch variant={:pill} />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(147,197,253,0.1)] transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Icon Styles & Accessibility</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Pick iconography that fits your voice: hero icons, minimal dots, or playful emoji — all while keeping ARIA-friendly semantics.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 text-xs uppercase tracking-[0.3em] text-slate-500">
              <span class="h-2 w-2 rounded-full bg-sky-300"></span> Hook powered
            </div>
          </div>

          <div class="mt-8 grid gap-6 md:grid-cols-3">
            <div class="space-y-3 rounded-2xl border border-slate-200 bg-slate-50 p-5">
              <h3 class="text-sm font-semibold text-slate-800">Dual icons</h3>
              <Pyraui.Components.ThemeSwitch.theme_switch
                icon_style={:dual}
                show_label={true}
                hint="Hero icons indicate the active palette."
              />
            </div>
            <div class="space-y-3 rounded-2xl border border-slate-200 bg-slate-50 p-5">
              <h3 class="text-sm font-semibold text-slate-800">Minimal dots</h3>
              <Pyraui.Components.ThemeSwitch.theme_switch
                icon_style={:minimal}
                variant={:outline}
                hint="Subtle treatment for dense toolbars."
              />
            </div>
            <div class="space-y-3 rounded-2xl border border-slate-200 bg-slate-50 p-5">
              <h3 class="text-sm font-semibold text-slate-800">Emoji</h3>
              <Pyraui.Components.ThemeSwitch.theme_switch
                icon_style={:emoji}
                variant={:glass}
                show_label={true}
                label_position={:stacked}
                hint="Perfect for playful apps and marketing sites."
              />
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.theme_switch variant={:gradient} icon_style={:dual} /&gt;
    &lt;.theme_switch variant={:outline} icon_style={:minimal} hint="Subtle toggle" /&gt;
    &lt;.theme_switch variant={:glass} icon_style={:emoji} show_label label_position={:stacked} /&gt;
    </code>
            </pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
