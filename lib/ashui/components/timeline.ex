defmodule Ashui.Components.Timeline do
  @moduledoc """
  Timeline component for displaying chronological events or activities with support for nested/collapsible events.

  ## Examples

      <.timeline id="events-timeline" items={@events} />
      <.timeline id="nested-timeline" items={@events} collapsible={true} />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the timeline"
  attr :items, :list, required: true, doc: "List of timeline items (can have nested :children)"

  attr :variant, :atom,
    default: :vertical,
    values: [:vertical, :horizontal],
    doc: "Timeline orientation"

  attr :collapsible, :boolean, default: false, doc: "Enable collapsible nested events"
  attr :default_expanded, :boolean, default: true, doc: "Default expanded state for nested events"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :item, doc: "Custom item template"

  def timeline(assigns) do
    assigns =
      assigns
      |> assign(:has_nested, has_nested_items?(assigns.items))

    ~H"""
    <div
      id={@id}
      class={[
        "timeline-container",
        if(@variant == :horizontal, do: "flex overflow-x-auto pb-4", else: "space-y-6"),
        @class
      ]}
      phx-hook={if(@collapsible and @has_nested, do: "TimelineHook", else: nil)}
      data-collapsible={@collapsible}
      data-default-expanded={@default_expanded}
      {@rest}
    >
      <%= if @variant == :vertical do %>
        {render_items(assigns, @items, 0)}
      <% else %>
        <!-- Horizontal Timeline -->
        <div class="flex space-x-4">
          <%= for {item, index} <- Enum.with_index(@items) do %>
            {render_horizontal_item(assigns, item, index, length(@items))}
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  defp render_items(assigns, items, level) when is_list(items) do
    assigns =
      assigns
      |> assign(:items, items)
      |> assign(:level, level)

    ~H"""
    <%= for {item, index} <- Enum.with_index(@items) do %>
      {render_item(assigns, item, index, length(@items), @level)}
    <% end %>
    """
  end

  defp render_item(assigns, item, index, total, level) do
    has_children = Map.has_key?(item, :children) and item.children != [] and item.children != nil
    item_id = "timeline-item-#{assigns.id}-#{index}-#{level}"
    children_id = "timeline-children-#{assigns.id}-#{index}-#{level}"
    has_item_slot = Map.has_key?(assigns, :item) and assigns.item != []

    assigns =
      assigns
      |> assign(:item_data, item)
      |> assign(:item_id, item_id)
      |> assign(:children_id, children_id)
      |> assign(:has_children, has_children)
      |> assign(:index, index)
      |> assign(:total, total)
      |> assign(:level, level)
      |> assign(:has_item_slot, has_item_slot)

    ~H"""
    <div class={["timeline-item", "timeline-level-#{@level}", if(@level > 0, do: "ml-8 mt-4")]}>
      <div class="flex items-start">
        <!-- Timeline Line -->
        <div class="flex flex-col items-center mr-4">
          <div class={[
            "w-3 h-3 rounded-full border-2",
            if(@level == 0,
              do: "bg-blue-600 dark:bg-blue-400 border-white dark:border-gray-800",
              else: "bg-gray-400 dark:bg-gray-500 border-white dark:border-gray-800"
            )
          ]}>
          </div>

          <%= if @index < @total - 1 or @has_children do %>
            <div class={[
              "w-0.5 mt-2",
              if(@has_children and assigns.collapsible,
                do: "timeline-connector",
                else: "h-full bg-gray-300 dark:bg-gray-600"
              )
            ]}>
            </div>
          <% end %>
        </div>
        <!-- Timeline Content -->
        <div class="flex-1 pb-6">
          <div
            class={[
              "timeline-content",
              if(@has_children and assigns.collapsible, do: "cursor-pointer", else: "")
            ]}
            id={@item_id}
            phx-click={
              if(@has_children and assigns.collapsible, do: "toggle-timeline-item", else: nil)
            }
            phx-value-id={@item_id}
            phx-value-children-id={@children_id}
          >
            <%= if @has_item_slot do %>
              {render_slot(@item, @item_data)}
            <% else %>
              {render_default_content(assigns)}
            <% end %>
          </div>
          <!-- Nested Children -->
          <%= if @has_children do %>
            <div
              id={@children_id}
              class={[
                "timeline-children ml-4 mt-2",
                if(assigns.collapsible and not assigns.default_expanded, do: "hidden", else: "")
              ]}
            >
              {render_items(assigns, @item_data.children, @level + 1)}
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp render_default_content(assigns) do
    ~H"""
    <%= if Map.get(@item_data, :title) do %>
      <div class="flex items-center gap-2 mb-1">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100">
          {Map.get(@item_data, :title)}
        </h3>

        <%= if @has_children and assigns.collapsible do %>
          <.icon
            name="hero-chevron-down"
            class="w-4 h-4 text-gray-500 dark:text-gray-400 timeline-toggle-icon transition-transform"
          />
        <% end %>
      </div>
    <% end %>

    <%= if Map.get(@item_data, :date) do %>
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">
        {format_date(Map.get(@item_data, :date))}
      </p>
    <% end %>

    <%= if Map.get(@item_data, :description) do %>
      <p class="text-gray-700 dark:text-gray-300">{Map.get(@item_data, :description)}</p>
    <% end %>
    """
  end

  defp render_horizontal_item(assigns, item, index, total) do
    has_item_slot = Map.has_key?(assigns, :item) and assigns.item != []

    assigns =
      assigns
      |> assign(:item_data, item)
      |> assign(:index, index)
      |> assign(:total, total)
      |> assign(:has_item_slot, has_item_slot)

    ~H"""
    <div class="timeline-item-horizontal flex-shrink-0 w-64">
      <div class="flex flex-col items-center mb-4">
        <div class="w-3 h-3 rounded-full bg-blue-600 dark:bg-blue-400 border-2 border-white dark:border-gray-800 mb-2">
        </div>

        <%= if @index < @total - 1 do %>
          <div class="w-full h-0.5 bg-gray-300 dark:bg-gray-600"></div>
        <% end %>
      </div>

      <div class="timeline-content">
        <%= if @has_item_slot do %>
          {render_slot(@item, @item_data)}
        <% else %>
          <%= if Map.get(@item_data, :title) do %>
            <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100 mb-1">
              {Map.get(@item_data, :title)}
            </h3>
          <% end %>

          <%= if Map.get(@item_data, :date) do %>
            <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">
              {format_date(Map.get(@item_data, :date))}
            </p>
          <% end %>

          <%= if Map.get(@item_data, :description) do %>
            <p class="text-sm text-gray-700 dark:text-gray-300">
              {Map.get(@item_data, :description)}
            </p>
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end

  defp has_nested_items?(items) when is_list(items) do
    Enum.any?(items, fn item ->
      Map.has_key?(item, :children) and item.children != [] and item.children != nil
    end)
  end

  defp has_nested_items?(_), do: false

  defp format_date(nil), do: ""
  defp format_date(%DateTime{} = dt), do: Calendar.strftime(dt, "%B %d, %Y")
  defp format_date(%NaiveDateTime{} = dt), do: Calendar.strftime(dt, "%B %d, %Y")
  defp format_date(date_string) when is_binary(date_string), do: date_string
  defp format_date(_), do: ""
end
