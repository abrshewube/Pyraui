defmodule Ashui.Components.FilterPanel do
  @moduledoc """
  Filter panel component for faceted search and real-time filtering of data tables.

  ## Examples

      <.filter_panel id="product-filters">
        <:filter label="Category" field="category">
          <:option value="electronics">Electronics</:option>
          <:option value="clothing">Clothing</:option>
        </:filter>
        <:filter label="Price Range" field="price">
          <:option value="0-50">$0 - $50</:option>
          <:option value="50-100">$50 - $100</:option>
        </:filter>
      </.filter_panel>
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the filter panel"
  attr :title, :string, default: "Filters", doc: "Panel title"
  attr :collapsible, :boolean, default: true, doc: "Allow collapsing the panel"
  attr :collapsed, :boolean, default: false, doc: "Initial collapsed state"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :filter, required: true do
    attr :label, :string, required: true
    attr :field, :string, required: true
    attr :type, :atom, values: [:checkbox, :radio, :range]
    attr :multiple, :boolean
  end

  slot :option, required: true do
    attr :value, :string, required: true
    attr :label, :string
    attr :count, :integer
    attr :field, :string, required: true
  end

  def filter_panel(assigns) do
    # Group options by field
    options_by_field = Enum.group_by(assigns.option, fn opt -> Map.get(opt, :field) end)

    assigns = assign(assigns, :options_by_field, options_by_field)

    ~H"""
    <div
      id={@id}
      class={["filter-panel bg-white border border-gray-200 rounded-lg shadow-sm", @class]}
      phx-hook="FilterPanelHook"
      data-collapsed={@collapsed}
      {@rest}
    >
      <div class="filter-panel-header flex items-center justify-between p-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-900">{@title}</h3>

        <%= if @collapsible do %>
          <button
            type="button"
            class="p-1 hover:bg-gray-100 rounded transition-colors"
            phx-click="toggle-filter-panel"
            phx-value-id={@id}
            aria-label="Toggle filters"
          >
            <.icon
              name="hero-chevron-down"
              class="w-5 h-5 text-gray-600 filter-panel-icon transition-transform"
            />
          </button>
        <% end %>
      </div>

      <div class="filter-panel-content p-4 space-y-6">
        <%= for filter <- @filter do %>
          <% options = Map.get(@options_by_field, filter.field, []) %>
          <div class="filter-group">
            <label class="block text-sm font-medium text-gray-700 mb-2">{filter.label}</label>
            <div class="space-y-2">
              <%= cond do %>
                <% Map.get(filter, :type, :checkbox) == :checkbox -> %>
                  <%= for option <- options do %>
                    <label class="flex items-center space-x-2 cursor-pointer">
                      <input
                        type="checkbox"
                        name={"filter[#{filter.field}][]"}
                        value={option.value}
                        class="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                        phx-change="filter-changed"
                        phx-value-field={filter.field}
                      />
                      <span class="text-sm text-gray-700">
                        {Map.get(option, :label, option.value)}
                        <%= if Map.get(option, :count) do %>
                          <span class="text-gray-500 ml-1">({Map.get(option, :count)})</span>
                        <% end %>
                      </span>
                    </label>
                  <% end %>
                <% Map.get(filter, :type, :checkbox) == :radio -> %>
                  <%= for option <- options do %>
                    <label class="flex items-center space-x-2 cursor-pointer">
                      <input
                        type="radio"
                        name={"filter[#{filter.field}]"}
                        value={option.value}
                        class="border-gray-300 text-blue-600 focus:ring-blue-500"
                        phx-change="filter-changed"
                        phx-value-field={filter.field}
                      />
                      <span class="text-sm text-gray-700">
                        {Map.get(option, :label, option.value)}
                        <%= if Map.get(option, :count) do %>
                          <span class="text-gray-500 ml-1">({Map.get(option, :count)})</span>
                        <% end %>
                      </span>
                    </label>
                  <% end %>
                <% Map.get(filter, :type, :checkbox) == :range -> %>
                  <% first_option = List.first(options) || %{value: "0", label: "0"} %> <% last_option =
                    List.last(options) || %{value: "100", label: "100"} %>
                  <div class="space-y-2">
                    <input
                      type="range"
                      name={"filter[#{filter.field}]"}
                      min={Map.get(first_option, :value, "0")}
                      max={Map.get(last_option, :value, "100")}
                      class="w-full"
                      phx-change="filter-changed"
                      phx-value-field={filter.field}
                    />
                    <div class="flex justify-between text-xs text-gray-500">
                      <span>{Map.get(first_option, :label, Map.get(first_option, :value, "0"))}</span>
                      <span>{Map.get(last_option, :label, Map.get(last_option, :value, "100"))}</span>
                    </div>
                  </div>
                <% true -> %>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>

      <div class="filter-panel-footer p-4 border-t border-gray-200 flex justify-end space-x-2">
        <button
          type="button"
          class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors"
          phx-click="clear-filters"
          phx-value-id={@id}
        >
          Clear All
        </button>
      </div>
    </div>
    """
  end
end
