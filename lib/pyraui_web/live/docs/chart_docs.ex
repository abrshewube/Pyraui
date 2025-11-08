defmodule PyrauiWeb.DocsLive.ChartDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="w-full bg-white text-slate-900">
      <div class="mx-auto w-full max-w-7xl space-y-16">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-indigo-200 bg-indigo-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-indigo-600">
            Chart <span class="h-1 w-1 rounded-full bg-indigo-500"></span> Gallery
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Chart</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            SVG-based data visualisations with no external dependencies. Let each canvas stretch to the viewport so dashboards feel cinematic and data-dense.
          </p>
        </header>

        <section class="space-y-10">
          <div class="flex flex-col gap-6 md:flex-row md:items-start md:justify-between">
            <div class="max-w-2xl space-y-2">
              <h2 class="text-3xl font-semibold">Line Charts</h2>
              <p class="text-sm text-slate-600">
                Track momentum with precise or smoothed curves. Each SVG scales with the grid, so hero charts and compact insights reuse the same component.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Motion-aware
            </div>
          </div>

          <div class="grid gap-12 xl:grid-cols-2">
            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Linear series
              </h3>
              <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:line}
                  width={480}
                  height={280}
                  data={[12, 24, 31, 28, 36, 42, 38]}
                  labels={~w(Jan Feb Mar Apr May Jun Jul)}
                />
              </div>
            </div>

            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Smoothed performance
              </h3>
              <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:line}
                  width={480}
                  height={280}
                  curved={true}
                  data={[18, 22, 40, 52, 47, 60, 68, 58]}
                  labels={~w(Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8)}
                />
              </div>
            </div>
          </div>

          <pre class="overflow-x-auto rounded-xl bg-slate-900/95 p-6 text-sm leading-6 text-slate-100 shadow-[0_25px_80px_-60px_rgba(15,23,42,0.75)]">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart type={:line} data={[12, 24, 31, 28]} labels={~w(Jan Feb Mar Apr)} width={920} height={320} /&gt;
    &lt;.chart type={:line} curved data={[18, 22, 40, 52]} width={920} height={320} /&gt;
    </code>
          </pre>
        </section>

        <section class="space-y-10">
          <div class="flex flex-col gap-6 md:flex-row md:items-start md:justify-between">
            <div class="max-w-2xl space-y-2">
              <h2 class="text-3xl font-semibold">Bar Charts</h2>
              <p class="text-sm text-slate-600">
                Showcase distribution and composition. Capsule columns and gradients adapt to any width so comparison plots read clearly on ultra-wide grids.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Capsule columns
            </div>
          </div>

          <div class="grid gap-12 xl:grid-cols-2">
            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Quarterly revenue
              </h3>
              <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:bar}
                  width={480}
                  height={280}
                  data={[28, 40, 32, 54, 61]}
                  labels={~w(Q1 Q2 Q3 Q4 Q5)}
                />
              </div>
            </div>

            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Category mix
              </h3>
              <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:bar}
                  width={480}
                  height={280}
                  corner_radius={10}
                  colors={["#0ea5e9", "#38bdf8", "#a855f7", "#f97316"]}
                  data={[18, 26, 22, 31]}
                  labels={~w(Email Push Paid Organic)}
                />
              </div>
            </div>
          </div>

          <pre class="overflow-x-auto rounded-xl bg-slate-900/95 p-6 text-sm leading-6 text-slate-100 shadow-[0_25px_80px_-60px_rgba(15,23,42,0.75)]">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart type={:bar} data={[28, 40, 32, 54]} labels={~w(Q1 Q2 Q3 Q4)} width={920} height={320} /&gt;
    &lt;.chart type={:bar} data={[18, 26, 22, 31]} corner_radius={10} width={920} height={320} /&gt;
    </code>
          </pre>
        </section>

        <section class="space-y-10">
          <div class="flex flex-col gap-6 md:flex-row md:items-start md:justify-between">
            <div class="max-w-2xl space-y-2">
              <h2 class="text-3xl font-semibold">Pie &amp; Donut</h2>
              <p class="text-sm text-slate-600">
                Perfect for proportions, share of voice, and device distribution. Donut mode keeps centre space ready for a KPI or storyteller annotation.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Share insights
            </div>
          </div>

          <div class="grid gap-12 md:grid-cols-2 lg:max-w-4xl">
            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Channel share
              </h3>
              <div class="flex items-center justify-center rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:pie}
                  width={300}
                  height={300}
                  data={[34, 26, 18, 12, 10]}
                  labels={["Enterprise", "Growth", "Self-serve", "Partners", "Trials"]}
                />
              </div>
            </div>

            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Device mix (donut)
              </h3>
              <div class="flex items-center justify-center rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:donut}
                  width={300}
                  height={300}
                  colors={["#0ea5e9", "#22c55e", "#f97316", "#6366f1"]}
                  data={[52, 32, 10, 6]}
                  labels={["Desktop", "Mobile", "Tablet", "Other"]}
                />
              </div>
            </div>
          </div>
        </section>

        <section class="space-y-10">
          <div class="flex flex-col gap-6 md:flex-row md:items-start md:justify-between">
            <div class="max-w-2xl space-y-2">
              <h2 class="text-3xl font-semibold">Area &amp; Sparkline</h2>
              <p class="text-sm text-slate-600">
                Highlight macro trends and compact micro-interactions. Wide canvases allow the area gradient to breathe, while sparklines stay punchy.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Momentum views
            </div>
          </div>

          <div class="space-y-10">
            <div class="space-y-4">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Area trend
              </h3>
              <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
                <Pyraui.Components.Chart.chart
                  class="w-full"
                  type={:area}
                  width={640}
                  height={300}
                  curved={true}
                  fill_opacity={0.45}
                  data={[14, 22, 30, 45, 32, 48, 56, 62]}
                />
              </div>
            </div>

            <div class="space-y-6">
              <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
                Sparklines
              </h3>
              <div class="grid gap-4 sm:grid-cols-2">
                <div class="rounded-2xl border border-slate-200 bg-white/80 p-4 shadow-sm">
                  <Pyraui.Components.Chart.chart
                    class="w-full"
                    type={:sparkline}
                    width={240}
                    height={90}
                    data={[12, 14, 11, 18, 21, 24, 22]}
                  />
                </div>
                <div class="rounded-2xl border border-slate-200 bg-white/80 p-4 shadow-sm">
                  <Pyraui.Components.Chart.chart
                    class="w-full"
                    type={:sparkline}
                    width={240}
                    height={90}
                    colors={["#f97316"]}
                    data={[20, 18, 22, 26, 23, 28, 34]}
                  />
                </div>
              </div>
            </div>
          </div>
        </section>

        <section class="space-y-10">
          <div class="flex flex-col gap-6 md:flex-row md:items-start md:justify-between">
            <div class="max-w-2xl space-y-2">
              <h2 class="text-3xl font-semibold">Stacked Columns</h2>
              <p class="text-sm text-slate-600">
                Layer multiple datasets per category for product mix, cost breakdowns, or roadmap allocation. The wide canvas keeps legends readable.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Multi-series
            </div>
          </div>

          <div class="space-y-4">
            <h3 class="text-sm font-semibold uppercase tracking-[0.2em] text-slate-500">
              Quarterly allocation
            </h3>
            <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white/80 p-6 shadow-sm">
              <Pyraui.Components.Chart.chart
                class="w-full"
                type={:stacked}
                width={680}
                height={320}
                data={[60, 78, 84, 96]}
                datasets={[
                  %{label: "Design", values: [12, 16, 18, 20], colors: ["#6366f1"]},
                  %{label: "Frontend", values: [18, 22, 24, 28], colors: ["#22d3ee"]},
                  %{label: "Backend", values: [20, 24, 26, 30], colors: ["#f97316"]},
                  %{label: "Ops", values: [10, 16, 16, 18], colors: ["#facc15"]}
                ]}
              />
            </div>
          </div>

          <pre class="overflow-x-auto rounded-xl bg-slate-900/95 p-6 text-sm leading-6 text-slate-100 shadow-[0_25px_80px_-60px_rgba(15,23,42,0.75)]">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.chart
    type={:stacked}
    data={[60, 78, 84, 96]}
    datasets={[
    %{label: "Design", values: [12, 16, 18, 20], colors: ["#6366f1"]},
    %{label: "Frontend", values: [18, 22, 24, 28], colors: ["#22d3ee"]},
    %{label: "Backend", values: [20, 24, 26, 30], colors: ["#f97316"]}
    ]}
    width={980}
    height={360}
    /&gt;
    </code>
          </pre>
        </section>

        <section class="space-y-6 border-t border-slate-200 pt-12">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="max-w-3xl text-sm text-slate-600">
            Configure charts with concise options. All charts respect the numeric width and height you provide, so pick viewport-scale values when you want cinematic layouts.
          </p>

          <div class="overflow-hidden rounded-2xl border border-slate-200">
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
                  <td class="px-6 py-4">
                    Render size in pixels (SVG). Scale up for immersive dashboards.
                  </td>
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
