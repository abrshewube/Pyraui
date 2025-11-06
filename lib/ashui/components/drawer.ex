defmodule Ashui.Components.Drawer do
  @moduledoc """
  Drawer sidebar component for off-canvas navigation.

  ## Examples

      <.drawer id="nav-drawer" open={@drawer_open}>
        <:trigger>Open Menu</:trigger>
        <:content>
          <nav>Navigation items</nav>
        </:content>
      </.drawer>
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the drawer"
  attr :open, :boolean, default: false, doc: "Open state"
  attr :side, :atom, default: :left, values: [:left, :right], doc: "Drawer side"
  attr :overlay, :boolean, default: true, doc: "Show overlay backdrop"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :trigger, doc: "Trigger button/content"
  slot :content, required: true, doc: "Drawer content"

  def drawer(assigns) do
    side_classes = %{
      left: "left-0",
      right: "right-0"
    }

    transform_classes = %{
      left: if(assigns.open, do: "translate-x-0", else: "-translate-x-full"),
      right: if(assigns.open, do: "translate-x-0", else: "translate-x-full")
    }

    assigns =
      assigns
      |> assign(:side_class, side_classes[assigns.side])
      |> assign(:transform_class, transform_classes[assigns.side])

    ~H"""
    <div>
      <%= if assigns[:trigger] != [] do %>
        <button
          type="button"
          phx-click={JS.push("toggle-drawer", value: %{id: @id})}
          class="drawer-trigger"
        >
          {render_slot(@trigger)}
        </button>
      <% end %>

      <%= if @overlay && @open do %>
        <div
          class="fixed inset-0 bg-black/50 z-40 transition-opacity"
          phx-click={JS.push("close-drawer", value: %{id: @id})}
          phx-key="escape"
          phx-window-keydown="close-drawer"
        >
        </div>
      <% end %>

      <aside
        id={@id}
        class={[
          "drawer fixed top-0 #{@side_class} h-full w-80 bg-white dark:bg-gray-800 shadow-xl z-50 transition-transform duration-300 ease-in-out",
          @transform_class,
          @class
        ]}
        {@rest}
      >
        <div class="p-4">
          <%= if assigns[:trigger] != [] do %>
            <button
              type="button"
              class="mb-4 p-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
              phx-click={JS.push("close-drawer", value: %{id: @id})}
              aria-label="Close drawer"
            >
              <.icon name="hero-x-mark" class="w-6 h-6" />
            </button>
          <% end %>
          {render_slot(@content)}
        </div>
      </aside>
    </div>
    """
  end
end
