defmodule PyrauiWeb.DocsLive.LiveDataTableDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Live Data Table</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Live Data Table component with virtual scrolling for handling huge datasets efficiently. Supports PubSub updates, sorting, filtering, and row selection.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.LiveDataTable.live_data_table
              id="table-demo"
              rows={@demo_rows}
              columns={@demo_columns}
              row_height={50}
              visible_rows={10}
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    columns = [
      %{key: "id", label: "ID", sortable: true},
      %{key: "name", label: "Name", sortable: true},
      %{key: "email", label: "Email", sortable: true}
    ]

    &lt;.live_data_table
      id="users-table"
      rows={@users}
      columns={@columns}
      row_height={50}
      visible_rows={10}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Row Selection</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.live_data_table
      id="users-table"
      rows={@users}
      columns={@columns}
      enable_selection={true}
      selected_rows={@selected_rows}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Features</h2>

          <ul class="list-disc list-inside space-y-2 text-gray-700">
            <li>Virtual scrolling for huge datasets (10,000+ rows)</li>

            <li>Column sorting (ascending/descending)</li>

            <li>Real-time filtering/search</li>

            <li>Row selection (single or multiple)</li>

            <li>PubSub integration for live updates</li>

            <li>Customizable row and column rendering</li>

            <li>Responsive and accessible</li>
          </ul>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Event Handlers</h2>

          <p class="text-gray-700 mb-4">
            The component dispatches the following events to your LiveView:
          </p>

          <ul class="list-disc list-inside space-y-2 text-gray-700">
            <li>
              <code class="bg-gray-200 dark:bg-gray-700 px-2 py-1 rounded">filter-table</code>
              - When filter value changes
            </li>

            <li>
              <code class="bg-gray-200 dark:bg-gray-700 px-2 py-1 rounded">sort-column</code>
              - When column header is clicked
            </li>

            <li>
              <code class="bg-gray-200 dark:bg-gray-700 px-2 py-1 rounded">toggle-row-selection</code>
              - When row checkbox is toggled
            </li>

            <li>
              <code class="bg-gray-200 dark:bg-gray-700 px-2 py-1 rounded">select-all-rows</code>
              - When header checkbox is clicked
            </li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
