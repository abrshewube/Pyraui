defmodule Ashui.Components.Gauge do
  @moduledoc """
  Gauge component for displaying KPI metrics and progress indicators.

  ## Examples

      <.gauge value={75} max={100} label="CPU Usage" />
      <.gauge value={60} max={100} variant="success" />
  """

  use Phoenix.Component

  attr :value, :float, required: true
  attr :max, :float, default: 100.0
  attr :label, :string, default: nil
  attr :variant, :atom, default: :primary, values: [:primary, :success, :warning, :error]
  attr :size, :atom, default: :md, values: [:sm, :md, :lg]
  attr :class, :string, default: ""
  attr :rest, :global

  def gauge(assigns) do
    percentage = min(100, max(0, round(assigns.value / assigns.max * 100)))
    size_classes = %{sm: "w-24 h-24", md: "w-32 h-32", lg: "w-48 h-48"}

    variant_colors = %{
      primary: "#3b82f6",
      success: "#10b981",
      warning: "#f59e0b",
      error: "#ef4444"
    }

    assigns =
      assigns
      |> assign(:percentage, percentage)
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:color, variant_colors[assigns.variant])
      |> assign(:radius, get_radius(assigns.size))
      |> assign(:stroke_width, get_stroke_width(assigns.size))

    ~H"""
    <div class={["gauge-container flex flex-col items-center", @class]} {@rest}>
      <div class={["relative", @size_class]}>
        <svg class="transform -rotate-90" viewBox="0 0 100 100">
          <circle
            cx="50"
            cy="50"
            r={@radius}
            fill="none"
            stroke="#e5e7eb"
            stroke-width={@stroke_width}
          />
          <circle
            cx="50"
            cy="50"
            r={@radius}
            fill="none"
            stroke={@color}
            stroke-width={@stroke_width}
            stroke-linecap="round"
            stroke-dasharray={2 * :math.pi() * @radius}
            stroke-dashoffset={2 * :math.pi() * @radius * (1 - @percentage / 100)}
            class="transition-all duration-500"
          />
        </svg>
        <div class="absolute inset-0 flex items-center justify-center">
          <div class="text-center">
            <div class="text-2xl font-bold text-gray-900">{@percentage}%</div>

            <%= if @label do %>
              <div class="text-xs text-gray-600 mt-1">{@label}</div>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp get_radius(:sm), do: 35
  defp get_radius(:md), do: 40
  defp get_radius(:lg), do: 45

  defp get_stroke_width(:sm), do: 6
  defp get_stroke_width(:md), do: 8
  defp get_stroke_width(:lg), do: 10
end
