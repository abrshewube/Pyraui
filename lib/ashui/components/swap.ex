defmodule Ashui.Components.Swap do
  @moduledoc """
  Swap component for toggling between two elements with smooth transitions.

  ## Examples

      <.swap id="theme-swap" active={@dark_mode}>
        <:on>Dark Mode</:on>
        <:off>Light Mode</:off>
      </.swap>
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the swap"
  attr :active, :boolean, default: false, doc: "Active state (shows :on slot)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :on, required: true, doc: "Content to show when active"
  slot :off, required: true, doc: "Content to show when inactive"

  def swap(assigns) do
    ~H"""
    <label
      id={@id}
      class={[
        "swap cursor-pointer inline-block relative",
        @class
      ]}
      {@rest}
    >
      <input
        type="checkbox"
        checked={@active}
        class="swap-checkbox absolute opacity-0 pointer-events-none"
      />
      <div class="swap-on">{render_slot(@on)}</div>

      <div class="swap-off">{render_slot(@off)}</div>
    </label>
    """
  end
end
