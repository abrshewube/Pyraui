defmodule Pyraui.Components.Table do
  @moduledoc """
  Data table component with styling variants, density, and striping support.

  ## Examples

      <.table rows={@users}>
        <:col label="Name" field={:name} />
        <:col label="Email" field={:email} />
        <:col label="Actions">
          <.button size="sm">Edit</.button>
        </:col>
      </.table>
  """

  use Phoenix.Component

  attr :rows, :list, default: []
  attr :variant, :atom, default: :elevated, values: [:elevated, :outlined, :minimal]
  attr :density, :atom, default: :normal, values: [:relaxed, :normal, :compact]
  attr :striped, :boolean, default: false
  attr :rounded, :boolean, default: true
  attr :caption, :string, default: nil
  attr :empty_label, :string, default: "No data available"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :col,
    required: true,
    doc: "Defines a column for the table",
    do: [
      attr(:label, :string),
      attr(:field, :any),
      attr(:align, :atom, values: [:left, :center, :right])
    ]

  def table(assigns) do
    variant_styles = %{
      elevated: %{
        outer:
          "overflow-hidden bg-white border border-slate-200 shadow-[0_30px_80px_-70px_rgba(15,23,42,0.65)]",
        table: "min-w-full divide-y divide-slate-200",
        tbody: "bg-white divide-y divide-slate-200"
      },
      outlined: %{
        outer: "overflow-hidden bg-white border border-slate-200",
        table: "min-w-full",
        tbody: "bg-white"
      },
      minimal: %{
        outer: "overflow-hidden bg-white",
        table: "min-w-full",
        tbody: "bg-white"
      }
    }

    density_map = %{
      relaxed: %{cell: "px-6 py-4", header: "px-6 py-4"},
      normal: %{cell: "px-5 py-3", header: "px-5 py-3"},
      compact: %{cell: "px-4 py-2", header: "px-4 py-2"}
    }

    align_map = %{left: "text-left", center: "text-center", right: "text-right"}

    styles = variant_styles[assigns.variant]
    density = density_map[assigns.density]
    rounded_class = if(assigns.rounded, do: "rounded-2xl", else: "rounded-none")

    assigns =
      assigns
      |> assign(:styles, styles)
      |> assign(:density, density)
      |> assign(:rounded_class, rounded_class)
      |> assign(:align_map, align_map)
      |> assign(:rows_with_index, Enum.with_index(assigns.rows))

    ~H"""
    <div class={["table-container", @styles.outer, @rounded_class, @class]} {@rest}>
      <table class={@styles.table}>
        <%= if @caption do %>
          <caption class="px-6 py-4 text-left text-sm font-medium text-slate-500">{@caption}</caption>
        <% end %>

        <thead class="bg-slate-50">
          <tr>
            <%= for col <- @col do %>
              <th
                scope="col"
                class={[
                  "uppercase text-xs font-semibold tracking-wide text-slate-500",
                  @density.header,
                  Map.get(@align_map, Map.get(col, :align, :left))
                ]}
              >
                {col.label}
              </th>
            <% end %>
          </tr>
        </thead>

        <tbody class={[@styles.tbody, if(@striped, do: "divide-y-0")]}>
          <%= if Enum.empty?(@rows) do %>
            <tr>
              <td
                colspan={length(@col)}
                class={["px-6 py-6 text-center text-sm text-slate-500", if(@striped, do: "bg-white")]}
              >
                {@empty_label}
              </td>
            </tr>
          <% else %>
            <%= for {row, index} <- @rows_with_index do %>
              <tr class={[
                "transition-colors last:border-b-0",
                if(@striped,
                  do: if(rem(index, 2) == 1, do: "bg-slate-50", else: "bg-white"),
                  else: ""
                ),
                if(@variant == :minimal, do: "hover:bg-slate-50", else: "hover:bg-slate-100"),
                "border-b border-slate-100"
              ]}>
                <%= for col <- @col do %>
                  <td class={[
                    "text-sm text-slate-700",
                    @density.cell,
                    Map.get(@align_map, Map.get(col, :align, :left))
                  ]}>
                    <% field = Map.get(col, :field) %>
                    <%= if field do %>
                      {Map.get(row, field)}
                    <% else %>
                      {render_slot(col, row)}
                    <% end %>
                  </td>
                <% end %>
              </tr>
            <% end %>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
