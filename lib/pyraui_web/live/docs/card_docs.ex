defmodule PyrauiWeb.DocsLive.CardDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Card</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Card component for content containers with customizable padding and shadows.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Pyraui.Components.Card.card>
                <h3 class="text-lg font-semibold mb-2">Default Card</h3>

                <p class="text-gray-600">This card has default padding and shadow.</p>
              </Pyraui.Components.Card.card>

              <Pyraui.Components.Card.card shadow={:lg} padded={false}>
                <div class="p-6">
                  <h3 class="text-lg font-semibold mb-2">No Padding</h3>

                  <p class="text-gray-600">Custom padding with larger shadow.</p>
                </div>
              </Pyraui.Components.Card.card>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.card&gt;
      &lt;h3&gt;Card Title&lt;/h3&gt;
      &lt;p&gt;Card content&lt;/p&gt;
    &lt;/.card&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    padded
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Add padding to card</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    shadow
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :none | :sm | :md | :lg | :xl
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Shadow size</td>
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
