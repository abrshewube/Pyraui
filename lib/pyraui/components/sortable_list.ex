defmodule Pyraui.Components.SortableList do
  @moduledoc """
  Sortable list component for drag & drop reordering of items.

  ## Examples

      <.sortable_list id="todo-list" items={@todos}>
        <:item :let={todo}>
          <div class="p-4 border rounded">
            <%= todo.title %>
          </div>
        </:item>
      </.sortable_list>
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the sortable list"
  attr :items, :list, required: true, doc: "List of items to display"
  attr :item_id, :atom, default: :id, doc: "Key to use as unique identifier for items"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :item, required: true, doc: "Template for each item"

  def sortable_list(assigns) do
    ~H"""
    <div
      id={@id}
      class={["sortable-list-container", @class]}
      phx-hook="SortableListHook"
      data-item-id={@item_id}
      {@rest}
    >
      <ul id={"#{@id}-list"} class="space-y-2">
        <%= for {item, index} <- Enum.with_index(@items) do %>
          <li
            data-item-id={get_item_id(item, @item_id)}
            data-index={index}
            class="sortable-item cursor-move p-2 border border-gray-300 rounded-lg bg-white hover:bg-gray-50 transition-colors"
            draggable="true"
          >
            {render_slot(@item, item)}
          </li>
        <% end %>
      </ul>

      <input
        type="hidden"
        id={"#{@id}-order"}
        name={"#{@id}_order"}
        value={get_order_string(@items, @item_id)}
      />
    </div>
    """
  end

  defp get_item_id(item, key) when is_atom(key) do
    Map.get(item, key) || Map.get(item, to_string(key))
  end

  defp get_item_id(item, _key) when is_map(item) do
    Map.get(item, "id") || Map.get(item, :id) || to_string(item)
  end

  defp get_item_id(item, _key), do: to_string(item)

  defp get_order_string(items, item_id) do
    items
    |> Enum.map(&get_item_id(&1, item_id))
    |> Enum.join(",")
  end
end
