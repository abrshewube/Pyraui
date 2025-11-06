defmodule Ashui.Components.MasonryGrid do
  @moduledoc """
  Masonry Grid / Pinterest Layout component for dynamic card layouts.

  ## Examples

      <.masonry_grid items={@items} columns={3} />
      <.masonry_grid items={@posts} columns={4} gap={4} />
  """

  use Phoenix.Component

  attr :items, :list, required: true, doc: "List of items to display"
  attr :columns, :integer, default: 3, doc: "Number of columns"
  attr :gap, :integer, default: 4, doc: "Gap between items (Tailwind spacing unit)"
  attr :item_height, :string, default: nil, doc: "Fixed item height (optional)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :item, required: true, doc: "Item template"

  def masonry_grid(assigns) do
    columns_class =
      case assigns.columns do
        1 -> "grid-cols-1"
        2 -> "grid-cols-1 md:grid-cols-2"
        3 -> "grid-cols-1 md:grid-cols-2 lg:grid-cols-3"
        4 -> "grid-cols-1 md:grid-cols-2 lg:grid-cols-4"
        5 -> "grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5"
        6 -> "grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6"
        _ -> "grid-cols-1 md:grid-cols-2 lg:grid-cols-3"
      end

    gap_class = "gap-#{assigns.gap}"

    assigns =
      assigns
      |> assign(:columns_class, columns_class)
      |> assign(:gap_class, gap_class)

    ~H"""
    <div
      class={[
        "masonry-grid grid",
        @columns_class,
        @gap_class,
        @class
      ]}
      phx-hook="MasonryGridHook"
      data-columns={@columns}
      {@rest}
    >
      <%= for item <- @items do %>
        <div
          class="masonry-item break-inside-avoid"
          style={if(@item_height, do: "height: #{@item_height};", else: "")}
        >
          {render_slot(@item, item)}
        </div>
      <% end %>
    </div>
    """
  end
end
