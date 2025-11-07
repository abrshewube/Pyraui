defmodule Pyraui.Components.Chart do
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
  attr :datasets, :list, default: nil, doc: "Multiple datasets for stacked charts"
  attr :curved, :boolean, default: false, doc: "Smooth curves for line/area"
  attr :fill_opacity, :float, default: 0.3, doc: "Fill opacity for area charts"
  attr :corner_radius, :integer, default: 4, doc: "Corner radius for bars"
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
      |> assign(:max_value, get_dataset_max(assigns))
      |> assign(:stroke_curve, chart_curve(assigns.curved))

    ~H"""
    <div class={["chart-container", @class]} {@rest}>
      <%= if @title do %>
        <h3 class="mb-4 text-lg font-semibold text-slate-900 dark:text-slate-200">{@title}</h3>
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

    assigns =
      assigns
      |> assign(:padding, padding)
      |> assign(:chart_height, chart_height)
      |> assign(:points, points)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <defs>
        <linearGradient id="line-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style="stop-color:#3b82f6;stop-opacity:0.3" />
          <stop offset="100%" style="stop-color:#3b82f6;stop-opacity:0" />
        </linearGradient>
      </defs>

      <g transform={"translate(#{@padding}, #{@padding})"}>
        <path
          d={build_path(@points, @stroke_curve)}
          fill="none"
          stroke="#3b82f6"
          stroke-width="2"
          stroke-linecap="round"
        />

        <polygon
          points={
            [
              Enum.map_join(@points, " ", fn {x, y} -> "#{x},#{y}" end),
              "#{List.last(@points) |> elem(0)},#{@chart_height}",
              "#{List.first(@points) |> elem(0)},#{@chart_height}"
            ]
            |> Enum.join(" ")
          }
          fill="url(#line-gradient)"
        />

        <%= for {x, y} <- @points do %>
          <circle cx={x} cy={y} r="3" fill="#3b82f6" />
        <% end %>
      </g>
    </svg>
    """
  end

  defp render_bar_chart(assigns) do
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    bar_width = div(chart_width, length(assigns.normalized_data))
    spacing = 6

    assigns =
      assigns
      |> assign(:padding, padding)
      |> assign(:chart_height, chart_height)
      |> assign(:bar_width, bar_width)
      |> assign(:spacing, spacing)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{@padding}, #{@padding})"}>
        <%= for {value, index} <- Enum.with_index(@normalized_data) do %>
          <% bar_height = value * @chart_height %>
          <% x = index * @bar_width + @spacing %>
          <% y = @chart_height - bar_height %>
          <rect
            x={x}
            y={y}
            width={@bar_width - @spacing * 2}
            height={bar_height}
            fill={Enum.at(@chart_colors, rem(index, length(@chart_colors)))}
            rx={@corner_radius}
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

    assigns =
      assigns
      |> assign(:center_x, center_x)
      |> assign(:center_y, center_y)
      |> assign(:radius, radius)
      |> assign(:angles, angles)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <%= for {start_angle, end_angle, index} <- @angles do %>
        <% path = create_pie_path(@center_x, @center_y, @radius, start_angle, end_angle) %>
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

    assigns =
      assigns
      |> assign(:center_x, center_x)
      |> assign(:center_y, center_y)
      |> assign(:outer_radius, outer_radius)
      |> assign(:inner_radius, inner_radius)
      |> assign(:angles, angles)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <%= for {start_angle, end_angle, index} <- @angles do %>
        <% path =
          create_donut_path(
            @center_x,
            @center_y,
            @outer_radius,
            @inner_radius,
            start_angle,
            end_angle
          ) %>
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

    assigns =
      assigns
      |> assign(:padding, padding)
      |> assign(:chart_height, chart_height)
      |> assign(:points, points)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <defs>
        <linearGradient id="area-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style={"stop-color:#3b82f6;stop-opacity:#{@fill_opacity}"} />
          <stop offset="100%" style="stop-color:#3b82f6;stop-opacity:0" />
        </linearGradient>
      </defs>

      <g transform={"translate(#{@padding}, #{@padding})"}>
        <polygon
          points={
            [
              Enum.map_join(@points, " ", fn {x, y} -> "#{x},#{y}" end),
              "#{List.last(@points) |> elem(0)},#{@chart_height}",
              "#{List.first(@points) |> elem(0)},#{@chart_height}"
            ]
            |> Enum.join(" ")
          }
          fill="url(#area-gradient)"
        />

        <path
          d={build_path(@points, @stroke_curve)}
          fill="none"
          stroke="#3b82f6"
          stroke-width="2"
          stroke-linecap="round"
        />
      </g>
    </svg>
    """
  end

  defp render_stacked_chart(%{datasets: nil} = assigns), do: render_bar_chart(assigns)

  defp render_stacked_chart(assigns) do
    datasets = assigns.datasets || []
    padding = 40
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    bar_width = div(chart_width, max(length(assigns.data), 1))
    spacing = 8

    segments = build_stacked_segments(assigns, datasets, bar_width, chart_height, spacing)

    assigns =
      assigns
      |> assign(:padding, padding)
      |> assign(:segments, segments)
      |> assign(:bar_width, bar_width)
      |> assign(:spacing, spacing)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{@padding}, #{@padding})"}>
        <%= for segment <- @segments do %>
          <rect
            x={segment.x}
            y={segment.y}
            width={@bar_width - @spacing * 2}
            height={segment.height}
            fill={segment.color}
            rx={@corner_radius}
          />
        <% end %>
      </g>
    </svg>
    """
  end

  defp render_sparkline_chart(assigns) do
    padding = 10
    chart_width = assigns.width - padding * 2
    chart_height = assigns.height - padding * 2
    points = calculate_line_points(assigns.normalized_data, chart_width, chart_height, padding)

    assigns =
      assigns
      |> assign(:padding, padding)
      |> assign(:points, points)

    ~H"""
    <svg width={@width} height={@height} class="chart-svg">
      <g transform={"translate(#{@padding}, #{@padding})"}>
        <path
          d={build_path(@points, :linear)}
          fill="none"
          stroke="#22c55e"
          stroke-width="2"
          stroke-linecap="round"
        />
      </g>
    </svg>
    """
  end

  defp build_stacked_segments(assigns, datasets, bar_width, chart_height, spacing) do
    Enum.with_index(assigns.data)
    |> Enum.flat_map(fn {_value, index} ->
      base_x = index * bar_width + spacing

      {segments, _} =
        Enum.with_index(datasets)
        |> Enum.reduce({[], 0}, fn {dataset, dataset_index}, {acc, cumulative_height} ->
          dataset_value = Enum.at(dataset[:values], index, 0)

          segment_height =
            if assigns.max_value == 0 do
              0
            else
              dataset_value / assigns.max_value * chart_height
            end

          y = chart_height - cumulative_height - segment_height
          color = Enum.at(dataset[:colors] || assigns.chart_colors, dataset_index, "#3b82f6")

          segment = %{x: base_x, y: y, height: segment_height, color: color}

          {[segment | acc], cumulative_height + segment_height}
        end)

      Enum.reverse(segments)
    end)
  end

  defp build_path([{x0, y0} | rest], :smooth) do
    rest
    |> Enum.reduce({"M#{x0},#{y0}", x0, y0}, fn {x1, y1}, {path, prev_x, prev_y} ->
      control_x = (prev_x + x1) / 2
      new_path = path <> " Q#{control_x},#{prev_y} #{x1},#{y1}"
      {new_path, x1, y1}
    end)
    |> elem(0)
  end

  defp build_path([{x0, y0} | _] = points, _linear) do
    "M#{x0},#{y0} " <> Enum.map_join(points, " ", fn {x, y} -> "L#{x},#{y}" end)
  end

  defp chart_curve(true), do: :smooth
  defp chart_curve(false), do: :linear

  defp get_dataset_max(%{type: :stacked, datasets: datasets, data: _data})
       when is_list(datasets) and datasets != [] do
    dataset_totals =
      datasets
      |> Enum.map(&Map.get(&1, :values, []))
      |> Enum.zip_with(&Enum.sum/1)

    get_max_value(dataset_totals)
  end

  defp get_dataset_max(assigns), do: get_max_value(assigns.data)

  defp get_default_colors(:pie),
    do: ["#6366f1", "#22d3ee", "#f97316", "#facc15", "#34d399", "#f87171"]

  defp get_default_colors(:donut),
    do: ["#6366f1", "#22d3ee", "#f97316", "#facc15", "#34d399", "#f87171"]

  defp get_default_colors(:bar), do: ["#6366f1", "#22d3ee", "#f97316", "#facc15"]
  defp get_default_colors(:line), do: ["#3b82f6"]
  defp get_default_colors(:area), do: ["#3b82f6"]
  defp get_default_colors(:sparkline), do: ["#22c55e"]

  defp get_default_colors(:stacked),
    do: ["#6366f1", "#22d3ee", "#f97316", "#facc15", "#34d399", "#f87171"]

  defp normalize_data(data) do
    max_value = get_max_value(data)

    Enum.map(data, fn value ->
      if max_value == 0, do: 0, else: value / max_value
    end)
  end

  defp get_max_value(data) do
    list = List.wrap(data)

    if list == [], do: 1, else: Enum.max(list)
  end

  defp calculate_line_points(normalized_data, width, height, _padding) do
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
end
