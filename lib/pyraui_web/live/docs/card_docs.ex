defmodule PyrauiWeb.DocsLive.CardDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="space-y-16 py-12 text-slate-900">
      <header class="space-y-4">
        <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-slate-500">
          Card systems <span class="h-1 w-1 rounded-full bg-slate-400"></span> Galleries
        </span>
        <h1 class="text-4xl font-semibold tracking-tight text-slate-900 sm:text-5xl">
          Card
        </h1>
        <p class="max-w-3xl text-base leading-relaxed text-slate-600 sm:text-lg">
          The card component brings polished surfaces, gradients, and rich layout slots for marketing tiles, dashboards, and data summaries.
        </p>
      </header>

      <section class="space-y-12">
        <div class="space-y-3">
          <h2 class="text-2xl font-semibold text-slate-900">Hero tiles</h2>
          <p class="max-w-4xl text-sm text-slate-600">
            Blend gradients, media, badges, and footer actions with just a few slots. Hover states and tone gradients keep hero cards lively yet refined.
          </p>
        </div>

        <Pyraui.Components.Card.card tone={:sky} variant={:glass} hoverable class="w-full">
          <:badge>Featured</:badge>
          <:media>
            <img
              src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=80"
              alt="Team collaborating"
              class="h-60 w-full object-cover md:h-72"
            />
          </:media>
          <:header>
            <div class="space-y-2">
              <p class="text-xs uppercase tracking-[0.35em] text-white/70">Product launch</p>
              <h3 class="text-2xl font-semibold">Skyline Analytics</h3>
            </div>
          </:header>
          <p>
            Automate KPI synths, annotate trends, and broadcast live dashboards straight to investor workspaces with zero configuration.
          </p>
          <:footer>
            <div class="flex items-center gap-3">
              <span class="inline-flex items-center gap-1.5 rounded-full bg-white/15 px-3 py-1 text-xs font-semibold text-white/80">
                <PyrauiWeb.CoreComponents.icon name="hero-sparkles" class="h-4 w-4" /> AI insights
              </span>
              <span class="text-white/70">Usage · 12 teams</span>
            </div>
            <button class="rounded-full border border-white/40 px-4 py-1.5 text-xs font-semibold text-white hover:bg-white/10">
              Launch workspace
            </button>
          </:footer>
        </Pyraui.Components.Card.card>

        <pre class="overflow-x-auto rounded-xl bg-slate-900/95 p-6 text-sm leading-6 text-slate-100 shadow-[0_35px_90px_-60px_rgba(15,23,42,0.35)]">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.card tone={:sky} variant={:glass} hoverable&gt;
    &lt;:badge&gt;Featured&lt;/:badge&gt;
    &lt;:media&gt;
    &lt;img src="..." class="h-60 w-full object-cover md:h-72" /&gt;
    &lt;/:media&gt;
    &lt;:header&gt;
    &lt;h3 class="text-2xl font-semibold"&gt;Skyline Analytics&lt;/h3&gt;
    &lt;/:header&gt;
    Automate KPI synths and broadcast live dashboards.
    &lt;:footer&gt;
    &lt;span class="text-white/70"&gt;Usage · 12 teams&lt;/span&gt;
    &lt;button class="rounded-full border px-4 py-1.5"&gt;Launch workspace&lt;/button&gt;
    &lt;/:footer&gt;
    &lt;/.card&gt;
    </code>
        </pre>

        <Pyraui.Components.Card.card
          tone={:emerald}
          variant={:soft}
          hoverable
          shadow={:lg}
          class="w-full"
        >
          <:badge>New</:badge>
          <:header>
            <div class="space-y-2">
              <p class="text-xs uppercase tracking-[0.3em] text-emerald-500">Changelog</p>
              <h3 class="text-xl font-semibold text-slate-900">Collaboration cockpit</h3>
            </div>
          </:header>
          <ul class="space-y-2 text-sm leading-relaxed">
            <li class="flex items-start gap-2">
              <PyrauiWeb.CoreComponents.icon
                name="hero-check-circle"
                class="mt-0.5 h-4 w-4 text-emerald-500"
              /> Inline comment threads across every block.
            </li>
            <li class="flex items-start gap-2">
              <PyrauiWeb.CoreComponents.icon
                name="hero-check-circle"
                class="mt-0.5 h-4 w-4 text-emerald-500"
              /> Auto-summarised standups sent to Slack and Teams.
            </li>
            <li class="flex items-start gap-2">
              <PyrauiWeb.CoreComponents.icon
                name="hero-check-circle"
                class="mt-0.5 h-4 w-4 text-emerald-500"
              /> Figma, Linear, and GitHub presence indicators.
            </li>
          </ul>
          <:footer>
            <span class="text-slate-600">Rollout 2.4 · GA next week</span>
          </:footer>
        </Pyraui.Components.Card.card>

        <pre class="overflow-x-auto rounded-xl bg-slate-50 p-6 text-sm leading-6 text-slate-800 shadow-inner">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.card tone={:emerald} variant={:soft} hoverable shadow={:lg}&gt;
    &lt;:badge&gt;New&lt;/:badge&gt;
    &lt;:header&gt;
    &lt;h3 class="text-xl font-semibold"&gt;Collaboration cockpit&lt;/h3&gt;
    &lt;/:header&gt;
    &lt;ul class="space-y-2"&gt;
    &lt;li&gt;Inline comment threads across every block.&lt;/li&gt;
    ...
    &lt;/ul&gt;
    &lt;:footer&gt;
    &lt;span class="text-slate-600"&gt;Rollout 2.4 · GA next week&lt;/span&gt;
    &lt;/:footer&gt;
    &lt;/.card&gt;
    </code>
        </pre>

        <Pyraui.Components.Card.card
          tone={:violet}
          variant={:glass}
          hoverable
          padded={false}
          class="w-full"
        >
          <:media>
            <img
              src="https://images.unsplash.com/photo-1523475472560-d2df97ec485c?auto=format&fit=crop&w=1200&q=80"
              alt="Gradient campaign"
              class="h-56 w-full object-cover md:h-72"
            />
          </:media>
          <:header>
            <div class="space-y-2 px-6 pt-6">
              <p class="text-xs uppercase tracking-[0.3em] text-white/60">Campaign</p>
              <h4 class="text-xl font-semibold text-white">Nebula brand system</h4>
            </div>
          </:header>
          <div class="space-y-4 px-6 pb-6 text-white/80">
            <p>
              Nebula’s creative crew remixed PyraUI cards with tone gradients to balance vibrancy and readability across their hero surfaces.
            </p>
          </div>
        </Pyraui.Components.Card.card>
      </section>

      <section class="space-y-6">
        <div class="space-y-3">
          <h3 class="text-xl font-semibold text-slate-900">Variants &amp; tones</h3>
          <p class="text-sm text-slate-600">
            Mix visual styles—solid, soft, glass, and outline—with tones to match your brand palette.
          </p>
        </div>

        <div class="grid gap-6 md:grid-cols-2 xl:grid-cols-4">
          <Pyraui.Components.Card.card tone={:neutral} variant={:solid} hoverable>
            <:header>
              <h4 class="text-lg font-semibold text-slate-900">Solid minimal</h4>
            </:header>
            <p>
              Classic white surface with subtle depth. Ideal for dashboards, tables, and stacked layouts.
            </p>
          </Pyraui.Components.Card.card>

          <Pyraui.Components.Card.card tone={:sky} variant={:soft} hoverable>
            <:header>
              <h4 class="text-lg font-semibold text-slate-900">Soft gradient</h4>
            </:header>
            <p>
              Gentle gradient wash and accent line keep marketing sections fresh without overpowering content.
            </p>
          </Pyraui.Components.Card.card>

          <Pyraui.Components.Card.card tone={:violet} variant={:glass} hoverable>
            <:header>
              <h4 class="text-lg font-semibold text-white">Glass surface</h4>
            </:header>
            <p>
              Frosted transparency with luminous edges—perfect for hero callouts on dark backdrops.
            </p>
          </Pyraui.Components.Card.card>

          <Pyraui.Components.Card.card tone={:rose} variant={:outline} hoverable shadow={:sm}>
            <:header>
              <h4 class="text-lg font-semibold text-slate-900">Outline</h4>
            </:header>
            <p>
              Lightweight border treatment for utility drawers, settings screens, or dense forms.
            </p>
          </Pyraui.Components.Card.card>
        </div>

        <pre class="overflow-x-auto rounded-xl bg-slate-50 p-6 text-sm leading-6 text-slate-800 shadow-inner">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.card tone={:violet} variant={:glass} hoverable shadow={:lg}&gt;...&lt;/.card&gt;
    &lt;.card tone={:rose} variant={:outline} padded={false}&gt;...&lt;/.card&gt;
    </code>
        </pre>
      </section>

      <section class="space-y-6">
        <div class="space-y-3">
          <h3 class="text-xl font-semibold text-slate-900">Layout patterns</h3>
          <p class="text-sm text-slate-600">
            Compose headers, action rows, media, and footers to suit marketing hero cards or product summaries.
          </p>
        </div>

        <div class="grid gap-6 lg:grid-cols-3">
          <Pyraui.Components.Card.card tone={:amber} variant={:soft} hoverable>
            <:header>
              <div>
                <p class="text-xs uppercase tracking-[0.3em] text-amber-600">Case study</p>
                <h4 class="text-xl font-semibold text-slate-900">Nimbus Payback</h4>
              </div>
            </:header>
            <p>
              Nimbus migrated payback workflows to PyraUI and shipped a new partner portal in three days. See how the team composed dashboards with live metrics.
            </p>
            <:footer>
              <a class="inline-flex items-center gap-2 text-amber-600 hover:text-amber-700" href="#">
                Read story <PyrauiWeb.CoreComponents.icon name="hero-arrow-right" class="h-4 w-4" />
              </a>
            </:footer>
          </Pyraui.Components.Card.card>

          <Pyraui.Components.Card.card tone={:emerald} variant={:solid} hoverable>
            <:header>
              <div class="flex items-center justify-between">
                <h4 class="text-xl font-semibold text-slate-900">Conversion snapshot</h4>
                <span class="rounded-full bg-emerald-100 px-3 py-1 text-xs font-semibold text-emerald-700">
                  +18.4%
                </span>
              </div>
            </:header>
            <p>
              Weekly incremental uplift following the onboarding refresh. Most gains came from the global search surface and real-time templates.
            </p>
            <:footer>
              <div class="flex items-center gap-3 text-slate-600">
                <PyrauiWeb.CoreComponents.icon name="hero-calendar-days" class="h-4 w-4" />
                Last updated 2 hours ago
              </div>
            </:footer>
          </Pyraui.Components.Card.card>

          <Pyraui.Components.Card.card tone={:violet} variant={:glass} hoverable padded={false}>
            <:media>
              <img
                src="https://images.unsplash.com/photo-1523475472560-d2df97ec485c?auto=format&fit=crop&w=1200&q=80"
                alt="Gradient campaign"
                class="h-44 w-full object-cover"
              />
            </:media>
            <:header>
              <div class="space-y-2 px-6 pt-6">
                <p class="text-xs uppercase tracking-[0.3em] text-white/60">Campaign</p>
                <h4 class="text-xl font-semibold text-white">Nebula brand system</h4>
              </div>
            </:header>
            <div class="space-y-4 px-6 pb-6 text-white/80">
              <p>
                Nebula’s creative crew remixed PyraUI cards with tone gradients to balance vibrancy and readability across their hero surfaces.
              </p>
            </div>
          </Pyraui.Components.Card.card>
        </div>
      </section>

      <section class="space-y-6">
        <h3 class="text-xl font-semibold text-slate-900">Props</h3>
        <p class="max-w-2xl text-sm text-slate-600">
          Cards accept slots for media, badges, headers, footer actions, and support multiple surface variants with brand tones.
        </p>

        <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-[0_30px_80px_-60px_rgba(15,23,42,0.25)]">
          <table class="min-w-full divide-y divide-slate-100 text-sm text-slate-700">
            <thead class="bg-slate-50 text-xs uppercase tracking-[0.25em] text-slate-500">
              <tr>
                <th class="px-6 py-4 text-left">Prop</th>
                <th class="px-6 py-4 text-left">Type</th>
                <th class="px-6 py-4 text-left">Default</th>
                <th class="px-6 py-4 text-left">Description</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-slate-100">
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">variant</td>
                <td class="px-6 py-4">:solid | :soft | :glass | :outline</td>
                <td class="px-6 py-4 text-sky-500">:solid</td>
                <td class="px-6 py-4">
                  Surface style and chroma treatment.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">tone</td>
                <td class="px-6 py-4">:neutral | :sky | :violet | :emerald | :amber | :rose</td>
                <td class="px-6 py-4 text-sky-500">:neutral</td>
                <td class="px-6 py-4">
                  Accent gradient for the top indicator and badges.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">shadow</td>
                <td class="px-6 py-4">:none | :sm | :md | :lg | :xl</td>
                <td class="px-6 py-4 text-sky-500">:md</td>
                <td class="px-6 py-4">
                  Depth intensity for the card surface.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">padded</td>
                <td class="px-6 py-4">boolean</td>
                <td class="px-6 py-4 text-sky-500">true</td>
                <td class="px-6 py-4">
                  Toggle internal padding when composing custom layouts.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">hoverable</td>
                <td class="px-6 py-4">boolean</td>
                <td class="px-6 py-4 text-sky-500">false</td>
                <td class="px-6 py-4">
                  Adds lift and shadow animation on hover.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">slots</td>
                <td class="px-6 py-4">
                  <code>header</code>, <code>media</code>, <code>badge</code>, <code>footer</code>,
                  <code>actions</code>
                </td>
                <td class="px-6 py-4 text-sky-500">—</td>
                <td class="px-6 py-4">
                  Compose hero content, imagery, CTA actions, and metadata.
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
    """
  end
end
