defmodule Ashui.Components.ThemeSwitch do
  @moduledoc """
  Theme switch component for switching between dark and light modes.

  ## Examples

      <.theme_switch />
      <.theme_switch show_label={true} />
  """

  use Phoenix.Component

  attr :show_label, :boolean, default: false, doc: "Show label text"
  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Toggle size"
  attr :class, :string, default: ""
  attr :rest, :global

  def theme_switch(assigns) do
    size_classes = %{
      sm: "w-8 h-4",
      md: "w-12 h-6",
      lg: "w-16 h-8"
    }

    thumb_size_classes = %{
      sm: "w-3 h-3",
      md: "w-5 h-5",
      lg: "w-7 h-7"
    }

    assigns =
      assigns
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:thumb_size_class, thumb_size_classes[assigns.size])

    ~H"""
    <div class={["theme-toggle-container flex items-center space-x-2", @class]} {@rest}>
      <%= if @show_label do %>
        <span class="text-sm text-gray-700 dark:text-gray-300">Light</span>
      <% end %>

      <button
        type="button"
        id="theme-toggle"
        class={[
          "relative inline-flex items-center rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2",
          @size_class,
          "bg-gray-200 dark:bg-gray-700"
        ]}
        phx-hook="ThemeToggleHook"
        aria-label="Toggle theme"
        role="switch"
        aria-checked="false"
      >
        <span class={[
          "inline-block rounded-full bg-white shadow-lg transform transition-transform",
          @thumb_size_class,
          "translate-x-0.5 dark:translate-x-6"
        ]}>
        </span>
      </button>
      <%= if @show_label do %>
        <span class="text-sm text-gray-700 dark:text-gray-300">Dark</span>
      <% end %>
    </div>
    """
  end
end
