defmodule PyrauiWeb.DocsLive.GaugeDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-emerald-600">
            Gauge <span class="h-1 w-1 rounded-full bg-emerald-500"></span> KPIs
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Gauge</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Circular KPI dials driven by pure SVG. Perfect for spotlighting percentage progress, system health, or SLA compliance inside stats tiles and overview dashboards.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Core Usage</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Pass a value and optional label. Gauges normalise automatically against the max you provide (default 100).
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              At-a-glance
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-6">
            <div class="flex flex-wrap items-center gap-10">
              <Pyraui.Components.Gauge.gauge value={72.0} label="CPU" />
              <Pyraui.Components.Gauge.gauge value={45.0} label="Memory" />
              <Pyraui.Components.Gauge.gauge value={88.0} max={120.0} label="Throughput" />
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.gauge value={72} label="CPU" /&gt;
    &lt;.gauge value={88} max={120} label="Throughput" /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Variants &amp; Sizes</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Use semantic variants out of the box and choose a size that fits your card or tile layout.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Semantic tones
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Status variants</h3>
              <div class="flex flex-wrap items-center gap-10">
                <Pyraui.Components.Gauge.gauge value={82.0} variant={:success} label="Healthy" />
                <Pyraui.Components.Gauge.gauge value={56.0} variant={:warning} label="At Risk" />
                <Pyraui.Components.Gauge.gauge value={34.0} variant={:error} label="Critical" />
              </div>
            </div>

            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Size presets</h3>
              <div class="flex flex-wrap items-center gap-10">
                <Pyraui.Components.Gauge.gauge value={64.0} size={:sm} label="Small" />
                <Pyraui.Components.Gauge.gauge value={64.0} size={:md} label="Medium" />
                <Pyraui.Components.Gauge.gauge value={64.0} size={:lg} label="Large" />
              </div>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Custom Colors</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Override the stroke with any brand colour or gradient token via the new
                <code class="rounded bg-slate-100 px-1 text-xs">color</code>
                attribute.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              On-brand hues
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-6">
            <div class="flex flex-wrap items-center gap-10">
              <Pyraui.Components.Gauge.gauge value={92.0} color="#6366f1" label="Uptime" />
              <Pyraui.Components.Gauge.gauge value={48.0} color="#0ea5e9" label="Expansion" />
              <Pyraui.Components.Gauge.gauge value={75.0} color="#f43f5e" label="Engagement" />
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.gauge value={92} color="#6366f1" label="Uptime" /&gt;
    &lt;.gauge value={48} color="#0ea5e9" label="Expansion" /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Keep the API simple and expressive. Variants cover common semantic states; use
            <code class="rounded bg-slate-100 px-1 text-xs">color</code>
            for bespoke brand palettes.
          </p>

          <div class="mt-6 overflow-hidden rounded-2xl border border-slate-200">
            <table class="min-w-full divide-y divide-slate-100 text-sm">
              <thead class="bg-slate-50 text-xs uppercase tracking-[0.2em] text-slate-500">
                <tr>
                  <th class="px-6 py-4 text-left">Prop</th>
                  <th class="px-6 py-4 text-left">Type</th>
                  <th class="px-6 py-4 text-left">Default</th>
                  <th class="px-6 py-4 text-left">Description</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-slate-100 bg-white text-slate-700">
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">value</td>
                  <td class="px-6 py-4">float</td>
                  <td class="px-6 py-4 text-emerald-500">—</td>
                  <td class="px-6 py-4">
                    Current measurement rendered as a percentage of <code class="rounded bg-slate-100 px-1 text-xs">max</code>.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">max</td>
                  <td class="px-6 py-4">float</td>
                  <td class="px-6 py-4 text-emerald-500">100.0</td>
                  <td class="px-6 py-4">Upper bound used to compute the percentage.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">label</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-emerald-500">nil</td>
                  <td class="px-6 py-4">Optional caption rendered beneath the percentage.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">variant</td>
                  <td class="px-6 py-4">:primary | :success | :warning | :error</td>
                  <td class="px-6 py-4 text-emerald-500">:primary</td>
                  <td class="px-6 py-4">Preset stroke colour for semantic states.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">color</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-emerald-500">nil</td>
                  <td class="px-6 py-4">
                    Custom hex / CSS colour that overrides the variant palette.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">size</td>
                  <td class="px-6 py-4">:sm | :md | :lg</td>
                  <td class="px-6 py-4 text-emerald-500">:md</td>
                  <td class="px-6 py-4">Adjusts the SVG radius and stroke width.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-emerald-500">""</td>
                  <td class="px-6 py-4">Append classes to the wrapper for layout tweaks.</td>
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
