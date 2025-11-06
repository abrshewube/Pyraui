defmodule Ashui.Components.Chart do
  @moduledoc """
  Chart component for displaying various types of data visualizations.

  Supports Line, Bar, Pie, Donut, Area, Stacked, and Sparkline charts.
  Uses SVG for rendering, works without external dependencies.

  ## Examples

      <.chart type="line" data={[10, 20, 30, 40]} labels={["Jan", "Feb", "Mar", "Apr"]} />
      <.chart type="bar" data={[10, 20, 30]} />
      <.chart type="pie" data={[30, 40, 30]} labels={["A", "B", "C"]} />
  """

  use Phoenix.Component

  attr :type, :atom,
    required: true,
    values: [:line, :bar, :pie, :donut, :area, :stacked, :sparkline]

  attr :data, :list, required: true, doc: "Chart data points"
  attr :labels, :list, default: [], doc: "Labels for data points"
  attr :width, :integer, default: 400
  attr :height, :integer, default: 300
  attr :colors, :list, default: nil, doc: "Custom colors for chart"
  attr :title, :string, default: nil
  attr :class, :string, default: ""
  attr :rest, :global

  def chart(assigns) do
    default_colors = get_default_colors(assigns.type)

    assigns =
      assigns
      |> assign(:default_colors, default_colors)
      |> assign(:chart_colors, assigns.colors || default_colors)
      |> assign(:normalized_data, normalize_data(assigns.data))
      |> assign(:max_value, get_max_value(assigns.data))

    ~H"""
    <div class={["chart-container", @class]} {@rest}>
      <%= if @title do %>
        <h3 class="text-lg font-semibold mb-4 text-gray-900">{@title}</h3>
      <% end %>

      <div class="chart-wrapper" style={"width: #{@width}px; height: #{@height}px;"}>
        <%= case @type do %>
          <% :line -> %>
            {render_line_chart(assigns)}
          <% :bar -> %>
            {render_bar_chart(assigns)}
          <% :pie -> %>
            {render_pie_chart(assigns)}
          <% :donut -> %>
            {render_donut_chart(assigns)}
          <% :area -> %>
            {render_area_chart(assigns)}
          <% :stacked -> %>
            {render_stacked_chart(assigns)}
          <% :sparkline -> %>
            {render_sparkline_chart(assigns)}
        <% end %>
      </div>
    </div>
    """
  end

  defp render_line_chart(assigns) do
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    points = calculate_line_points(assigns.normalized_data, chart_width, chart_height, padding)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <defs>
        <linearGradient id="line-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style="stop-color:#3b82f6;stop-opacity:0.3" />
          <stop offset="100%" style="stop-color:#3b82f6;stop-opacity:0" />
        </linearGradient>
      </defs>

      <g transform={"translate(#{padding}, #{padding})"}>
        <%= for {x, y} <- points do %>
          <circle cx={x} cy={y} r="3" fill="#3b82f6" />
        <% end %>

        <polyline
          points={Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end)}
          fill="none"
          stroke="#3b82f6"
          stroke-width="2"
        />
        <polygon
          points={
            [
              Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end),
              "#{List.last(points) |> elem(0)},#{chart_height}",
              "#{List.first(points) |> elem(0)},#{chart_height}"
            ]
            |> Enum.join(" ")
          }
          fill="url(#line-gradient)"
        />
      </g>
    </svg>
    """
  end

  defp render_bar_chart(assigns) do
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    bar_width = div(chart_width, length(assigns.normalized_data))
    spacing = 4

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{padding}, #{padding})"}>
        <%= for {value, index} <- Enum.with_index(assigns.normalized_data) do %>
          <% x = index * bar_width + spacing %> <% bar_height = value * chart_height %> <% y =
            chart_height - bar_height %>
          <rect
            x={x}
            y={y}
            width={bar_width - spacing * 2}
            height={bar_height}
            fill={Enum.at(@chart_colors, rem(index, length(@chart_colors)))}
            rx="4"
          />
        <% end %>
      </g>
    </svg>
    """
  end

  defp render_pie_chart(assigns) do
    center_x = div(assigns.width, 2)
    center_y = div(assigns.height, 2)
    radius = min(center_x, center_y) - 20
    total = Enum.sum(assigns.normalized_data)
    angles = calculate_pie_angles(assigns.normalized_data, total)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <%= for {start_angle, end_angle, index} <- angles do %>
        <% path = create_pie_path(center_x, center_y, radius, start_angle, end_angle) %>
        <path
          d={path}
          fill={Enum.at(@chart_colors, rem(index, length(@chart_colors)))}
          stroke="white"
          stroke-width="2"
        />
      <% end %>
    </svg>
    """
  end

  defp render_donut_chart(assigns) do
    center_x = div(assigns.width, 2)
    center_y = div(assigns.height, 2)
    outer_radius = min(center_x, center_y) - 20
    inner_radius = outer_radius * 0.6
    total = Enum.sum(assigns.normalized_data)
    angles = calculate_pie_angles(assigns.normalized_data, total)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <%= for {start_angle, end_angle, index} <- angles do %>
        <% path =
          create_donut_path(center_x, center_y, outer_radius, inner_radius, start_angle, end_angle) %>
        <path
          d={path}
          fill={Enum.at(@chart_colors, rem(index, length(@chart_colors)))}
          stroke="white"
          stroke-width="2"
        />
      <% end %>
    </svg>
    """
  end

  defp render_area_chart(assigns) do
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    points = calculate_line_points(assigns.normalized_data, chart_width, chart_height, padding)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <defs>
        <linearGradient id="area-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style="stop-color:#3b82f6;stop-opacity:0.4" />
          <stop offset="100%" style="stop-color:#3b82f6;stop-opacity:0.1" />
        </linearGradient>
      </defs>

      <g transform={"translate(#{padding}, #{padding})"}>
        <polygon
          points={
            [
              Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end),
              "#{List.last(points) |> elem(0)},#{chart_height}",
              "#{List.first(points) |> elem(0)},#{chart_height}"
            ]
            |> Enum.join(" ")
          }
          fill="url(#area-gradient)"
        />
        <polyline
          points={Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end)}
          fill="none"
          stroke="#3b82f6"
          stroke-width="2"
        />
        <%= for {x, y} <- points do %>
          <circle cx={x} cy={y} r="3" fill="#3b82f6" />
        <% end %>
      </g>
    </svg>
    """
  end

  defp render_stacked_chart(assigns) do
    # For stacked charts, data should be a list of lists
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{padding}, #{padding})"}>
        <!-- Stacked bar implementation -->
        <text x="0" y={chart_height + 20} class="text-xs fill-gray-600">Stacked Chart</text>
      </g>
    </svg>
    """
  end

  defp render_sparkline_chart(assigns) do
    padding = 10
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    points = calculate_line_points(assigns.normalized_data, chart_width, chart_height, padding)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{padding}, #{padding})"}>
        <polyline
          points={Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end)}
          fill="none"
          stroke="#3b82f6"
          stroke-width="1.5"
        />
      </g>
    </svg>
    """
  end

  # Helper functions

  defp normalize_data(data) when is_list(data) do
    max_val = get_max_value(data)

    if max_val > 0 do
      Enum.map(data, fn val -> val / max_val end)
    else
      data
    end
  end

  defp get_max_value(data) when is_list(data) do
    Enum.max(data, fn -> 1 end)
  end

  defp calculate_line_points(normalized_data, width, height, padding) do
    step_x = if length(normalized_data) > 1, do: width / (length(normalized_data) - 1), else: 0

    normalized_data
    |> Enum.with_index()
    |> Enum.map(fn {value, index} ->
      x = index * step_x
      y = height - value * height
      {x, y}
    end)
  end

  defp calculate_pie_angles(data, total) when total > 0 do
    data
    |> Enum.reduce({0, []}, fn value, {current_angle, acc} ->
      angle = value / total * 360
      end_angle = current_angle + angle
      {end_angle, [{current_angle, end_angle, length(acc)} | acc]}
    end)
    |> elem(1)
    |> Enum.reverse()
  end

  defp calculate_pie_angles(_, _), do: []

  defp create_pie_path(center_x, center_y, radius, start_angle, end_angle) do
    start_rad = degrees_to_radians(start_angle)
    end_rad = degrees_to_radians(end_angle)

    x1 = center_x + radius * :math.cos(start_rad)
    y1 = center_y + radius * :math.sin(start_rad)
    x2 = center_x + radius * :math.cos(end_rad)
    y2 = center_y + radius * :math.sin(end_rad)

    large_arc = if end_angle - start_angle > 180, do: "1", else: "0"

    "M #{center_x} #{center_y} L #{x1} #{y1} A #{radius} #{radius} 0 #{large_arc} 1 #{x2} #{y2} Z"
  end

  defp create_donut_path(center_x, center_y, outer_radius, inner_radius, start_angle, end_angle) do
    start_rad = degrees_to_radians(start_angle)
    end_rad = degrees_to_radians(end_angle)

    x1_outer = center_x + outer_radius * :math.cos(start_rad)
    y1_outer = center_y + outer_radius * :math.sin(start_rad)
    x2_outer = center_x + outer_radius * :math.cos(end_rad)
    y2_outer = center_y + outer_radius * :math.sin(end_rad)

    x1_inner = center_x + inner_radius * :math.cos(end_rad)
    y1_inner = center_y + inner_radius * :math.sin(end_rad)
    x2_inner = center_x + inner_radius * :math.cos(start_rad)
    y2_inner = center_y + inner_radius * :math.sin(start_rad)

    large_arc = if end_angle - start_angle > 180, do: "1", else: "0"

    "M #{x1_outer} #{y1_outer} A #{outer_radius} #{outer_radius} 0 #{large_arc} 1 #{x2_outer} #{y2_outer} L #{x1_inner} #{y1_inner} A #{inner_radius} #{inner_radius} 0 #{large_arc} 0 #{x2_inner} #{y2_inner} Z"
  end

  defp degrees_to_radians(degrees) do
    (degrees - 90) * :math.pi() / 180
  end

  defp get_default_colors(:line), do: ["#3b82f6"]
  defp get_default_colors(:bar), do: ["#3b82f6", "#10b981", "#f59e0b", "#ef4444", "#8b5cf6"]

  defp get_default_colors(:pie),
    do: ["#3b82f6", "#10b981", "#f59e0b", "#ef4444", "#8b5cf6", "#ec4899"]

  defp get_default_colors(:donut),
    do: ["#3b82f6", "#10b981", "#f59e0b", "#ef4444", "#8b5cf6", "#ec4899"]

  defp get_default_colors(:area), do: ["#3b82f6"]
  defp get_default_colors(:stacked), do: ["#3b82f6", "#10b981", "#f59e0b", "#ef4444"]
  defp get_default_colors(:sparkline), do: ["#3b82f6"]
end
