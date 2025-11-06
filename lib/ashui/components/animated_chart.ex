defmodule Ashui.Components.AnimatedChart do
  @moduledoc """
  Animated Chart component with smooth transitions when data changes.

  ## Examples

      <.animated_chart type={:line} data={@chart_data} labels={@labels} />
  """

  use Phoenix.Component

  attr :type, :atom, required: true, values: [:line, :bar, :area], doc: "Chart type"
  attr :data, :list, required: true, doc: "Chart data values"
  attr :labels, :list, default: [], doc: "Chart labels"
  attr :width, :integer, default: 400, doc: "Chart width"
  attr :height, :integer, default: 300, doc: "Chart height"
  attr :colors, :list, default: nil, doc: "Custom colors"
  attr :duration, :integer, default: 1000, doc: "Animation duration in milliseconds"
  attr :class, :string, default: ""
  attr :rest, :global

  def animated_chart(assigns) do
    # Use the regular Chart component but add animation attributes
    chart_id = "animated-chart-#{System.unique_integer([:positive])}"
    data_json = Jason.encode!(assigns.data)
    labels_json = Jason.encode!(assigns.labels)
    colors_json = if assigns.colors, do: Jason.encode!(assigns.colors), else: ""

    assigns =
      assigns
      |> assign(:chart_id, chart_id)
      |> assign(:data_json, data_json)
      |> assign(:labels_json, labels_json)
      |> assign(:colors_json, colors_json)

    ~H"""
    <div
      id={@chart_id}
      class={["animated-chart", @class]}
      phx-hook="AnimatedChartHook"
      data-duration={@duration}
      data-type={@type}
      data-data={@data_json}
      data-labels={@labels_json}
      data-width={@width}
      data-height={@height}
      data-colors={@colors_json}
      {@rest}
    >
      <svg width={@width} height={@height} class="chart-svg">
        <!-- Chart will be rendered by JavaScript hook -->
      </svg>
    </div>
    """
  end
end
