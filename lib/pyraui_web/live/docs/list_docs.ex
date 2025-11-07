defmodule PyrauiWeb.DocsLive.ListDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">List</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Data list component for displaying structured information with titles and content.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item title="Name">John Doe</:item>

              <:item title="Email">john@example.com</:item>

              <:item title="Role">Administrator</:item>

              <:item title="Status">Active</:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item title="Name"&gt;John Doe&lt;/:item&gt;
      &lt;:item title="Email"&gt;john@example.com&lt;/:item&gt;
      &lt;:item title="Role"&gt;Administrator&lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Dynamic Content</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item title="Post Title">Getting Started with Phoenix LiveView</:item>

              <:item title="Views">1,234</:item>

              <:item title="Published">January 15, 2024</:item>

              <:item title="Author">Jane Smith</:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item title="Post Title"&gt;{@post.title}&lt;/:item&gt;
      &lt;:item title="Views"&gt;{@post.views}&lt;/:item&gt;
      &lt;:item title="Published"&gt;{@post.published_at}&lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Badges</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item title="Status">
                <Pyraui.Components.Badge.badge variant={:success}>Active</Pyraui.Components.Badge.badge>
              </:item>

              <:item title="Priority">
                <Pyraui.Components.Badge.badge variant={:warning}>High</Pyraui.Components.Badge.badge>
              </:item>

              <:item title="Category">
                <Pyraui.Components.Badge.badge variant={:info}>Feature</Pyraui.Components.Badge.badge>
              </:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item title="Status"&gt;
        &lt;.badge variant={:success}&gt;Active&lt;/.badge&gt;
      &lt;/:item&gt;
      &lt;:item title="Priority"&gt;
        &lt;.badge variant={:warning}&gt;High&lt;/.badge&gt;
      &lt;/:item&gt;
    &lt;/.list&gt;
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
                    List items. Each item accepts:
                    <ul class="list-disc list-inside mt-1 space-y-1">
                      <li>
                        <code class="bg-gray-100 px-1 rounded">title</code>
                        - Title/label for the item (required)
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
