defmodule Ashui.Components.Progress do
  @moduledoc """
  Progress bar component for showing completion status.

  ## Examples

      <.progress value={75} max={100} />
      <.progress value={50} variant="success" />
  """

  use Phoenix.Component

  attr :value, :integer, required: true
  attr :max, :integer, default: 100
  attr :variant, :atom, default: :primary, values: [:primary, :success, :warning, :error]
  attr :show_label, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global

  def progress(assigns) do
    percentage = min(100, max(0, round(assigns.value / assigns.max * 100)))

    variant_classes = %{
      primary: "bg-blue-600",
      success: "bg-green-600",
      warning: "bg-yellow-600",
      error: "bg-red-600"
    }

    assigns =
      assigns
      |> assign(:percentage, percentage)
      |> assign(:variant_class, variant_classes[assigns.variant])

    ~H"""
    <div class={["w-full", @class]} {@rest}>
      <div class="flex items-center justify-between mb-2">
        <span class="text-sm font-medium text-gray-700">Progress</span>
        <%= if @show_label do %>
          <span class="text-sm font-medium text-gray-700">{@percentage}%</span>
        <% end %>
      </div>

      <div class="w-full bg-gray-200 rounded-full h-2.5">
        <div
          class={[
            "h-2.5 rounded-full transition-all duration-300",
            @variant_class
          ]}
          style={"width: #{@percentage}%"}
        >
        </div>
      </div>
    </div>
    """
  end
end
