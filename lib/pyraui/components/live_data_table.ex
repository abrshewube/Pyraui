defmodule Pyraui.Components.LiveDataTable do
  @moduledoc """
  Live Data Table component with virtual scrolling for handling huge datasets efficiently.
  Supports PubSub updates, sorting, filtering, and pagination.

  ## Examples

      <.live_data_table
        id="users-table"
        rows={@users}
        columns={@columns}
        row_height={50}
      />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the data table"
  attr :rows, :list, required: true, doc: "List of row data (maps)"

  attr :columns, :list,
    required: true,
    doc: "List of column definitions with :key, :label, :sortable, :render"

  attr :row_height, :integer, default: 50, doc: "Height of each row in pixels"
  attr :visible_rows, :integer, default: 10, doc: "Number of visible rows"
  attr :sort_by, :string, default: nil, doc: "Current sort column key"
  attr :sort_direction, :atom, default: :asc, values: [:asc, :desc], doc: "Sort direction"
  attr :filter_value, :string, default: "", doc: "Current filter value"
  attr :filter_placeholder, :string, default: "Filter...", doc: "Filter input placeholder"
  attr :enable_search, :boolean, default: true, doc: "Enable search/filter input"
  attr :enable_sorting, :boolean, default: true, doc: "Enable column sorting"
  attr :enable_selection, :boolean, default: false, doc: "Enable row selection"
  attr :selected_rows, :list, default: [], doc: "List of selected row IDs"
  attr :empty_message, :string, default: "No data available", doc: "Message to show when no rows"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :header, doc: "Custom header row template"
  slot :row, doc: "Custom row template"
  slot :empty, doc: "Custom empty state template"

  def live_data_table(assigns) do
    assigns =
      assigns
      |> assign(:total_rows, length(assigns.rows))
      |> assign(:container_height, assigns.visible_rows * assigns.row_height)

    ~H"""
    <div
      id={@id}
      class={["live-data-table w-full", @class]}
      phx-hook="LiveDataTableHook"
      data-id={@id}
      data-row-height={@row_height}
      data-visible-rows={@visible_rows}
      data-total-rows={@total_rows}
      {@rest}
    >
      <!-- Search/Filter -->
      <%= if @enable_search do %>
        <div class="mb-4">
          <input
            type="text"
            id={"#{@id}-filter"}
            class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            placeholder={@filter_placeholder}
            value={@filter_value}
            phx-debounce="300"
            phx-input="filter-table"
            phx-target={@id}
          />
        </div>
      <% end %>
      <!-- Table Container -->
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden bg-white dark:bg-gray-900">
        <!-- Table Header -->
        <div
          class="table-header bg-gray-50 dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700"
          id={"#{@id}-header"}
        >
          <div class="table-row-header flex" role="row">
            <%= if @enable_selection do %>
              <div class="table-cell-header w-12 p-3 flex items-center justify-center border-r border-gray-200 dark:border-gray-700">
                <input
                  type="checkbox"
                  class="rounded border-gray-300 dark:border-gray-600 text-blue-600 focus:ring-blue-500"
                  phx-click="select-all-rows"
                  phx-target={@id}
                />
              </div>
            <% end %>

            <%= if @header != [] do %>
              {render_slot(@header)}
            <% else %>
              <%= for column <- @columns do %>
                {render_column_header(assigns, column)}
              <% end %>
            <% end %>
          </div>
        </div>
        <!-- Virtual Scrolling Container -->
        <div
          id={"#{@id}-scroll-container"}
          class="table-body-container overflow-auto"
          style={"height: #{@container_height}px"}
          phx-hook="VirtualScrollHook"
          data-container-id={@id}
          data-row-height={@row_height}
          data-total-rows={@total_rows}
        >
          <!-- Spacer for rows above viewport -->
          <div id={"#{@id}-spacer-top"} class="table-spacer-top" style="height: 0px"></div>
          <!-- Visible Rows -->
          <div id={"#{@id}-rows"} class="table-rows">
            <%= if @rows == [] do %>
              {render_empty_state(assigns)}
            <% else %>
              <%= for {row, index} <- Enum.with_index(@rows) do %>
                {render_row(assigns, row, index)}
              <% end %>
            <% end %>
          </div>
          <!-- Spacer for rows below viewport -->
          <div id={"#{@id}-spacer-bottom"} class="table-spacer-bottom" style="height: 0px"></div>
        </div>
        <!-- Footer with pagination info -->
        <div class="table-footer bg-gray-50 dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 px-4 py-2">
          <div class="flex items-center justify-between text-sm text-gray-600 dark:text-gray-400">
            <span>
              Showing <span id={"#{@id}-visible-start"}>1</span>
              - <span id={"#{@id}-visible-end"}>{min(@visible_rows, @total_rows)}</span>
              of <span id={"#{@id}-total"}>{@total_rows}</span>
            </span>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp render_column_header(assigns, column) do
    column_key = Map.get(column, :key, "")
    column_label = Map.get(column, :label, "")
    sortable = Map.get(column, :sortable, false) && assigns.enable_sorting
    width = Map.get(column, :width, "auto")
    align = Map.get(column, :align, "left")

    is_sorted = assigns.sort_by == column_key

    sort_icon =
      if is_sorted do
        if assigns.sort_direction == :asc, do: "hero-chevron-up", else: "hero-chevron-down"
      else
        "hero-chevron-up-down"
      end

    assigns =
      assigns
      |> assign(:column_key, column_key)
      |> assign(:column_label, column_label)
      |> assign(:sortable, sortable)
      |> assign(:width, width)
      |> assign(:align, align)
      |> assign(:is_sorted, is_sorted)
      |> assign(:sort_icon, sort_icon)

    ~H"""
    <div
      class={[
        "table-cell-header px-4 py-3 text-left text-xs font-semibold text-gray-700 dark:text-gray-300 uppercase tracking-wider",
        if(@align == "center",
          do: "text-center",
          else: if(@align == "right", do: "text-right", else: "text-left")
        ),
        if(@sortable,
          do: "cursor-pointer hover:bg-gray-100 dark:hover:bg-gray-700 select-none",
          else: ""
        )
      ]}
      style={if(@width != "auto", do: "width: #{@width}", else: "")}
      phx-click={if(@sortable, do: "sort-column", else: nil)}
      phx-value-column={@column_key}
      phx-target={assigns.id}
      role="columnheader"
    >
      <div class="flex items-center gap-2">
        <span>{@column_label}</span>
        <%= if @sortable do %>
          <% icon_class =
            [
              "w-4 h-4",
              if(@is_sorted,
                do: "text-blue-600 dark:text-blue-400",
                else: "text-gray-400 dark:text-gray-500"
              )
            ]
            |> Enum.reject(&(&1 in [nil, ""]))
            |> Enum.join(" ") %>
          <.icon
            name={@sort_icon}
            class={icon_class}
          />
        <% end %>
      </div>
    </div>
    """
  end

  defp render_row(assigns, row, index) do
    row_id = get_row_id(row, index)
    is_selected = assigns.enable_selection && row_id in assigns.selected_rows

    has_row_slot = Map.has_key?(assigns, :row) and assigns.row != []

    assigns =
      assigns
      |> assign(:row_data, row)
      |> assign(:row_id, row_id)
      |> assign(:row_index, index)
      |> assign(:is_selected, is_selected)
      |> assign(:has_row_slot, has_row_slot)

    ~H"""
    <div
      class={[
        "table-row flex border-b border-gray-100 dark:border-gray-800 hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors",
        if(@is_selected, do: "bg-blue-50 dark:bg-blue-900/20", else: "")
      ]}
      style={"height: #{assigns.row_height}px"}
      data-row-id={@row_id}
      data-row-index={@row_index}
      role="row"
    >
      <%= if @enable_selection do %>
        <div class="table-cell w-12 p-3 flex items-center justify-center border-r border-gray-200 dark:border-gray-700">
          <input
            type="checkbox"
            class="rounded border-gray-300 dark:border-gray-600 text-blue-600 focus:ring-blue-500"
            checked={@is_selected}
            phx-click="toggle-row-selection"
            phx-value-row-id={@row_id}
            phx-target={assigns.id}
          />
        </div>
      <% end %>

      <%= if @has_row_slot do %>
        {render_slot(@row, @row_data)}
      <% else %>
        <%= for column <- assigns.columns do %>
          {render_cell(assigns, column)}
        <% end %>
      <% end %>
    </div>
    """
  end

  defp render_cell(assigns, column) do
    column_key = Map.get(column, :key, "")
    render_func = Map.get(column, :render, nil)
    width = Map.get(column, :width, "auto")
    align = Map.get(column, :align, "left")

    cell_value =
      if render_func do
        render_func.(assigns.row_data)
      else
        get_nested_value(assigns.row_data, column_key)
      end

    assigns =
      assigns
      |> assign(:cell_value, cell_value)
      |> assign(:width, width)
      |> assign(:align, align)

    ~H"""
    <div
      class={[
        "table-cell px-4 py-2 text-sm text-gray-900 dark:text-gray-100",
        if(@align == "center",
          do: "text-center",
          else: if(@align == "right", do: "text-right", else: "text-left")
        )
      ]}
      style={if(@width != "auto", do: "width: #{@width}", else: "")}
      role="cell"
    >
      {@cell_value}
    </div>
    """
  end

  defp render_empty_state(assigns) do
    has_empty_slot = Map.has_key?(assigns, :empty) and assigns.empty != []

    assigns = assign(assigns, :has_empty_slot, has_empty_slot)

    ~H"""
    <div
      class="table-empty flex items-center justify-center"
      style={"height: #{assigns.container_height}px"}
    >
      <%= if @has_empty_slot do %>
        {render_slot(@empty)}
      <% else %>
        <div class="text-center text-gray-500 dark:text-gray-400">
          <p class="text-lg font-medium">{@empty_message}</p>
        </div>
      <% end %>
    </div>
    """
  end

  defp get_row_id(row, index) do
    cond do
      is_map(row) && Map.has_key?(row, :id) -> to_string(row.id)
      is_map(row) && Map.has_key?(row, "id") -> to_string(row["id"])
      true -> "row-#{index}"
    end
  end

  defp get_nested_value(data, key) when is_binary(key) do
    keys = String.split(key, ".")
    get_nested_value_recursive(data, keys)
  end

  defp get_nested_value(data, key), do: Map.get(data, key, "")

  defp get_nested_value_recursive(data, [key | rest]) when is_map(data) do
    value = Map.get(data, key) || Map.get(data, String.to_atom(key))
    if rest == [], do: value, else: get_nested_value_recursive(value, rest)
  end

  defp get_nested_value_recursive(_, _), do: ""
end
