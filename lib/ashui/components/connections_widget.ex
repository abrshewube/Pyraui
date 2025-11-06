defmodule Ashui.Components.ConnectionsWidget do
  @moduledoc """
  Connections widget component for displaying followers, following, or connections in a social-like interface.

  ## Examples

      <.connections_widget
        connections={@connections}
        current_user={@current_user}
        type={:followers}
      />
  """

  use Phoenix.Component

  attr :connections, :list, required: true, doc: "List of connection maps"
  attr :current_user, :any, doc: "Current user identifier"

  attr :type, :atom,
    default: :followers,
    values: [:followers, :following, :connections],
    doc: "Type of connections"

  attr :max_display, :integer, default: 10, doc: "Maximum number of connections to display"
  attr :show_count, :boolean, default: true, doc: "Show total count"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :action, doc: "Custom action button"

  def connections_widget(assigns) do
    display_connections = Enum.take(assigns.connections, assigns.max_display)
    total_count = length(assigns.connections)

    type_label =
      case assigns.type do
        :followers -> "Followers"
        :following -> "Following"
        :connections -> "Connections"
      end

    assigns =
      assigns
      |> assign(:display_connections, display_connections)
      |> assign(:total_count, total_count)
      |> assign(:type_label, type_label)

    ~H"""
    <div
      class={["connections-widget bg-white border border-gray-200 rounded-lg p-6 shadow-sm", @class]}
      {@rest}
    >
      <!-- Header -->
      <div class="flex items-center justify-between mb-4">
        <div>
          <h3 class="text-lg font-semibold text-gray-900">{@type_label}</h3>

          <%= if @show_count do %>
            <p class="text-sm text-gray-600">{@total_count} {String.downcase(@type_label)}</p>
          <% end %>
        </div>

        <%= if assigns[:action] != [] do %>
          {render_slot(@action)}
        <% end %>
      </div>
      <!-- Connections List -->
      <div class="space-y-3">
        <%= if @display_connections == [] do %>
          <div class="text-center py-8 text-gray-500">
            <p class="text-sm">No {String.downcase(@type_label)} yet</p>
          </div>
        <% else %>
          <%= for connection <- @display_connections do %>
            <div class="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg transition-colors">
              <div class="flex items-center space-x-3 flex-1 min-w-0">
                <!-- Avatar -->
                <div class="relative flex-shrink-0">
                  <%= if Map.get(connection, :avatar) do %>
                    <img
                      src={Map.get(connection, :avatar)}
                      alt={Map.get(connection, :name, "User")}
                      class="w-10 h-10 rounded-full object-cover"
                    />
                  <% else %>
                    <div class="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center text-white font-semibold text-sm">
                      {get_initials(Map.get(connection, :name, "U"))}
                    </div>
                  <% end %>

                  <%= if Map.get(connection, :online, false) do %>
                    <div class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 rounded-full border-2 border-white">
                    </div>
                  <% end %>
                </div>
                <!-- User Info -->
                <div class="flex-1 min-w-0">
                  <p class="text-sm font-medium text-gray-900 truncate">
                    {Map.get(connection, :name, "Unknown User")}
                  </p>

                  <%= if Map.get(connection, :username) do %>
                    <p class="text-xs text-gray-500 truncate">@{Map.get(connection, :username)}</p>
                  <% end %>

                  <%= if Map.get(connection, :mutual_count) && Map.get(connection, :mutual_count) > 0 do %>
                    <p class="text-xs text-gray-500">
                      {Map.get(connection, :mutual_count)} mutual {if Map.get(
                                                                        connection,
                                                                        :mutual_count
                                                                      ) == 1,
                                                                      do: "connection",
                                                                      else: "connections"}
                    </p>
                  <% end %>
                </div>
              </div>
              <!-- Action Button -->
              <%= if Map.get(connection, :id) != @current_user do %>
                <button
                  type="button"
                  class={[
                    "px-4 py-2 text-sm font-medium rounded-lg transition-colors flex-shrink-0",
                    if(Map.get(connection, :is_connected, false),
                      do: "bg-gray-200 text-gray-700 hover:bg-gray-300",
                      else: "bg-blue-600 text-white hover:bg-blue-700"
                    )
                  ]}
                  phx-click="toggle-connection"
                  phx-value-id={Map.get(connection, :id)}
                >
                  {if Map.get(connection, :is_connected, false), do: "Connected", else: "Connect"}
                </button>
              <% end %>
            </div>
          <% end %>

          <%= if @total_count > @max_display do %>
            <button
              type="button"
              class="w-full mt-4 px-4 py-2 text-sm font-medium text-blue-600 hover:text-blue-800 hover:bg-blue-50 rounded-lg transition-colors"
              phx-click="view-all-connections"
              phx-value-type={@type}
            >
              View all {@total_count} {String.downcase(@type_label)}
            </button>
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end

  defp get_initials(name) do
    name
    |> String.split()
    |> Enum.take(2)
    |> Enum.map(&String.first/1)
    |> Enum.join()
    |> String.upcase()
  end
end
