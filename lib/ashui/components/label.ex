defmodule Ashui.Components.Label do
  @moduledoc """
  Label component for form fields.

  ## Examples

      <.label for="email">Email Address</.label>
      <.label for="name" required={true}>Name</.label>
  """

  use Phoenix.Component

  attr :for, :string, required: true
  attr :required, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label
      for={@for}
      class={[
        "block text-sm font-medium text-gray-700",
        @class
      ]}
      {@rest}
    >
      <slot />
      <%= if @required do %>
        <span class="text-red-500">*</span>
      <% end %>
    </label>
    """
  end
end
