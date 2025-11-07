defmodule Pyraui.Components.Button do
  @moduledoc """
  Button component with multiple variants and states.

  ## Examples

      <.button>Click me</.button>
      <.button variant="primary" size="lg">Large Button</.button>
      <.button disabled={true}>Disabled</.button>
      <.button loading={true}>Loading...</.button>
  """

  use Phoenix.Component

  attr :variant, :atom,
    default: :primary,
    values: [:primary, :secondary, :ghost, :danger, :success]

  attr :size, :atom, default: :md, values: [:sm, :md, :lg, :xl]
  attr :disabled, :boolean, default: false
  attr :loading, :boolean, default: false
  attr :type, :string, default: "button"
  attr :class, :string, default: ""
  attr :navigate, :any, default: nil
  attr :patch, :any, default: nil
  attr :href, :string, default: nil

  attr :rest, :global,
    include: ~w(onclick phx-click phx-target target rel download data-method data-confirm)

  slot :inner_block, required: true

  def button(assigns) do
    variant_classes = %{
      primary: "bg-blue-600 text-white hover:bg-blue-700 active:bg-blue-800",
      secondary: "bg-gray-200 text-gray-900 hover:bg-gray-300 active:bg-gray-400",
      ghost: "bg-transparent text-gray-700 hover:bg-gray-100 active:bg-gray-200",
      danger: "bg-red-600 text-white hover:bg-red-700 active:bg-red-800",
      success: "bg-green-600 text-white hover:bg-green-700 active:bg-green-800"
    }

    size_classes = %{
      sm: "px-3 py-1.5 text-sm",
      md: "px-4 py-2 text-base",
      lg: "px-6 py-3 text-lg",
      xl: "px-8 py-4 text-xl"
    }

    assigns =
      assigns
      |> assign(:variant_class, variant_classes[assigns.variant])

    assigns = assign(assigns, :size_class, size_classes[assigns.size])

    assigns =
      assign(assigns, :button_classes, [
        "inline-flex items-center justify-center rounded-lg font-medium transition-colors",
        "focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500",
        "disabled:opacity-50 disabled:cursor-not-allowed",
        assigns.variant_class,
        assigns.size_class,
        assigns.class
      ])

    ~H"""
    <%= cond do %>
      <% @navigate && !@disabled -> %>
        <.link navigate={@navigate} class={@button_classes} {@rest}>
          {button_inner(assigns)}
        </.link>
      <% @patch && !@disabled -> %>
        <.link patch={@patch} class={@button_classes} {@rest}>
          {button_inner(assigns)}
        </.link>
      <% @href && !@disabled -> %>
        <.link href={@href} class={@button_classes} {@rest}>
          {button_inner(assigns)}
        </.link>
      <% true -> %>
        <button
          type={@type}
          disabled={@disabled || @loading}
          class={@button_classes}
          {@rest}
        >
          {button_inner(assigns)}
        </button>
    <% end %>
    """
  end

  defp button_inner(assigns) do
    ~H"""
    <span class="inline-flex items-center justify-center gap-2">
      <%= if @loading do %>
        <svg
          class="animate-spin -ml-1 h-4 w-4"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
        >
          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4">
          </circle>
          <path
            class="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
          >
          </path>
        </svg>
      <% end %>
      {render_slot(@inner_block)}
    </span>
    """
  end
end
