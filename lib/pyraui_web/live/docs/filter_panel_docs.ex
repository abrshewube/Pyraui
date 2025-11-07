defmodule PyrauiWeb.DocsLive.FilterPanelDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Filter Panel</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Filter panel component for faceted search and real-time filtering of data tables with collapsible sections.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Filter Panel</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.FilterPanel.filter_panel id="docs-filter-1" title="Product Filters">
              <:filter label="Category" field="category" type={:checkbox}></:filter>
              <:option field="category" value="electronics" label="Electronics" count={42} />
              <:option field="category" value="clothing" label="Clothing" count={28} />
              <:option field="category" value="books" label="Books" count={15} />
              <:filter label="Price Range" field="price" type={:radio}></:filter>
              <:option field="price" value="0-50" label="$0 - $50" />
              <:option field="price" value="50-100" label="$50 - $100" />
              <:option field="price" value="100+" label="$100+" />
            </Pyraui.Components.FilterPanel.filter_panel>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.filter_panel id="product-filters"&gt;
                &lt;:filter label="Category" field="category"&gt;
                &lt;/:filter&gt;
                &lt;:option field="category" value="electronics" label="Electronics" count={42} /&gt;
                &lt;:option field="category" value="clothing" label="Clothing" count={28} /&gt;
                &lt;:filter label="Price Range" field="price" type={:radio}&gt;
                &lt;/:filter&gt;
                &lt;:option field="price" value="0-50" label="$0 - $50" /&gt;
              &lt;/.filter_panel&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props</h2>

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

                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for the filter panel</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">title</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"Filters"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Panel title</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    collapsible
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Allow collapsing the panel</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    filter.type
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :checkbox | :radio | :range
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:checkbox</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Filter input type</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
