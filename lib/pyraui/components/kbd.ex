defmodule Pyraui.Components.Kbd do
  @moduledoc """
  Keyboard shortcut display component for showing keyboard combinations.

  ## Examples

      <.kbd>Ctrl</.kbd> + <.kbd>S</.kbd>
      <.kbd size={:sm}>Esc</.kbd>
  """

  use Phoenix.Component

  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Key size"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def kbd(assigns) do
    size_classes = %{
      sm: "px-1.5 py-0.5 text-xs",
      md: "px-2 py-1 text-sm",
      lg: "px-3 py-1.5 text-base"
    }

    assigns = assign(assigns, :size_class, size_classes[assigns.size])

    ~H"""
    <kbd
      class={[
        "kbd font-mono font-semibold rounded border border-gray-300 dark:border-gray-600 bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-gray-200 shadow-sm",
        @size_class,
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </kbd>
    """
  end
end
