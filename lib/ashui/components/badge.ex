defmodule Ashui.Components.Badge do
  @moduledoc """
  Badge component for status indicators and labels.

  ## Examples

      <.badge variant="success">Active</.badge>
      <.badge variant="warning" size="lg">Pending</.badge>
  """

  use Phoenix.Component

  attr :variant, :atom,
    default: :default,
    values: [:default, :primary, :success, :warning, :error, :info]

  attr :size, :atom, default: :md, values: [:sm, :md, :lg]
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def badge(assigns) do
    variant_classes = %{
      default: "bg-gray-100 text-gray-800",
      primary: "bg-blue-100 text-blue-800",
      success: "bg-green-100 text-green-800",
      warning: "bg-yellow-100 text-yellow-800",
      error: "bg-red-100 text-red-800",
      info: "bg-blue-100 text-blue-800"
    }

    size_classes = %{
      sm: "px-2 py-0.5 text-xs",
      md: "px-2.5 py-1 text-sm",
      lg: "px-3 py-1.5 text-base"
    }

    assigns =
      assigns
      |> assign(:variant_class, variant_classes[assigns.variant])
      |> assign(:size_class, size_classes[assigns.size])

    ~H"""
    <span
      class={[
        "inline-flex items-center font-medium rounded-full",
        @variant_class,
        @size_class,
        @class
      ]}
      {@rest}
    >
      <slot />
    </span>
    """
  end
end
