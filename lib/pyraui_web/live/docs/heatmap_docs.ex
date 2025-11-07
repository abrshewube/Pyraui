defmodule PyrauiWeb.DocsLive.HeatmapDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Heatmap</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Heatmap component for displaying data density and user interactions using color intensity visualization.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Heatmap</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Heatmap.heatmap data={@sample_data} />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.heatmap data={%{"2024-01-01" => 5, "2024-01-02" => 10, "2024-01-03" => 15}} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Color Schemes</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm space-y-6">
            <div>
              <p class="text-sm text-gray-600 mb-2">Blue (default):</p>
              <Pyraui.Components.Heatmap.heatmap data={@sample_data} color_scheme={:blue} />
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Green:</p>
              <Pyraui.Components.Heatmap.heatmap data={@sample_data} color_scheme={:green} />
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Red:</p>
              <Pyraui.Components.Heatmap.heatmap data={@sample_data} color_scheme={:red} />
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Purple:</p>
              <Pyraui.Components.Heatmap.heatmap data={@sample_data} color_scheme={:purple} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.heatmap data={heatmap_data} color_scheme={:blue} /&gt;
              &lt;.heatmap data={heatmap_data} color_scheme={:green} /&gt;
              &lt;.heatmap data={heatmap_data} color_scheme={:red} /&gt;
              &lt;.heatmap data={heatmap_data} color_scheme={:purple} /&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">data</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">map</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Map of keys (dates/labels) to numeric values
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    color_scheme
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :blue | :green | :red | :purple
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:blue</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Color scheme for intensity visualization
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
end
