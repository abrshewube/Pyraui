defmodule Ashui.Components.Table do
  @moduledoc """
  Data table component with sorting and pagination support.

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
  attr :class, :string, default: ""
  attr :rest, :global

  slot :col, required: true

  def table(assigns) do
    ~H"""
    <div class={["overflow-x-auto", @class]} {@rest}>
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <%= for col <- @col do %>
              <th
                scope="col"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
              >
                {col.label}
              </th>
            <% end %>
          </tr>
        </thead>

        <tbody class="bg-white divide-y divide-gray-200">
          <%= if Enum.empty?(@rows) do %>
            <tr>
              <td colspan={length(@col)} class="px-6 py-4 text-center text-gray-500">
                No data available
              </td>
            </tr>
          <% else %>
            <%= for row <- @rows do %>
              <tr class="hover:bg-gray-50">
                <%= for col <- @col do %>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                    <%= if col.field do %>
                      {Map.get(row, col.field)}
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
