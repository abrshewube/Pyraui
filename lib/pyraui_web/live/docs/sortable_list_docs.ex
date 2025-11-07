defmodule PyrauiWeb.DocsLive.SortableListDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    demo_items = demo_items()

    assigns =
      assigns
      |> assign(:sortable_items, Map.get(assigns, :"docs-sortable-1_items", demo_items))

    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <h1 class="text-4xl font-bold">Sortable List</h1>
          <p class="text-lg text-slate-600">
            Drag-and-drop list with LiveView reordering, smooth hover states, and instant persistence.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_70px_-45px_rgba(15,23,42,0.35)] space-y-6">
          <div class="flex flex-col gap-6 lg:flex-row lg:items-start">
            <div class="flex-1 space-y-4">
              <h2 class="text-2xl font-semibold">Basic Sortable List</h2>
              <p class="text-sm text-slate-600">
                Grab the handle on the right to reorder feature requests. LiveView receives the new order and updates the data model.
              </p>
              <div class="rounded-2xl border border-slate-200 bg-slate-50 p-6">
                <Pyraui.Components.SortableList.sortable_list
                  id="docs-sortable-1"
                  items={@sortable_items}
                  class="bg-transparent"
                >
                  <:item :let={item}>
                    <div class="flex items-center justify-between gap-6 rounded-xl border border-transparent bg-white px-4 py-3 text-sm shadow-sm transition hover:border-blue-200 hover:bg-blue-50">
                      <div>
                        <p class="font-semibold text-slate-900">{item.title}</p>
                        <p class="text-xs text-slate-500">{item.description}</p>
                      </div>
                      <span class="inline-flex h-9 w-9 items-center justify-center rounded-xl border border-slate-200 bg-white text-slate-400 transition hover:text-slate-600">
                        <.icon name="hero-bars-3" class="h-4 w-4" />
                      </span>
                    </div>
                  </:item>
                </Pyraui.Components.SortableList.sortable_list>
              </div>
            </div>

            <div class="w-full max-w-xs space-y-4 rounded-2xl border border-slate-200 bg-slate-50 p-5">
              <h3 class="text-sm font-semibold text-slate-700">Current order</h3>
              <ol class="space-y-2 text-xs text-slate-600">
                <%= for {item, index} <- Enum.with_index(@sortable_items, 1) do %>
                  <li class="flex items-center gap-2">
                    <span class="inline-flex h-6 w-6 items-center justify-center rounded-full bg-blue-100 text-xs font-semibold text-blue-600">
                      {index}
                    </span>
                    <span>{item.title}</span>
                  </li>
                <% end %>
              </ol>
            </div>
          </div>

          <div class="bg-slate-900 text-slate-100">
            <pre class="overflow-x-auto p-6 text-xs leading-relaxed"><code phx-no-curly-interpolation>
              &lt;.sortable_list id="todo-list" items={@todos}&gt;
                &lt;:item :let={todo}&gt;
                  &lt;div class="flex items-center justify-between rounded-lg border border-transparent bg-white px-4 py-3 shadow-sm hover:border-blue-200 hover:bg-blue-50"&gt;
                    &lt;p class="font-semibold text-slate-900"&gt;&lt;%= todo.title %&gt;&lt;/p&gt;
                    &lt;.icon name="hero-bars-3" class="h-4 w-4 text-slate-400" /&gt;
                  &lt;/div&gt;
                &lt;/:item&gt;
              &lt;/.sortable_list&gt;
            </code></pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_70px_-45px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Props</h2>
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Prop
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Type
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Default
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Description
                  </th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">id</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for the sortable list</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">items</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">list</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>
                  <td class="px-6 py-4 text-sm text-gray-700">
                    Collection of items to render and reorder
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    item_id
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">atom</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:id</td>
                  <td class="px-6 py-4 text-sm text-gray-700">
                    Key used to identify each item for drag & drop
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp demo_items do
    [
      %{
        id: "priority-roadmap",
        title: "Prioritized roadmap",
        description: "Reorder launch milestones and share with leadership."
      },
      %{
        id: "segment-handoff",
        title: "Segment handoff",
        description: "Drag customers into success pods for automated rituals."
      },
      %{
        id: "design-review",
        title: "Design QA checklist",
        description: "Guarantee every ship hits the visual + UX spec."
      },
      %{
        id: "founder-updates",
        title: "Founder update queue",
        description: "Keep exec updates crisp with drag-and-drop talking points."
      }
    ]
  end
end
