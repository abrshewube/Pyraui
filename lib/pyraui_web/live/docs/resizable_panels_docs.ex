defmodule PyrauiWeb.DocsLive.ResizablePanelsDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Resizable Panels</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Resizable panels component for split layouts like IDEs or dashboards. Users can drag to resize panels horizontally or vertically.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Horizontal Panels</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.ResizablePanels.resizable_panels
              id="docs-panels-1"
              orientation={:horizontal}
            >
              <:panel min_width="150px" default_width="300px">
                <div class="p-4 bg-blue-50 h-full">
                  <h3 class="font-semibold mb-2">Left Panel</h3>

                  <p class="text-sm text-gray-600">Drag the divider to resize</p>
                </div>
              </:panel>

              <:panel>
                <div class="p-4 bg-green-50 h-full">
                  <h3 class="font-semibold mb-2">Right Panel</h3>

                  <p class="text-sm text-gray-600">Resizable content area</p>
                </div>
              </:panel>
            </Pyraui.Components.ResizablePanels.resizable_panels>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.resizable_panels id="split-layout" orientation={:horizontal}&gt;
                &lt;:panel min_width="200px" default_width="300px"&gt;
                  &lt;div class="p-4"&gt;Left Panel&lt;/div&gt;
                &lt;/:panel&gt;
                &lt;:panel&gt;
                  &lt;div class="p-4"&gt;Right Panel&lt;/div&gt;
                &lt;/:panel&gt;
              &lt;/.resizable_panels&gt;
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

                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for the panels</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    orientation
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :horizontal | :vertical
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:horizontal</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Layout orientation</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    panel.min_width
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"100px"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Minimum panel width</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    panel.default_width
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Initial panel width</td>
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
