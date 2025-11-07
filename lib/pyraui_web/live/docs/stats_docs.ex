defmodule PyrauiWeb.DocsLive.StatsDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Stats</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Stats component for displaying statistics and metrics in a clean, organized layout.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Stats.stats>
              <:stat title="Total Users" value="1,234" desc="21% more than last month" />
              <:stat title="Revenue" value="$45,678" desc="12% increase" />
              <:stat title="Orders" value="567" desc="8% decrease" />
            </Pyraui.Components.Stats.stats>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.stats&gt;
      &lt;:stat title="Total Users" value="1,234" desc="21% more than last month" /&gt;
      &lt;:stat title="Revenue" value="$45,678" desc="12% increase" /&gt;
      &lt;:stat title="Orders" value="567" desc="8% decrease" /&gt;
    &lt;/.stats&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Vertical Layout</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Stats.stats horizontal={false}>
              <:stat title="Page Views" value="89,400" desc="21% more than last month" />
              <:stat title="Unique Visitors" value="12,345" desc="5% increase" />
            </Pyraui.Components.Stats.stats>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.stats horizontal={false}&gt;
      &lt;:stat title="Page Views" value="89,400" desc="21% more than last month" /&gt;
      &lt;:stat title="Unique Visitors" value="12,345" desc="5% increase" /&gt;
    &lt;/.stats&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Dynamic Content</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Stats.stats>
              <:stat title="Active Users" value="2,456" desc="Last 30 days" />
              <:stat title="Total Sales" value="$123,456" desc="This month" />
            </Pyraui.Components.Stats.stats>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.stats&gt;
      &lt;:stat title="Active Users" value={@active_users} desc="Last 30 days" /&gt;
      &lt;:stat title="Total Sales" value={@total_sales} desc="This month" /&gt;
    &lt;/.stats&gt;
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
                    horizontal
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Layout stats horizontally or vertically
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    stat (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">required</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Stat items. Each stat accepts:
                    <ul class="list-disc list-inside mt-1 space-y-1">
                      <li><code class="bg-gray-100 px-1 rounded">title</code> - Stat title/label</li>

                      <li><code class="bg-gray-100 px-1 rounded">value</code> - Main stat value</li>

                      <li>
                        <code class="bg-gray-100 px-1 rounded">desc</code>
                        - Description or change indicator
                      </li>
                    </ul>
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
