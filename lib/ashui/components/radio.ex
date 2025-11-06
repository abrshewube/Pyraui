defmodule Ashui.Components.Radio do
  @moduledoc """
  Radio button component with label.

  ## Examples

      <.radio name="size" value="small" label="Small" checked={@size == "small"} />
      <.radio name="size" value="large" label="Large" checked={@size == "large"} />
  """

  use Phoenix.Component

  attr :name, :string, required: true
  attr :value, :string, required: true
  attr :label, :string, default: nil
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(id)

  def radio(assigns) do
    assigns =
      assign_new(assigns, :id, fn ->
        "radio-#{assigns.name}-#{assigns.value}-#{System.unique_integer([:positive])}"
      end)

    ~H"""
    <div class="mb-2 flex items-center">
      <input
        type="radio"
        id={@id}
        name={@name}
        value={@value}
        checked={@checked}
        disabled={@disabled}
        required={@required}
        class={[
          "h-4 w-4 border-gray-300 text-blue-600",
          "focus:ring-2 focus:ring-blue-500",
          "disabled:opacity-50 disabled:cursor-not-allowed",
          @class
        ]}
        {@rest}
      />
      <%= if @label do %>
        <label for={@id} class="ml-2 block text-sm text-gray-700">{@label}</label>
      <% end %>
    </div>
    """
  end
end
