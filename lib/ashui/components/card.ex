defmodule Ashui.Components.Card do
  @moduledoc """
  Card component for content containers.

  ## Examples

      <.card>
        <h2>Card Title</h2>
        <p>Card content</p>
      </.card>

      <.card padded={false}>
        <img src="..." />
      </.card>
  """

  use Phoenix.Component

  attr :padded, :boolean, default: true
  attr :shadow, :atom, default: :md, values: [:none, :sm, :md, :lg, :xl]
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def card(assigns) do
    shadow_classes = %{
      none: "",
      sm: "shadow-sm",
      md: "shadow-md",
      lg: "shadow-lg",
      xl: "shadow-xl"
    }

    assigns = assign(assigns, :shadow_class, shadow_classes[assigns.shadow])

    ~H"""
    <div
      class={[
        "bg-white rounded-lg border border-gray-200",
        @shadow_class,
        @padded && "p-6",
        @class
      ]}
      {@rest}
    >
      <slot />
    </div>
    """
  end
end
