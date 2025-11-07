defmodule PyrauiWeb.DocsLive.ThemeConfigDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="relative overflow-hidden rounded-3xl border border-white/10 bg-slate-950/95 px-6 py-10 text-slate-100 shadow-[0_50px_140px_-70px_rgba(99,102,241,0.55)]">
      <div class="pointer-events-none absolute -top-48 right-[-20%] h-96 w-96 rounded-full bg-indigo-500/25 blur-3xl">
      </div>
      <div class="pointer-events-none absolute -bottom-56 left-[-10%] h-[28rem] w-[28rem] rounded-full bg-cyan-500/20 blur-3xl">
      </div>
      <div class="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_center,_rgba(59,130,246,0.12),_transparent_65%)]">
      </div>

      <div class="relative z-10 space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-indigo-500/40 bg-indigo-500/10 px-4 py-1 text-xs font-semibold uppercase tracking-[0.3em] text-indigo-200">
            Theme <span class="h-1 w-1 rounded-full bg-indigo-300/80"></span> Config
          </span>
          <h1 class="text-4xl font-semibold tracking-tight text-slate-50">Theme Configuration</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-300">
            Configurable theme system with color, spacing, and font tokens. Use the `Pyraui.Theme` module to orchestrate consistent styling programmatically across your product.
          </p>
        </header>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:border-cyan-400/60 hover:shadow-[0_30px_90px_-60px_rgba(14,165,233,0.45)]">
          <div class="flex flex-col gap-2">
            <h2 class="text-2xl font-semibold text-slate-50">Color Tokens</h2>
            <p class="text-sm text-slate-300">
              Curated palette engineered for luminous contrast on dark surfaces.
            </p>
          </div>

          <div class="mt-8 grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
            <%= for {name, value} <- @colors do %>
              <div class="group relative overflow-hidden rounded-2xl border border-white/10 bg-slate-950/60 p-4 transition-all duration-300 hover:-translate-y-1 hover:border-cyan-300/60 hover:shadow-[0_24px_80px_-50px_rgba(14,165,233,0.5)]">
                <div class="flex items-center justify-between">
                  <div
                    class="h-16 w-16 rounded-xl border border-white/10 shadow-inner shadow-slate-950/40"
                    style={"background-color: #{value}"}
                  >
                  </div>
                  <span class="text-[10px] uppercase tracking-[0.4em] text-slate-400">{name}</span>
                </div>
                <div class="mt-4 flex items-center justify-between text-xs text-slate-400">
                  <span class="font-mono text-cyan-200">{value}</span>
                  <span class="rounded-full border border-white/10 bg-white/10 px-3 py-1 text-[10px] uppercase tracking-[0.35em] text-slate-300">
                    Token
                  </span>
                </div>
              </div>
            <% end %>
          </div>

          <div class="mt-8 rounded-2xl border border-white/5 bg-slate-950/80 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-cyan-100">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    # Get a color token
    Pyraui.Theme.color(:primary)
    # =&gt; "oklch(70% 0.213 47.604)"

    # Get all colors
    Pyraui.Theme.colors()
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:border-indigo-400/60 hover:shadow-[0_30px_90px_-60px_rgba(99,102,241,0.45)]">
          <div class="flex flex-col gap-2">
            <h2 class="text-2xl font-semibold text-slate-50">Spacing Tokens</h2>
            <p class="text-sm text-slate-300">
              Modular scale spacing mapped to responsive rhythm.
            </p>
          </div>

          <div class="mt-8 space-y-3">
            <%= for {name, value} <- @spacing do %>
              <div class="flex items-center gap-4 rounded-2xl border border-white/10 bg-slate-950/60 px-4 py-4 transition-all duration-300 hover:-translate-y-1 hover:border-indigo-300/60">
                <div class="w-20 text-sm font-medium uppercase tracking-[0.2em] text-slate-300">
                  {name}
                </div>
                <div class="relative flex-1 overflow-hidden rounded-full border border-white/10 bg-slate-900/80">
                  <div
                    class="h-2 bg-gradient-to-r from-cyan-400 via-indigo-500 to-purple-500"
                    style={"width: clamp(#{value}, 20%, 100%);"}
                  >
                  </div>
                </div>
                <div class="w-24 text-right text-xs font-mono text-slate-400">{value}</div>
              </div>
            <% end %>
          </div>

          <div class="mt-8 rounded-2xl border border-white/5 bg-slate-950/80 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-cyan-100">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    # Get a spacing token
    Pyraui.Theme.spacing(:md)
    # =&gt; "1rem"

    # Get all spacing tokens
    Pyraui.Theme.spacing_tokens()
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:border-purple-400/60 hover:shadow-[0_30px_90px_-60px_rgba(168,85,247,0.45)]">
          <div class="flex flex-col gap-2">
            <h2 class="text-2xl font-semibold text-slate-50">Font Tokens</h2>
            <p class="text-sm text-slate-300">
              Typography stacks that deliver clarity across platforms.
            </p>
          </div>

          <div class="mt-8 space-y-4">
            <%= for {name, families} <- @fonts do %>
              <div class="rounded-2xl border border-white/10 bg-slate-950/60 p-4 transition-all duration-300 hover:-translate-y-1 hover:border-purple-300/60">
                <div class="text-xs font-semibold uppercase tracking-[0.3em] text-slate-300">
                  {name}
                </div>
                <div
                  class="mt-3 text-lg text-slate-100"
                  style={"font-family: #{Enum.join(families, ", ")}"}
                >
                  The quick brown fox jumps over the lazy dog
                </div>
                <div class="mt-3 flex flex-wrap items-center gap-2 text-xs font-mono text-slate-400">
                  <span class="rounded-full border border-white/10 bg-white/10 px-3 py-1 text-[10px] uppercase tracking-[0.3em] text-slate-300">
                    Stack
                  </span>
                  {Enum.join(families, ", ")}
                </div>
              </div>
            <% end %>
          </div>

          <div class="mt-8 rounded-2xl border border-white/5 bg-slate-950/80 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-cyan-100">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    # Get a font token
    Pyraui.Theme.font(:sans)
    # =&gt; ["ui-sans-serif", "system-ui", "sans-serif"]

    # Get all fonts
    Pyraui.Theme.fonts()
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm">
          <div class="flex flex-col gap-2">
            <h2 class="text-2xl font-semibold text-slate-50">Theme Functions</h2>
            <p class="text-sm text-slate-300">
              Leverage helper functions to access tokens inside LiveViews, components, and modules.
            </p>
          </div>

          <div class="mt-6 overflow-hidden rounded-2xl border border-white/10">
            <table class="min-w-full divide-y divide-white/10 text-sm">
              <thead class="bg-slate-950/60 text-xs uppercase tracking-[0.2em] text-slate-300">
                <tr>
                  <th class="px-6 py-4 text-left">Function</th>
                  <th class="px-6 py-4 text-left">Description</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-white/5 bg-slate-950/30 text-slate-200">
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-50">Pyraui.Theme.color/1</td>
                  <td class="px-6 py-4">Get a color token value</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-50">Pyraui.Theme.spacing/1</td>
                  <td class="px-6 py-4">Get a spacing token value</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-50">Pyraui.Theme.font/1</td>
                  <td class="px-6 py-4">Get a font token value</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-50">Pyraui.Theme.current_theme/1</td>
                  <td class="px-6 py-4">Get current theme from assigns</td>
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
