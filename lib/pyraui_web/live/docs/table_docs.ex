defmodule PyrauiWeb.DocsLive.TableDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    team_rows = [
      %{
        name: "Lena Moore",
        title: "Product Manager",
        location: "Berlin, DE",
        status: "Active",
        email: "lena@pyraui.dev"
      },
      %{
        name: "Marcus Reed",
        title: "Design Lead",
        location: "Austin, US",
        status: "Onboarding",
        email: "marcus@pyraui.dev"
      },
      %{
        name: "Aiko Fujita",
        title: "Senior Engineer",
        location: "Tokyo, JP",
        status: "Active",
        email: "aiko@pyraui.dev"
      },
      %{
        name: "Gabriel Khan",
        title: "Data Scientist",
        location: "Singapore",
        status: "Out of office",
        email: "gabriel@pyraui.dev"
      }
    ]

    metrics_rows = [
      %{service: "Realtime", sla: "99.95%", incidents: 1, trend: "+0.3%"},
      %{service: "Auth", sla: "99.99%", incidents: 0, trend: "+0.1%"},
      %{service: "Billing", sla: "99.70%", incidents: 3, trend: "-0.4%"},
      %{service: "Storage", sla: "99.80%", incidents: 2, trend: "-0.2%"}
    ]

    billing_rows = [
      %{
        customer: %{name: "Zeno Analytics", avatar: "ZA"},
        plan: "Enterprise",
        mrr: "$12,400",
        renewal: "Apr 18",
        health: :good
      },
      %{
        customer: %{name: "Northwind Labs", avatar: "NL"},
        plan: "Growth",
        mrr: "$4,120",
        renewal: "May 3",
        health: :watch
      },
      %{
        customer: %{name: "Arcade", avatar: "AR"},
        plan: "Startup",
        mrr: "$1,640",
        renewal: "Jun 12",
        health: :risk
      }
    ]

    assigns =
      assigns
      |> assign(:team_rows, team_rows)
      |> assign(:metrics_rows, metrics_rows)
      |> assign(:billing_rows, billing_rows)

    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-slate-500">
            Table <span class="h-1 w-1 rounded-full bg-slate-400"></span> Data Grids
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Table</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Responsive data tables with density, striping, and variant options. Use slots to compose rich cells with avatars, badges, and inline actions.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Elevated Directory</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                An elevated table with relaxed spacing—ideal for team directories and account overviews.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: elevated
            </div>
          </div>

          <div class="mt-8">
            <Pyraui.Components.Table.table
              rows={@team_rows}
              variant={:elevated}
              density={:relaxed}
              caption="Team roster"
            >
              <:col :let={row} label="Member">
                <div class="flex flex-col">
                  <span class="font-semibold text-slate-900">{row.name}</span>
                  <span class="text-sm text-slate-500">{row.title}</span>
                </div>
              </:col>
              <:col label="Location" field={:location} />
              <:col :let={row} label="Status">
                <Pyraui.Components.Badge.badge
                  tone={:soft}
                  variant={badge_variant(row.status)}
                  pill={false}
                >
                  {row.status}
                </Pyraui.Components.Badge.badge>
              </:col>
              <:col label="Email" align={:right} field={:email} />
            </Pyraui.Components.Table.table>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Outlined + Striped</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Outlined variant with compact density and zebra striping—great for operational metrics.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: outlined · Striping on
            </div>
          </div>

          <div class="mt-8">
            <Pyraui.Components.Table.table
              rows={@metrics_rows}
              variant={:outlined}
              density={:compact}
              striped={true}
              caption="Service reliability"
            >
              <:col label="Service" field={:service} />
              <:col label="SLA" align={:center} field={:sla} />
              <:col :let={row} label="Incidents" align={:center}>
                <span class="font-semibold text-slate-900">{row.incidents}</span>
              </:col>
              <:col :let={row} label="Trend" align={:right}>
                <span class={trend_class(row.trend)}>{row.trend}</span>
              </:col>
            </Pyraui.Components.Table.table>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Minimal with Rich Cells</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Compose cells with avatars, badges, and CTA buttons while keeping the layout minimal.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: minimal · Density: normal
            </div>
          </div>

          <div class="mt-8">
            <Pyraui.Components.Table.table
              rows={@billing_rows}
              variant={:minimal}
              density={:normal}
              caption="Customer billing"
            >
              <:col :let={row} label="Customer">
                <div class="flex items-center gap-3">
                  <div class="flex h-9 w-9 items-center justify-center rounded-full bg-slate-900/5 text-sm font-semibold text-slate-700">
                    {row.customer.avatar}
                  </div>
                  <div class="flex flex-col">
                    <span class="font-semibold text-slate-900">{row.customer.name}</span>
                    <span class="text-xs text-slate-500">{row.plan} plan</span>
                  </div>
                </div>
              </:col>
              <:col label="MRR" align={:center} field={:mrr} />
              <:col label="Renewal" align={:center} field={:renewal} />
              <:col :let={row} label="Health" align={:right}>
                <Pyraui.Components.Badge.badge tone={:soft} variant={health_variant(row.health)}>
                  {health_label(row.health)}
                </Pyraui.Components.Badge.badge>
              </:col>
            </Pyraui.Components.Table.table>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.table rows={@rows} variant={:outlined} density={:compact} striped&gt;
      &lt;:col label="Service" field={:service} /&gt;
      &lt;:col label="Trend" align={:right} :let={row}&gt;
        &lt;span class={trend_class(row.trend)}&gt;{row.trend}&lt;/span&gt;
      &lt;/:col&gt;
    &lt;/.table&gt;
    </code>
            </pre>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp badge_variant(status) do
    case String.downcase(status) do
      "active" -> :success
      "onboarding" -> :info
      "out of office" -> :warning
      _ -> :neutral
    end
  end

  defp trend_class(trend) do
    if String.starts_with?(trend, "+") do
      "font-semibold text-emerald-600"
    else
      "font-semibold text-rose-600"
    end
  end

  defp health_variant(:good), do: :success
  defp health_variant(:watch), do: :warning
  defp health_variant(:risk), do: :error
  defp health_variant(_), do: :neutral

  defp health_label(:good), do: "Healthy"
  defp health_label(:watch), do: "Monitor"
  defp health_label(:risk), do: "At risk"
  defp health_label(_), do: "Unknown"
end
