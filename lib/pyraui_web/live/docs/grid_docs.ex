defmodule PyrauiWeb.DocsLive.GridDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Grid</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Grid layout component for responsive layouts using CSS Grid.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Grid.grid cols={3} gap={4}>
              <div class="bg-blue-100 p-4 rounded text-center">Item 1</div>

              <div class="bg-blue-100 p-4 rounded text-center">Item 2</div>

              <div class="bg-blue-100 p-4 rounded text-center">Item 3</div>

              <div class="bg-blue-100 p-4 rounded text-center">Item 4</div>

              <div class="bg-blue-100 p-4 rounded text-center">Item 5</div>

              <div class="bg-blue-100 p-4 rounded text-center">Item 6</div>
            </Pyraui.Components.Grid.grid>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.grid cols={3} gap={4}&gt;
      &lt;div&gt;Item 1&lt;/div&gt;
      &lt;div&gt;Item 2&lt;/div&gt;
      &lt;div&gt;Item 3&lt;/div&gt;
    &lt;/.grid&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Responsive Grid</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Grid.grid cols={1} cols_md={2} cols_lg={4} gap={4}>
              <div class="bg-green-100 p-4 rounded text-center">Item 1</div>

              <div class="bg-green-100 p-4 rounded text-center">Item 2</div>

              <div class="bg-green-100 p-4 rounded text-center">Item 3</div>

              <div class="bg-green-100 p-4 rounded text-center">Item 4</div>
            </Pyraui.Components.Grid.grid>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.grid cols={1} cols_md={2} cols_lg={4} gap={4}&gt;
      &lt;div&gt;Item 1&lt;/div&gt;
      &lt;div&gt;Item 2&lt;/div&gt;
      &lt;div&gt;Item 3&lt;/div&gt;
      &lt;div&gt;Item 4&lt;/div&gt;
    &lt;/.grid&gt;
            </code></pre>
          </div>

          <p class="text-gray-700 mt-4 text-sm">
            This grid will show 1 column on mobile, 2 columns on medium screens, and 4 columns on large screens.
          </p>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Cards</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Grid.grid cols={1} cols_md={2} gap={6}>
              <Pyraui.Components.Card.card>
                <h3 class="text-lg font-semibold mb-2">Card 1</h3>

                <p class="text-gray-600">Content for card 1</p>
              </Pyraui.Components.Card.card>

              <Pyraui.Components.Card.card>
                <h3 class="text-lg font-semibold mb-2">Card 2</h3>

                <p class="text-gray-600">Content for card 2</p>
              </Pyraui.Components.Card.card>
            </Pyraui.Components.Grid.grid>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.grid cols={1} cols_md={2} gap={6}&gt;
      &lt;.card&gt;
        &lt;h3&gt;Card 1&lt;/h3&gt;
        &lt;p&gt;Content&lt;/p&gt;
      &lt;/.card&gt;
      &lt;.card&gt;
        &lt;h3&gt;Card 2&lt;/h3&gt;
        &lt;p&gt;Content&lt;/p&gt;
      &lt;/.card&gt;
    &lt;/.grid&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">cols</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">1</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Number of columns (base/default)</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    cols_sm
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Number of columns on small screens (≥640px)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    cols_md
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Number of columns on medium screens (≥768px)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    cols_lg
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Number of columns on large screens (≥1024px)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    cols_xl
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Number of columns on extra large screens (≥1280px)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">gap</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">4</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Gap between grid items (Tailwind gap value: 0-12)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
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
