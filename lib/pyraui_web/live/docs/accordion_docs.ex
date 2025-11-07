defmodule PyrauiWeb.DocsLive.AccordionDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="relative overflow-hidden rounded-3xl border border-white/10 bg-slate-950/95 px-6 py-10 text-slate-100 shadow-[0_60px_140px_-70px_rgba(99,102,241,0.55)]">
      <div class="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_top,_rgba(129,140,248,0.14),_transparent_55%)]">
      </div>
      <div class="pointer-events-none absolute -top-40 -left-24 h-96 w-96 rounded-full bg-indigo-500/25 blur-3xl">
      </div>
      <div class="pointer-events-none absolute -bottom-52 right-[-15%] h-[28rem] w-[28rem] rounded-full bg-cyan-500/20 blur-3xl">
      </div>

      <div class="relative z-10 space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-indigo-400/50 bg-indigo-400/15 px-4 py-1 text-xs font-semibold uppercase tracking-[0.3em] text-indigo-100">
            Accordion <span class="h-1 w-1 rounded-full bg-indigo-200/80"></span> Layered Content
          </span>
          <h1 class="text-4xl font-semibold tracking-tight text-slate-50">Accordion</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-300">
            Collapsible sections with buttery-smooth transitions that keep dense information organised. Perfect for FAQs, advanced settings, or progressive disclosure flows.
          </p>
        </header>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:border-indigo-300/60 hover:shadow-[0_40px_110px_-80px_rgba(99,102,241,0.55)]">
          <div class="flex flex-col gap-6 lg:flex-row lg:items-start lg:justify-between">
            <div class="space-y-2">
              <h2 class="text-2xl font-semibold text-slate-50">Interactive Example</h2>
              <p class="max-w-xl text-sm text-slate-300">
                Compose rich content within each item and decide which panels open by default for a guided story.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/10 px-4 py-1 text-[10px] uppercase tracking-[0.35em] text-slate-200/80">
              Auto Collapse
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-white/10 bg-slate-950/70 px-6 py-5 shadow-inner shadow-slate-950/40">
            <Pyraui.Components.Accordion.accordion class="space-y-3">
              <:item id="accordion-design" title="Design strategy" open={true}>
                <p class="text-sm leading-6 text-slate-200">
                  Focus on progressive disclosure to keep your surfaces calm. Use accordions to tuck away secondary controls while keeping essential actions visible.
                </p>
              </:item>
              <:item id="accordion-content" title="Content patterns" open={false}>
                <ul class="space-y-2 text-sm text-slate-200">
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-indigo-300"></span>
                    Pair concise titles with short supporting copy.
                  </li>
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-indigo-300"></span>
                    Ensure interactive elements sit inside the panel, not in the summary.
                  </li>
                  <li class="flex items-start gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-indigo-300"></span>
                    Use icons or badges sparingly for additional hierarchy.
                  </li>
                </ul>
              </:item>
              <:item id="accordion-motion" title="Micro-interactions" open={false}>
                <p class="text-sm text-slate-200">
                  The component ships with subtle easing to avoid jarring jumps. Extend with Tailwind transitions for deeper motion stories.
                </p>
              </:item>
            </Pyraui.Components.Accordion.accordion>
          </div>

          <div class="mt-8 rounded-2xl border border-white/5 bg-slate-950/80 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-indigo-100">
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

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:border-cyan-300/60 hover:shadow-[0_40px_110px_-80px_rgba(14,165,233,0.45)]">
          <div class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-50">Usage Notes</h2>
              <p class="mt-2 max-w-2xl text-sm text-slate-300">
                Small heuristics to keep accordion experiences intuitive and accessible.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 text-xs uppercase tracking-[0.35em] text-slate-300">
              <span class="h-2 w-2 rounded-full bg-cyan-300"></span> Guidelines
            </div>
          </div>

          <ul class="mt-6 space-y-3 text-sm text-slate-200">
            <li class="flex items-start gap-3 rounded-2xl border border-white/10 bg-slate-950/60 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-cyan-300">
              </span>
              <span>
                Keep summary rows concise. Long titles wrap to two lines max for ideal readability.
              </span>
            </li>
            <li class="flex items-start gap-3 rounded-2xl border border-white/10 bg-slate-950/60 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-cyan-300">
              </span>
              <span>
                Default one key panel to open when the section loads so users see a preview of the content style.
              </span>
            </li>
            <li class="flex items-start gap-3 rounded-2xl border border-white/10 bg-slate-950/60 px-4 py-3">
              <span class="mt-1 inline-flex h-2.5 w-2.5 flex-shrink-0 rounded-full bg-cyan-300">
              </span>
              <span>
                Wrap complex layouts inside the panel body using flex/grid utilities to maintain rhythm.
              </span>
            </li>
          </ul>
        </section>

        <section class="rounded-2xl border border-white/10 bg-slate-900/70 p-8 backdrop-blur-sm">
          <h2 class="text-2xl font-semibold text-slate-50">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-300">
            Drive the accordion with expressive slot attributes while inheriting accessible semantics out of the box.
          </p>

          <div class="mt-6 overflow-hidden rounded-2xl border border-white/10">
            <table class="min-w-full divide-y divide-white/10 text-sm">
              <thead class="bg-slate-950/60 text-xs uppercase tracking-[0.2em] text-slate-300">
                <tr>
                  <th class="px-6 py-4 text-left">Prop</th>
                  <th class="px-6 py-4 text-left">Type</th>
                  <th class="px-6 py-4 text-left">Default</th>
                  <th class="px-6 py-4 text-left">Description</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-white/5 bg-slate-950/30 text-slate-200">
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-50">item (slot)</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-indigo-200">required</td>
                  <td class="px-6 py-4">
                    Accordion rows with <code class="rounded bg-slate-800 px-1.5 py-0.5 text-xs text-indigo-200">id</code>, <code class="rounded bg-slate-800 px-1.5 py-0.5 text-xs text-indigo-200">title</code>, and optional <code class="rounded bg-slate-800 px-1.5 py-0.5 text-xs text-indigo-200">open</code>.
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
