defmodule PyrauiWeb.DocsLive.KanbanDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Kanban Board</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Kanban / Task Board component with draggable columns and cards for project management apps.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm overflow-x-auto">
            <Pyraui.Components.Kanban.kanban id="kanban-demo" columns={@demo_columns} />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    tasks = [
      %{
        id: "task-1",
        name: "Project Planning",
        start_date: ~D[2024-01-01],
        end_date: ~D[2024-01-05],
        progress: 30
      }
    ]

    &lt;.gantt id="project-timeline" tasks={@tasks} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Custom Date Range</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.gantt
      id="project-timeline"
      tasks={@tasks}
      start_date={~D[2024-01-01]}
      end_date={~D[2024-12-31]}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Features</h2>

          <ul class="list-disc list-inside space-y-2 text-gray-700">
            <li>Draggable tasks to adjust dates</li>

            <li>Resizable task bars</li>

            <li>Dependency lines between tasks</li>

            <li>Progress indicators</li>

            <li>Customizable colors and styling</li>

            <li>Auto-calculated date ranges</li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
