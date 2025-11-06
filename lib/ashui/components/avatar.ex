defmodule Ashui.Components.Avatar do
  @moduledoc """
  Avatar component for displaying user profile pictures or initials.

  ## Examples

      <.avatar src="/images/user.jpg" />
      <.avatar name="John Doe" />
      <.avatar name="JD" online={true} />
  """

  use Phoenix.Component

  attr :src, :string, default: nil, doc: "Image source URL"
  attr :name, :string, default: nil, doc: "Name for placeholder avatar (displays initials)"
  attr :size, :atom, default: :md, values: [:xs, :sm, :md, :lg, :xl], doc: "Avatar size"
  attr :online, :boolean, default: nil, doc: "Show online status indicator (true/false/nil)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block

  def avatar(assigns) do
    size_classes = %{
      xs: "w-8 h-8",
      sm: "w-10 h-10",
      md: "w-12 h-12",
      lg: "w-16 h-16",
      xl: "w-24 h-24"
    }

    text_size_classes = %{
      xs: "text-xs",
      sm: "text-sm",
      md: "text-base",
      lg: "text-lg",
      xl: "text-xl"
    }

    status_class =
      cond do
        assigns.online == true -> "avatar-online"
        assigns.online == false -> "avatar-offline"
        true -> ""
      end

    placeholder_class = if assigns.src == nil, do: "avatar-placeholder", else: ""

    initials =
      if assigns.name && assigns.src == nil do
        assigns.name
        |> String.split()
        |> Enum.map(&String.first/1)
        |> Enum.join()
        |> String.upcase()
        |> String.slice(0, 2)
      else
        nil
      end

    assigns =
      assigns
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:text_size_class, text_size_classes[assigns.size])
      |> assign(:status_class, status_class)
      |> assign(:placeholder_class, placeholder_class)
      |> assign(:initials, initials)

    ~H"""
    <div class={["avatar", @status_class, @placeholder_class, @class]} {@rest}>
      <div class={@size_class}>
        <%= if @src do %>
          <img src={@src} alt={@name || "Avatar"} />
        <% else %>
          <div class={[
            "bg-gray-300 text-gray-700 font-semibold flex items-center justify-center",
            @text_size_class
          ]}>
            <%= if @initials do %>
              {@initials}
            <% else %>
              {render_slot(@inner_block)}
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
