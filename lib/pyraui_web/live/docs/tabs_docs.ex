defmodule PyrauiWeb.DocsLive.TabsDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Tabs</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Tabs component for navigation between different content sections.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Tabs.tabs>
              <:tab id="tab-1" label="Tab 1" active={true}>Content for tab 1</:tab>

              <:tab id="tab-2" label="Tab 2" active={false}>Content for tab 2</:tab>

              <:tab id="tab-3" label="Tab 3" active={false}>Content for tab 3</:tab>
            </Pyraui.Components.Tabs.tabs>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.tabs&gt;
      &lt;:tab id="tab-1" label="Tab 1" active={true}&gt;Content 1&lt;/:tab&gt;
      &lt;:tab id="tab-2" label="Tab 2"&gt;Content 2&lt;/:tab&gt;
    &lt;/.tabs&gt;
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

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"tabs"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Unique identifier for tabs container
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    tab (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">required</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Tab items with id, label, and active attributes
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
