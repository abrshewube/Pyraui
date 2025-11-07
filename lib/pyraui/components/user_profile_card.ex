defmodule Pyraui.Components.UserProfileCard do
  @moduledoc """
  User profile card component with online/offline status and user information.

  ## Examples

      <.user_profile_card
        name="John Doe"
        email="john@example.com"
        avatar="/images/avatar.jpg"
        online={true}
      />
  """

  use Phoenix.Component

  attr :name, :string, required: true, doc: "User's full name"
  attr :email, :string, default: nil, doc: "User's email address"
  attr :avatar, :string, default: nil, doc: "URL to user's avatar image"
  attr :online, :boolean, default: false, doc: "Online status"
  attr :role, :string, default: nil, doc: "User's role or title"
  attr :bio, :string, default: nil, doc: "User's bio or description"
  attr :actions, :list, default: [], doc: "List of action buttons"
  attr :class, :string, default: ""
  attr :rest, :global

  def user_profile_card(assigns) do
    initials = get_initials(assigns.name)

    assigns = assign(assigns, :initials, initials)

    ~H"""
    <div
      class={[
        "user-profile-card bg-white border border-gray-200 rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow",
        @class
      ]}
      {@rest}
    >
      <div class="flex items-start space-x-4">
        <!-- Avatar -->
        <div class="relative flex-shrink-0">
          <%= if @avatar do %>
            <img src={@avatar} alt={@name} class="w-16 h-16 rounded-full object-cover" />
          <% else %>
            <div class="w-16 h-16 rounded-full bg-blue-500 flex items-center justify-center text-white font-semibold text-lg">
              {@initials}
            </div>
          <% end %>
          <!-- Online Status Indicator -->
          <div class={[
            "absolute bottom-0 right-0 w-4 h-4 rounded-full border-2 border-white",
            if(@online, do: "bg-green-500", else: "bg-gray-400")
          ]}>
          </div>
        </div>
        <!-- User Info -->
        <div class="flex-1 min-w-0">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-lg font-semibold text-gray-900">{@name}</h3>

              <%= if @role do %>
                <p class="text-sm text-gray-600">{@role}</p>
              <% end %>
            </div>

            <%= if @online do %>
              <span class="text-xs text-green-600 font-medium">Online</span>
            <% else %>
              <span class="text-xs text-gray-500 font-medium">Offline</span>
            <% end %>
          </div>

          <%= if @email do %>
            <p class="text-sm text-gray-600 mt-1">{@email}</p>
          <% end %>

          <%= if @bio do %>
            <p class="text-sm text-gray-700 mt-2">{@bio}</p>
          <% end %>

          <%= if @actions != [] do %>
            <div class="flex items-center space-x-2 mt-4">
              <%= for action <- @actions do %>
                <button
                  type="button"
                  class={[
                    "px-4 py-2 text-sm font-medium rounded-lg transition-colors",
                    Map.get(action, :variant, :primary) == :primary &&
                      "bg-blue-600 text-white hover:bg-blue-700",
                    Map.get(action, :variant, :primary) == :secondary &&
                      "bg-gray-200 text-gray-700 hover:bg-gray-300",
                    Map.get(action, :variant, :primary) == :outline &&
                      "border border-gray-300 text-gray-700 hover:bg-gray-50"
                  ]}
                  phx-click={Map.get(action, :on_click)}
                >
                  {Map.get(action, :label, "Action")}
                </button>
              <% end %>
            </div>
          <% end %>
        </div>
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
