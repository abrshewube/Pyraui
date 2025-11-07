defmodule PyrauiWeb.DocsLive.BreadcrumbsDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Breadcrumbs</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Breadcrumb navigation component for showing page hierarchy.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Breadcrumbs.breadcrumbs>
              <:item href="/">Home</:item>

              <:item href="/products">Products</:item>

              <:item active={true}>Current Page</:item>
            </Pyraui.Components.Breadcrumbs.breadcrumbs>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.breadcrumbs&gt;
      &lt;:item href="/"&gt;Home&lt;/:item&gt;
      &lt;:item href="/products"&gt;Products&lt;/:item&gt;
      &lt;:item active={true}&gt;Current Page&lt;/:item&gt;
    &lt;/.breadcrumbs&gt;
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
                    item (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">required</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Breadcrumb items with href and optional active attribute
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
