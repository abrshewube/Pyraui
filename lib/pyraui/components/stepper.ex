defmodule Pyraui.Components.Stepper do
  @moduledoc """
  Stepper component for displaying multi-step processes and progress.

  ## Examples

      <.stepper>
        <.step label="Step 1" status={:completed} />
        <.step label="Step 2" status={:active} />
        <.step label="Step 3" status={:pending} />
      </.stepper>
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :orientation, :atom,
    default: :horizontal,
    values: [:horizontal, :vertical],
    doc: "Layout orientation"

  attr :class, :string, default: ""
  attr :rest, :global

  slot :step, required: true do
    attr :label, :string
    attr :status, :atom, values: [:pending, :active, :completed], doc: "Step status"

    attr :variant, :atom,
      values: [:primary, :secondary, :accent, :info, :success, :warning, :error],
      doc: "Step color variant"

    attr :icon, :string, doc: "Icon name (heroicons)"
  end

  def stepper(assigns) do
    orientation_class =
      if assigns.orientation == :vertical, do: "steps-vertical", else: "steps-horizontal"

    assigns = assign(assigns, :orientation_class, orientation_class)

    ~H"""
    <ul class={["steps", @orientation_class, @class]} {@rest}>
      <%= for step <- @step do %>
        <li
          class={[
            "step",
            Map.get(step, :status, :pending) == :completed &&
              "step-#{Map.get(step, :variant, :primary)}",
            Map.get(step, :status, :pending) == :active && "step-#{Map.get(step, :variant, :primary)}"
          ]}
          data-content={if Map.get(step, :status, :pending) == :completed, do: "✓"}
        >
          <%= if Map.get(step, :icon) do %>
            <span class="step-icon"><.icon name={Map.get(step, :icon)} class="size-4" /></span>
          <% end %>

          <%= if Map.get(step, :label) do %>
            {Map.get(step, :label)}
          <% end %>
        </li>
      <% end %>
    </ul>
    """
  end
end
