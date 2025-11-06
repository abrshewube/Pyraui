defmodule Ashui.Components.Gantt do
  @moduledoc """
  Gantt Chart component for displaying project timelines with draggable tasks and dependencies.

  ## Examples

      <.gantt id="project-timeline" tasks={@tasks} />
      <.gantt id="project-timeline" tasks={@tasks} start_date={@start_date} end_date={@end_date} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the gantt chart"

  attr :tasks, :list,
    required: true,
    doc: "List of tasks with :id, :name, :start_date, :end_date, and optional :dependencies"

  attr :start_date, :any,
    default: nil,
    doc: "Chart start date (Date struct or ISO string, auto-calculated if nil)"

  attr :end_date, :any,
    default: nil,
    doc: "Chart end date (Date struct or ISO string, auto-calculated if nil)"

  attr :row_height, :integer, default: 40, doc: "Height of each task row in pixels"
  attr :bar_height, :integer, default: 24, doc: "Height of task bars in pixels"
  attr :allow_drag, :boolean, default: true, doc: "Allow dragging tasks to change dates"
  attr :allow_resize, :boolean, default: true, doc: "Allow resizing tasks"
  attr :show_dependencies, :boolean, default: true, doc: "Show dependency lines between tasks"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :task_label, doc: "Custom task label template"

  def gantt(assigns) do
    {start_date, end_date} =
      calculate_date_range(assigns.tasks, assigns.start_date, assigns.end_date)

    assigns =
      assigns
      |> assign(:calculated_start_date, start_date)
      |> assign(:calculated_end_date, end_date)
      |> assign(:day_count, Date.diff(end_date, start_date) + 1)

    ~H"""
    <div
      id={@id}
      class={["gantt-chart w-full", @class]}
      phx-hook="GanttHook"
      data-id={@id}
      data-start-date={format_date_for_js(@calculated_start_date)}
      data-end-date={format_date_for_js(@calculated_end_date)}
      data-row-height={@row_height}
      data-bar-height={@bar_height}
      data-allow-drag={@allow_drag}
      data-allow-resize={@allow_resize}
      data-show-dependencies={@show_dependencies}
      {@rest}
    >
      <!-- Header with dates -->
      <div class="gantt-header border-b border-gray-200 dark:border-gray-700 mb-2 overflow-x-auto">
        <div class="flex min-w-full">
          <!-- Task column header -->
          <div class="gantt-task-header flex-shrink-0 w-64 px-4 py-2 bg-gray-50 dark:bg-gray-800 border-r border-gray-200 dark:border-gray-700">
            <span class="text-sm font-semibold text-gray-700 dark:text-gray-300">Task</span>
          </div>
          <!-- Timeline header -->
          <div class="gantt-timeline-header flex-1 flex" style={"min-width: #{@day_count * 30}px"}>
            <%= for date <- date_range(@calculated_start_date, @calculated_end_date) do %>
              <div class="gantt-day-header flex-shrink-0 w-[30px] text-center border-r border-gray-200 dark:border-gray-700 px-1">
                <div class="text-xs text-gray-600 dark:text-gray-400">
                  {Calendar.strftime(date, "%d")}
                </div>

                <div class="text-xs text-gray-500 dark:text-gray-500">
                  {Calendar.strftime(date, "%a")}
                </div>
              </div>
            <% end %>
          </div>
        </div>
      </div>
      <!-- Gantt body -->
      <div class="gantt-body relative overflow-auto" style="max-height: 600px">
        <div class="gantt-tasks min-w-full">
          <%= for {task, index} <- Enum.with_index(@tasks) do %>
            {render_task_row(assigns, task, index)}
          <% end %>
        </div>
        <!-- SVG overlay for dependency lines -->
        <%= if @show_dependencies do %>
          <svg
            class="gantt-dependencies absolute top-0 left-0 pointer-events-none"
            style="width: 100%; height: 100%; z-index: 1"
          >
            <defs>
              <marker
                id="gantt-arrowhead"
                markerWidth="10"
                markerHeight="10"
                refX="9"
                refY="3"
                orient="auto"
              >
                <polygon points="0 0, 10 3, 0 6" fill="#94a3b8" />
              </marker>
            </defs>

            <%= for task <- @tasks do %>
              <%= if Map.get(task, :dependencies) && task.dependencies != [] do %>
                <%= for dep_id <- task.dependencies do %>
                  {render_dependency_line(
                    assigns,
                    task,
                    dep_id,
                    Enum.find_index(@tasks, &(&1.id == dep_id))
                  )}
                <% end %>
              <% end %>
            <% end %>
          </svg>
        <% end %>
      </div>
    </div>
    """
  end

  defp render_task_row(assigns, task, index) do
    task_id = Map.get(task, :id, "task-#{assigns.id}-#{index}")
    start_date = parse_date(Map.get(task, :start_date))
    end_date = parse_date(Map.get(task, :end_date))

    {left_offset, width} =
      calculate_bar_position(
        start_date,
        end_date,
        assigns.calculated_start_date,
        assigns.calculated_end_date
      )

    progress = Map.get(task, :progress, 0) |> min(100) |> max(0)
    color = Map.get(task, :color, "blue")

    has_task_label_slot = Map.has_key?(assigns, :task_label) and assigns.task_label != []

    assigns =
      assigns
      |> assign(:task_data, task)
      |> assign(:task_id, task_id)
      |> assign(:index, index)
      |> assign(:left_offset, left_offset)
      |> assign(:width, width)
      |> assign(:progress, progress)
      |> assign(:color, color)
      |> assign(:has_task_label_slot, has_task_label_slot)
      |> assign(:task_start_date, start_date)
      |> assign(:task_end_date, end_date)

    ~H"""
    <div
      class="gantt-task-row flex border-b border-gray-100 dark:border-gray-800 hover:bg-gray-50 dark:hover:bg-gray-800/50"
      style={"height: #{assigns.row_height}px"}
      data-task-id={@task_id}
    >
      <!-- Task label column -->
      <div class="gantt-task-label flex-shrink-0 w-64 px-4 py-2 bg-white dark:bg-gray-900 border-r border-gray-200 dark:border-gray-700 flex items-center">
        <%= if @has_task_label_slot do %>
          {render_slot(@task_label, @task_data)}
        <% else %>
          <span class="text-sm text-gray-900 dark:text-gray-100 truncate">
            {Map.get(@task_data, :name, "Untitled Task")}
          </span>
        <% end %>
      </div>
      <!-- Timeline column -->
      <div class="gantt-timeline flex-1 relative" style={"min-width: #{assigns.day_count * 30}px"}>
        <!-- Grid lines -->
        <div class="absolute inset-0 flex">
          <%= for _date <- date_range(assigns.calculated_start_date, assigns.calculated_end_date) do %>
            <div class="flex-shrink-0 w-[30px] border-r border-gray-100 dark:border-gray-800"></div>
          <% end %>
        </div>
        <!-- Task bar -->
        <%= if @left_offset >= 0 and @width > 0 do %>
          <div
            class={[
              "gantt-task-bar absolute rounded transition-all",
              "cursor-move hover:opacity-90",
              get_color_classes(@color)
            ]}
            style={
              "left: #{@left_offset * 30}px; width: #{@width * 30}px; top: #{(@row_height - @bar_height) / 2}px; height: #{@bar_height}px"
            }
            data-task-id={@task_id}
            data-start-date={format_date_for_js(@task_start_date)}
            data-end-date={format_date_for_js(@task_end_date)}
            phx-click="gantt-task-click"
            phx-value-task-id={@task_id}
          >
            <!-- Progress indicator -->
            <%= if @progress > 0 do %>
              <div
                class="gantt-task-progress h-full rounded-l bg-black/20 dark:bg-white/20"
                style={"width: #{@progress}%"}
              >
              </div>
            <% end %>
            <!-- Task name on bar (if space allows) -->
            <%= if @width > 2 do %>
              <div class="absolute inset-0 flex items-center px-2 text-xs text-white dark:text-gray-100 font-medium truncate">
                {Map.get(@task_data, :name, "")}
              </div>
            <% end %>
            <!-- Resize handles -->
            <%= if assigns.allow_resize do %>
              <div
                class="gantt-resize-handle-left absolute left-0 top-0 bottom-0 w-1 cursor-ew-resize hover:bg-white/50"
                data-handle="start"
              >
              </div>

              <div
                class="gantt-resize-handle-right absolute right-0 top-0 bottom-0 w-1 cursor-ew-resize hover:bg-white/50"
                data-handle="end"
              >
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp render_dependency_line(assigns, task, _dep_id, dep_index) do
    if dep_index != nil do
      task_index = Enum.find_index(assigns.tasks, &(&1.id == task.id))

      if task_index != nil do
        task_start = parse_date(Map.get(task, :start_date))
        dep_end = parse_date(Enum.at(assigns.tasks, dep_index) |> Map.get(:end_date))

        {task_left, _} =
          calculate_bar_position(
            task_start,
            task_start,
            assigns.calculated_start_date,
            assigns.calculated_end_date
          )

        {dep_left, dep_width} =
          calculate_bar_position(
            dep_end,
            dep_end,
            assigns.calculated_start_date,
            assigns.calculated_end_date
          )

        task_y = task_index * assigns.row_height + assigns.row_height / 2
        dep_y = dep_index * assigns.row_height + assigns.row_height / 2
        # 64px for task label column
        dep_x = (dep_left + dep_width) * 30 + 64
        task_x = task_left * 30 + 64

        assigns =
          assigns
          |> assign(:dependency_dep_x, dep_x)
          |> assign(:dependency_dep_y, dep_y)
          |> assign(:dependency_task_x, task_x)
          |> assign(:dependency_task_y, task_y)

        ~H"""
        <line
          x1={@dependency_dep_x}
          y1={@dependency_dep_y}
          x2={@dependency_task_x}
          y2={@dependency_task_y}
          stroke="#94a3b8"
          stroke-width="2"
          marker-end="url(#gantt-arrowhead)"
          class="gantt-dependency-line"
        />
        """
      end
    end
  end

  defp calculate_date_range(tasks, start_date, end_date) do
    parsed_start = if start_date, do: parse_date(start_date), else: nil
    parsed_end = if end_date, do: parse_date(end_date), else: nil

    case {parsed_start, parsed_end} do
      {nil, nil} ->
        dates =
          Enum.flat_map(tasks, fn task ->
            [parse_date(Map.get(task, :start_date)), parse_date(Map.get(task, :end_date))]
          end)
          |> Enum.filter(&(&1 != nil))

        if dates == [] do
          today = Date.utc_today()
          {today, Date.add(today, 30)}
        else
          {Enum.min(dates), Enum.max(dates)}
        end

      {nil, end_d} ->
        dates =
          Enum.map(tasks, &parse_date(Map.get(&1, :start_date)))
          |> Enum.filter(&(&1 != nil))

        start_d = if dates == [], do: Date.utc_today(), else: Enum.min(dates)
        {start_d, end_d}

      {start_d, nil} ->
        dates =
          Enum.map(tasks, &parse_date(Map.get(&1, :end_date)))
          |> Enum.filter(&(&1 != nil))

        end_d = if dates == [], do: Date.add(start_d, 30), else: Enum.max(dates)
        {start_d, end_d}

      {start_d, end_d} ->
        {start_d, end_d}
    end
  end

  defp calculate_bar_position(task_start, task_end, chart_start, chart_end) do
    cond do
      task_start == nil or task_end == nil ->
        {0, 0}

      Date.compare(task_start, chart_end) == :gt or Date.compare(task_end, chart_start) == :lt ->
        {0, 0}

      true ->
        start_offset = max(0, Date.diff(task_start, chart_start))
        end_offset = Date.diff(task_end, chart_start)
        width = end_offset - start_offset + 1
        {start_offset, max(1, width)}
    end
  end

  defp date_range(start_date, end_date) do
    start_date
    |> Stream.iterate(&Date.add(&1, 1))
    |> Enum.take_while(&(Date.compare(&1, end_date) != :gt))
  end

  defp parse_date(nil), do: nil
  defp parse_date(%Date{} = date), do: date
  defp parse_date(%DateTime{} = dt), do: DateTime.to_date(dt)
  defp parse_date(%NaiveDateTime{} = dt), do: NaiveDateTime.to_date(dt)

  defp parse_date(date_string) when is_binary(date_string) do
    case Date.from_iso8601(date_string) do
      {:ok, date} -> date
      _ -> nil
    end
  end

  defp parse_date(_), do: nil

  defp format_date_for_js(nil), do: ""
  defp format_date_for_js(%Date{} = date), do: Date.to_iso8601(date)
  defp format_date_for_js(_), do: ""

  defp get_color_classes(color) do
    case color do
      "blue" -> "bg-blue-500 dark:bg-blue-600"
      "green" -> "bg-green-500 dark:bg-green-600"
      "red" -> "bg-red-500 dark:bg-red-600"
      "yellow" -> "bg-yellow-500 dark:bg-yellow-600"
      "orange" -> "bg-orange-500 dark:bg-orange-600"
      "purple" -> "bg-purple-500 dark:bg-purple-600"
      "pink" -> "bg-pink-500 dark:bg-pink-600"
      "indigo" -> "bg-indigo-500 dark:bg-indigo-600"
      "gray" -> "bg-gray-500 dark:bg-gray-600"
      _ -> "bg-blue-500 dark:bg-blue-600"
    end
  end
end
