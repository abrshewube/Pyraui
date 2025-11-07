defmodule PyrauiWeb.DocsLive.GanttDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Gantt Chart</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Interactive Gantt chart for project timelines with drag, resize, and dependency visuals.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Project Roadmap</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm overflow-x-auto">
            <Pyraui.Components.Gantt.gantt
              id="gantt-demo"
              tasks={@demo_tasks}
              start_date={@demo_start_date}
              end_date={@demo_end_date}
              class="max-w-full"
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    tasks = [
      %{
        id: "task-1",
        name: "Kickoff",
        start_date: ~D[2024-01-02],
        end_date: ~D[2024-01-05],
        progress: 100
      },
      %{
        id: "task-2",
        name: "Design Sprint",
        start_date: ~D[2024-01-06],
        end_date: ~D[2024-01-12],
        dependencies: ["task-1"]
      }
    ]

    &lt;.gantt
      id="product-roadmap"
      tasks={@tasks}
      start_date={~D[2024-01-01]}
      end_date={~D[2024-01-31]}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Highlights</h2>
          <ul class="space-y-2 text-gray-700 list-disc list-inside">
            <li>Auto-calculated date range based on tasks with optional overrides.</li>
            <li>Drag and resize hooks emit events for task updates.</li>
            <li>Dependency lines with arrowheads for critical path visualization.</li>
            <li>Slot support for custom task labels and interactive row content.</li>
            <li>Configurable row and bar sizing for dense timelines.</li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
