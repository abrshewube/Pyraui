defmodule Ashui.Components.Navbar do
  @moduledoc """
  Responsive navbar component with mobile menu support.

  ## Examples

      <.navbar brand="MyApp">
        <.navbar_item href="/">Home</.navbar_item>
        <.navbar_item href="/about">About</.navbar_item>
      </.navbar>
  """

  use Phoenix.Component

  attr :brand, :string, default: "Brand"
  attr :class, :string, default: ""
  attr :rest, :global
  slot :item
  slot :actions

  def navbar(assigns) do
    ~H"""
    <nav class={["bg-white shadow-sm border-b border-gray-200", @class]} {@rest}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
          <div class="flex">
            <div class="flex-shrink-0 flex items-center">
              <span class="text-xl font-bold text-gray-900">{@brand}</span>
            </div>

            <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
              <%= for item <- @item do %>
                <.link
                  navigate={item.href}
                  class={[
                    "inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium transition-colors",
                    if(Map.get(item, :active, false),
                      do: "border-blue-500 text-gray-900",
                      else:
                        "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300"
                    )
                  ]}
                >
                  {render_slot(item)}
                </.link>
              <% end %>
            </div>
          </div>

          <div class="hidden sm:ml-6 sm:flex sm:items-center">{render_slot(@actions)}</div>

          <div class="sm:hidden flex items-center">
            <button
              type="button"
              phx-click="toggle-mobile-menu"
              class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100"
            >
              <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M4 6h16M4 12h16M4 18h16"
                />
              </svg>
            </button>
          </div>
        </div>
      </div>

      <div
        id="mobile-menu"
        class="hidden sm:hidden border-t border-gray-200"
      >
        <div class="pt-2 pb-3 space-y-1">
          <%= for item <- @item do %>
            <.link
              navigate={item.href}
              class="block pl-3 pr-4 py-2 border-l-4 text-base font-medium transition-colors"
              class={[
                if(Map.get(item, :active, false),
                  do: "bg-blue-50 border-blue-500 text-blue-700",
                  else: "border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300"
                )
              ]}
            >
              {render_slot(item)}
            </.link>
          <% end %>
        </div>
      </div>
    </nav>
    """
  end
end
