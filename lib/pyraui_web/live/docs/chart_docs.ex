defmodule PyrauiWeb.DocsLive.ChartDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-indigo-200 bg-indigo-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-indigo-600">
            Chart <span class="h-1 w-1 rounded-full bg-indigo-500"></span> Gallery
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Chart</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            SVG-based data visualisations with no external dependencies. Mix and match sizing,
            colours, stacked datasets, and smoothing to compose dashboards, reporting, or inline data pulses.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Line Charts</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Track trends with default or smoothed curves. Adjust height and width to match dense dashboards or widescreen hero visualisations.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Motion-aware
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Linear series</h3>
              <Pyraui.Components.Chart.chart
                type={:line}
                width={480}
                height={260}
                data={[12, 24, 31, 28, 36, 42, 38]}
                labels={~w(Jan Feb Mar Apr May Jun Jul)}
              />
            </div>

            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Smoothed performance</h3>
              <Pyraui.Components.Chart.chart
                type={:line}
                width={480}
                height={260}
                curved={true}
                data={[18, 22, 40, 52, 47, 60, 68, 58]}
                labels={~w(Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8)}
              />
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart type={:line} data={[12, 24, 31, 28]} labels={~w(Jan Feb Mar Apr)} /&gt;
    &lt;.chart type={:line} curved data={[18, 22, 40, 52]} width={480} height={260} /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Bar Charts</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Compare categories and use custom colour palettes for product mix, revenue segments, or multi-tenant analytics.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Capsule columns
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Quarterly revenue</h3>
              <Pyraui.Components.Chart.chart
                type={:bar}
                width={480}
                height={260}
                data={[28, 40, 32, 54, 61]}
                labels={~w(Q1 Q2 Q3 Q4 Q5)}
              />
            </div>

            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Category mix</h3>
              <Pyraui.Components.Chart.chart
                type={:bar}
                width={480}
                height={260}
                corner_radius={8}
                colors={["#0ea5e9", "#38bdf8", "#a855f7", "#f97316"]}
                data={[18, 26, 22, 31]}
                labels={~w(Email Push Paid Organic)}
              />
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart type={:bar} data={[28, 40, 32, 54]} labels={~w(Q1 Q2 Q3 Q4)} /&gt;
    &lt;.chart
      type={:bar}
      colors={["#0ea5e9", "#38bdf8", "#a855f7", "#f97316"]}
      corner_radius={8}
      data={[18, 26, 22, 31]}
    /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Pie &amp; Donut</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Perfect for proportions, share of voice, and device distribution. Use donut mode for richer inner labels or metrics.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Share insights
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Channel share</h3>
              <Pyraui.Components.Chart.chart
                type={:pie}
                width={320}
                height={320}
                data={[34, 26, 18, 12, 10]}
                labels={["Enterprise", "Growth", "Self-serve", "Partners", "Trials"]}
              />
            </div>

            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Device mix (donut)</h3>
              <Pyraui.Components.Chart.chart
                type={:donut}
                width={320}
                height={320}
                colors={["#0ea5e9", "#22c55e", "#f97316", "#6366f1"]}
                data={[52, 32, 10, 6]}
                labels={["Desktop", "Mobile", "Tablet", "Other"]}
              />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Area &amp; Sparkline</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Highlight momentum with filled areas or micro sparklines for compact tiles and table cells.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Momentum views
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Area trend</h3>
              <Pyraui.Components.Chart.chart
                type={:area}
                width={480}
                height={260}
                curved={true}
                fill_opacity={0.45}
                data={[14, 22, 30, 45, 32, 48, 56, 62]}
              />
            </div>

            <div class="space-y-4 rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Sparklines</h3>
              <div class="grid gap-3 sm:grid-cols-2">
                <Pyraui.Components.Chart.chart
                  type={:sparkline}
                  width={220}
                  height={70}
                  data={[12, 14, 11, 18, 21, 24, 22]}
                />
                <Pyraui.Components.Chart.chart
                  type={:sparkline}
                  width={220}
                  height={70}
                  colors={["#f97316"]}
                  data={[20, 18, 22, 26, 23, 28, 34]}
                />
              </div>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Stacked Columns</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Layer multiple datasets per category for product mix, cost breakdowns, or roadmap allocation.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Multi-series
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-6">
            <h3 class="text-sm font-semibold text-slate-800">Quarterly allocation</h3>
            <Pyraui.Components.Chart.chart
              type={:stacked}
              width={520}
              height={280}
              data={[60, 78, 84, 96]}
              datasets={[
                %{label: "Design", values: [12, 16, 18, 20], colors: ["#6366f1"]},
                %{label: "Frontend", values: [18, 22, 24, 28], colors: ["#22d3ee"]},
                %{label: "Backend", values: [20, 24, 26, 30], colors: ["#f97316"]},
                %{label: "Ops", values: [10, 16, 16, 18], colors: ["#facc15"]}
              ]}
            />
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart
      type={:stacked}
      data={[60, 78, 84, 96]}
      datasets={[
        %{label: "Design", values: [12, 16, 18, 20], colors: ["#6366f1"]},
        %{label: "Frontend", values: [18, 22, 24, 28], colors: ["#22d3ee"]},
        %{label: "Backend", values: [20, 24, 26, 30], colors: ["#f97316"]}
      ]}
    /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Configure charts with concise options. All charts are responsive to the width/height you provide and support custom colour palettes.
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
                  <td class="px-6 py-4 font-medium text-slate-900">type</td>
                  <td class="px-6 py-4">atom</td>
                  <td class="px-6 py-4 text-indigo-500">—</td>
                  <td class="px-6 py-4">
                    Choose :line, :bar, :pie, :donut, :area, :stacked, or :sparkline.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">data</td>
                  <td class="px-6 py-4">list</td>
                  <td class="px-6 py-4 text-indigo-500">—</td>
                  <td class="px-6 py-4">
                    Primary dataset. For stacked charts, set it to totals per category.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">datasets</td>
                  <td class="px-6 py-4">list | nil</td>
                  <td class="px-6 py-4 text-indigo-500">nil</td>
                  <td class="px-6 py-4">
                    Stacked chart series. Each entry accepts :values and optional :colors.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">labels</td>
                  <td class="px-6 py-4">list</td>
                  <td class="px-6 py-4 text-indigo-500">[]</td>
                  <td class="px-6 py-4">Optional labels for tooltips and accessibility.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">width / height</td>
                  <td class="px-6 py-4">integer</td>
                  <td class="px-6 py-4 text-indigo-500">400 / 300</td>
                  <td class="px-6 py-4">Render size in pixels (SVG). Adjust to suit your layout.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">colors</td>
                  <td class="px-6 py-4">list | nil</td>
                  <td class="px-6 py-4 text-indigo-500">auto</td>
                  <td class="px-6 py-4">
                    Override default palette. Applies cyclically across values.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">curved</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-indigo-500">false</td>
                  <td class="px-6 py-4">Smooth line/area charts using quadratic Bézier curves.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">fill_opacity</td>
                  <td class="px-6 py-4">float</td>
                  <td class="px-6 py-4 text-indigo-500">0.3</td>
                  <td class="px-6 py-4">Adjust the area fill intensity.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">corner_radius</td>
                  <td class="px-6 py-4">integer</td>
                  <td class="px-6 py-4 text-indigo-500">4</td>
                  <td class="px-6 py-4">Bar/stacked bar radius for softer columns.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-indigo-500">""</td>
                  <td class="px-6 py-4">
                    Append classes to the outer container for layout adjustments.
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
