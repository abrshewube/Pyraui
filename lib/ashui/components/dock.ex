defmodule Ashui.Components.Dock do
  @moduledoc """
  Dock / Bottom Navigation component for mobile-style bottom navigation bars.

  ## Examples

      <.dock id="main-dock">
        <:item icon="hero-home" label="Home" active={true} />
        <:item icon="hero-user" label="Profile" />
      </.dock>
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the dock"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :item, required: true do
    attr :icon, :string, required: true
    attr :label, :string
    attr :href, :string
    attr :navigate, :string
    attr :active, :boolean
  end

  def dock(assigns) do
    ~H"""
    <nav
      id={@id}
      class={[
        "dock fixed bottom-0 left-0 right-0 z-50 bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 shadow-lg",
        @class
      ]}
      {@rest}
    >
      <div class="flex items-center justify-around h-16 px-2">
        <%= for item <- @item do %>
          <%= cond do %>
            <% Map.get(item, :navigate) -> %>
              <Phoenix.Component.link
                navigate={Map.get(item, :navigate)}
                class={[
                  "dock-item flex flex-col items-center justify-center flex-1 h-full rounded-lg transition-colors",
                  if(Map.get(item, :active, false),
                    do: "text-blue-600 dark:text-blue-400 bg-blue-50 dark:bg-blue-900/30",
                    else:
                      "text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-200"
                  )
                ]}
              >
                <.icon name={Map.get(item, :icon)} class="w-6 h-6 mb-1" />
                <%= if Map.get(item, :label) do %>
                  <span class="text-xs font-medium">{Map.get(item, :label)}</span>
                <% end %>
              </Phoenix.Component.link>
            <% Map.get(item, :href) -> %>
              <a
                href={Map.get(item, :href)}
                class={[
                  "dock-item flex flex-col items-center justify-center flex-1 h-full rounded-lg transition-colors",
                  if(Map.get(item, :active, false),
                    do: "text-blue-600 dark:text-blue-400 bg-blue-50 dark:bg-blue-900/30",
                    else:
                      "text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-200"
                  )
                ]}
              >
                <.icon name={Map.get(item, :icon)} class="w-6 h-6 mb-1" />
                <%= if Map.get(item, :label) do %>
                  <span class="text-xs font-medium">{Map.get(item, :label)}</span>
                <% end %>
              </a>
            <% true -> %>
              <div class={[
                "dock-item flex flex-col items-center justify-center flex-1 h-full rounded-lg transition-colors cursor-pointer",
                if(Map.get(item, :active, false),
                  do: "text-blue-600 dark:text-blue-400 bg-blue-50 dark:bg-blue-900/30",
                  else:
                    "text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-200"
                )
              ]}>
                <.icon name={Map.get(item, :icon)} class="w-6 h-6 mb-1" />
                <%= if Map.get(item, :label) do %>
                  <span class="text-xs font-medium">{Map.get(item, :label)}</span>
                <% end %>
              </div>
          <% end %>
        <% end %>
      </div>
    </nav>
    """
  end
end
