defmodule Ashui.Components.AvatarGroup do
  @moduledoc """
  Avatar group component for displaying multiple users in a row with overlapping avatars.

  ## Examples

      <.avatar_group users={@users} max_visible={5} />
      <.avatar_group users={@users} size={:lg} stack={true} />
  """

  use Phoenix.Component

  attr :users, :list, required: true, doc: "List of user maps with :name, :avatar, :online"
  attr :max_visible, :integer, default: 5, doc: "Maximum number of avatars to show"
  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Avatar size"
  attr :stack, :boolean, default: true, doc: "Stack avatars with negative margin"
  attr :show_online_status, :boolean, default: true, doc: "Show online status indicator"
  attr :class, :string, default: ""
  attr :rest, :global

  def avatar_group(assigns) do
    visible_users = Enum.take(assigns.users, assigns.max_visible)
    remaining_count = max(0, length(assigns.users) - assigns.max_visible)

    size_classes = %{
      sm: "w-8 h-8 text-xs",
      md: "w-10 h-10 text-sm",
      lg: "w-12 h-12 text-base"
    }

    assigns =
      assigns
      |> assign(:visible_users, visible_users)
      |> assign(:remaining_count, remaining_count)
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:stack_class, if(assigns.stack, do: "-ml-2 first:ml-0", else: ""))

    ~H"""
    <div class={["avatar-group flex items-center", @class]} {@rest}>
      <%= for {user, index} <- Enum.with_index(@visible_users) do %>
        <div
          class={["relative flex-shrink-0", @stack_class]}
          style={if(@stack, do: "z-index: #{length(@visible_users) - index};", else: "")}
        >
          <%= if Map.get(user, :avatar) do %>
            <img
              src={Map.get(user, :avatar)}
              alt={Map.get(user, :name, "User")}
              class={["#{@size_class} rounded-full object-cover border-2 border-white"]}
            />
          <% else %>
            <div class={[
              "#{@size_class} rounded-full bg-blue-500 flex items-center justify-center text-white font-semibold border-2 border-white"
            ]}>
              {get_initials(Map.get(user, :name, "U"))}
            </div>
          <% end %>

          <%= if @show_online_status && Map.get(user, :online, false) do %>
            <div class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 rounded-full border-2 border-white">
            </div>
          <% end %>
        </div>
      <% end %>

      <%= if @remaining_count > 0 do %>
        <div class={["relative flex-shrink-0", @stack_class]}>
          <div class={[
            "#{@size_class} rounded-full bg-gray-300 flex items-center justify-center text-gray-700 font-semibold border-2 border-white"
          ]}>
            +{@remaining_count}
          </div>
        </div>
      <% end %>
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
