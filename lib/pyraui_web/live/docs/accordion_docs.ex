defmodule PyrauiWeb.DocsLive.AccordionDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="space-y-12 rounded-3xl border border-slate-200 bg-white px-6 py-10 text-slate-900 shadow-lg">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-100 px-4 py-1 text-xs font-semibold uppercase tracking-[0.3em] text-slate-600">
            Accordion <span class="h-1 w-1 rounded-full bg-slate-500"></span> Layered Content
          </span>
          <h1 class="text-4xl font-semibold tracking-tight text-slate-900">Accordion</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Collapsible sections with buttery-smooth transitions that keep dense information organised. Perfect for FAQs, advanced settings, or progressive disclosure flows.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-md transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-6 lg:flex-row lg:items-start lg:justify-between">
            <div class="space-y-2">
              <h2 class="text-2xl font-semibold text-slate-900">Interactive Example</h2>
              <p class="max-w-xl text-sm text-slate-600">
                Compose rich content within each item and decide which panels open by default for a guided story.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-100 px-4 py-1 text-[10px] uppercase tracking-[0.35em] text-slate-500">
              Auto collapse
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-100 bg-slate-50 px-6 py-5">
            <Pyraui.Components.Accordion.accordion>
              <:item id="accordion-design" title="Design strategy" open={true}>
                <p class="text-sm leading-6 text-slate-600">
                  Focus on progressive disclosure to keep your surfaces calm. Use accordions to tuck away secondary controls while keeping essential actions visible.
                </p>
              </:item>
              <:item id="accordion-content" title="Content patterns" open={false}>
                <ul class="space-y-2 text-sm text-slate-600">
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-slate-400"></span>
                    Pair concise titles with short supporting copy.
                  </li>
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-slate-400"></span>
                    Ensure interactive elements sit inside the panel, not in the summary.
                  </li>
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-slate-400"></span>
                    Use icons or badges sparingly for additional hierarchy.
                  </li>
                </ul>
              </:item>
              <:item id="accordion-motion" title="Micro-interactions" open={false}>
                <p class="text-sm text-slate-600">
                  The component ships with subtle easing to avoid jarring jumps. Extend with Tailwind transitions for deeper motion stories.
                </p>
              </:item>
            </Pyraui.Components.Accordion.accordion>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-white p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.accordion class="space-y-3"&gt;
    &lt;:item id="accordion-design" title="Design strategy" open={true}&gt;
    ...
    &lt;/:item&gt;
    &lt;:item id="accordion-content" title="Content patterns" open={false}&gt;
    ...
    &lt;/:item&gt;
    &lt;/.accordion&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-md transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Usage Notes</h2>
              <p class="mt-2 max-w-2xl text-sm text-slate-600">
                Small heuristics to keep accordion experiences intuitive and accessible.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 text-xs uppercase tracking-[0.35em] text-slate-500">
              <span class="h-2 w-2 rounded-full bg-slate-400"></span> Guidelines
            </div>
          </div>

          <ul class="mt-6 space-y-3 text-sm text-slate-600">
            <li class="flex items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-slate-400">
              </span>
              <span>
                Keep summary rows concise. Long titles wrap to two lines max for ideal readability.
              </span>
            </li>
            <li class="flex items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-slate-400">
              </span>
              <span>
                Default one key panel to open when the section loads so users see a preview of the content style.
              </span>
            </li>
            <li class="flex items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-slate-400">
              </span>
              <span>
                Wrap complex layouts inside the panel body using flex/grid utilities to maintain rhythm.
              </span>
            </li>
          </ul>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-sm">
          <h2 class="text-2xl font-semibold text-slate-900">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Drive the accordion with expressive slot attributes while inheriting accessible semantics out of the box.
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
                  <td class="px-6 py-4 font-medium text-slate-900">item (slot)</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-slate-500">required</td>
                  <td class="px-6 py-4">
                    Accordion rows with <code class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">id</code>, <code class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">title</code>, and optional <code class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">open</code>.
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
