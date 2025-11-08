defmodule Pyraui.Components.Kanban do
  @moduledoc """
  Kanban / Task Board component with draggable columns and cards for project management apps.

  ## Examples

      <.kanban id="project-board" columns={@columns} />
      <.kanban id="task-board" columns={@columns} allow_card_add={true} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the kanban board"
  attr :columns, :list, required: true, doc: "List of columns, each with :id, :title, and :cards"
  attr :allow_card_add, :boolean, default: false, doc: "Allow adding new cards to columns"
  attr :allow_column_add, :boolean, default: false, doc: "Allow adding new columns"
  attr :card_add_label, :string, default: "Add card", doc: "Label for add card button"
  attr :column_add_label, :string, default: "Add column", doc: "Label for add column button"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :card, doc: "Custom card template"
  slot :column_header, doc: "Custom column header template"

  def kanban(assigns) do
    ~H"""
    <div
      id={@id}
      class={["kanban-board flex gap-4 overflow-x-auto pb-4", @class]}
      phx-hook="KanbanHook"
      data-id={@id}
      data-allow-card-add={@allow_card_add}
      data-allow-column-add={@allow_column_add}
      {@rest}
    >
      <%= for column <- @columns do %>
        {render_column(assigns, column)}
      <% end %>

      <%= if @allow_column_add do %>
        <div class="kanban-column flex-shrink-0 w-72">
          <button
            type="button"
            class="w-full p-4 border-2 border-dashed border-gray-300 dark:border-gray-600 rounded-lg text-gray-500 dark:text-gray-400 hover:border-blue-500 dark:hover:border-blue-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors"
            phx-click="add-kanban-column"
            phx-value-board-id={@id}
          >
            <.icon name="hero-plus" class="w-5 h-5 mx-auto mb-1" />
            <span class="text-sm font-medium">{@column_add_label}</span>
          </button>
        </div>
      <% end %>
    </div>
    """
  end

  defp render_column(assigns, column) do
    column_id = Map.get(column, :id, "column-#{assigns.id}-#{:rand.uniform(10000)}")
    cards = Map.get(column, :cards, [])

    assigns =
      assigns
      |> assign(:column, column)
      |> assign(:column_id, column_id)
      |> assign(:cards, cards)

    ~H"""
    <div
      id={@column_id}
      class="kanban-column flex-shrink-0 w-72 bg-gray-50 dark:bg-gray-800 rounded-lg p-4"
      data-column-id={@column_id}
    >
      <!-- Column Header -->
      <div class="flex items-center justify-between mb-4">
        <%= if @column_header != [] do %>
          {render_slot(@column_header, @column)}
        <% else %>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100">
            {Map.get(@column, :title, "Untitled")}
          </h3>
          <span class="text-sm text-gray-500 dark:text-gray-400">{length(@cards)}</span>
        <% end %>
      </div>
      <!-- Cards Container -->
      <div
        id={"#{@column_id}-cards"}
        class="kanban-cards space-y-3 min-h-[100px]"
        data-column-id={@column_id}
      >
        <%= for card <- @cards do %>
          {render_card(assigns, card, @column_id)}
        <% end %>
      </div>
      <!-- Add Card Button -->
      <%= if assigns.allow_card_add do %>
        <button
          type="button"
          class="w-full mt-3 p-2 text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
          phx-click="add-kanban-card"
          phx-value-column-id={@column_id}
          phx-value-board-id={@id}
        >
          <.icon name="hero-plus" class="w-4 h-4 inline mr-1" /> {@card_add_label}
        </button>
      <% end %>
    </div>
    """
  end

  defp render_card(assigns, card, column_id) do
    card_id = Map.get(card, :id, "card-#{assigns.id}-#{:rand.uniform(10000)}")

    assigns =
      assigns
      |> assign(:card_data, card)
      |> assign(:card_id, card_id)
      |> assign(:column_id, column_id)
      |> assign(:card_tags, Map.get(card, :tags, []))

    ~H"""
    <div
      id={@card_id}
      class="kanban-card bg-white dark:bg-gray-700 p-4 rounded-lg shadow-sm border border-gray-200 dark:border-gray-600 cursor-move hover:shadow-md transition-shadow"
      draggable="true"
      data-card-id={@card_id}
      data-column-id={@column_id}
      phx-click="kanban-card-click"
      phx-value-card-id={@card_id}
      phx-value-column-id={@column_id}
    >
      <%= if @card != [] do %>
        {render_slot(@card, @card_data)}
      <% else %>
        <%= if Map.get(@card_data, :title) do %>
          <h4 class="font-semibold text-gray-900 dark:text-gray-100 mb-2">
            {Map.get(@card_data, :title)}
          </h4>
        <% end %>

        <%= if Map.get(@card_data, :description) do %>
          <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">
            {Map.get(@card_data, :description)}
          </p>
        <% end %>

        <%= if Map.get(@card_data, :tags) do %>
          <div class="flex flex-wrap gap-1 mt-2">
            <%= for tag <- @card_tags do %>
              <span
                class={[
                  "px-2 py-1 text-xs font-medium rounded-full",
                  tag_color_classes(tag)
                ]}
              >
                {tag_label(tag)}
              </span>
            <% end %>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp tag_label(tag) when is_map(tag), do: Map.get(tag, :label) || Map.get(tag, "label") || ""
  defp tag_label(tag), do: to_string(tag || "")

  defp tag_color_classes(tag) when is_map(tag) do
    case Map.get(tag, :color) || Map.get(tag, "color") do
      "emerald" -> "bg-emerald-100 dark:bg-emerald-900 text-emerald-700 dark:text-emerald-200"
      "indigo" -> "bg-indigo-100 dark:bg-indigo-900 text-indigo-700 dark:text-indigo-200"
      "purple" -> "bg-purple-100 dark:bg-purple-900 text-purple-700 dark:text-purple-200"
      "amber" -> "bg-amber-100 dark:bg-amber-900 text-amber-700 dark:text-amber-200"
      "pink" -> "bg-pink-100 dark:bg-pink-900 text-pink-700 dark:text-pink-200"
      "blue" -> "bg-blue-100 dark:bg-blue-900 text-blue-700 dark:text-blue-200"
      "neutral" -> "bg-gray-200 dark:bg-gray-700 text-gray-800 dark:text-gray-100"
      _ -> "bg-slate-200 dark:bg-slate-800 text-slate-800 dark:text-slate-100"
    end
  end

  defp tag_color_classes(_tag), do: "bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200"
end
