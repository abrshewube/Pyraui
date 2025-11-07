defmodule PyrauiWeb.DocsLive.ConnectionsWidgetDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Connections Widget</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Social-style connections list with avatars, status indicators, mutual counts, and custom actions.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Followers Panel</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.ConnectionsWidget.connections_widget
              connections={@demo_connections}
              current_user={@demo_current_user}
              type={:followers}
              max_display={3}
            >
              <:action>
                <button
                  type="button"
                  class="px-4 py-2 text-sm font-medium text-blue-600 hover:text-blue-800 hover:bg-blue-50 rounded-lg transition-colors"
                >
                  View All
                </button>
              </:action>
            </Pyraui.Components.ConnectionsWidget.connections_widget>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.connections_widget
      connections={@connections}
      current_user={@current_user_id}
      type={:followers}
      max_display={5}
    &gt;
      &lt;:action&gt;
        &lt;button class="btn btn-secondary"&gt;View All&lt;/button&gt;
      &lt;/:action&gt;
    &lt;/.connections_widget&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Highlights</h2>
          <ul class="space-y-2 text-gray-700 list-disc list-inside">
            <li>
              Supports followers, following, or connections context via the
              <code class="px-1 py-0.5 bg-gray-200 rounded text-xs">type</code>
              attribute.
            </li>
            <li>Built-in mutual connection counts and online indicators.</li>
            <li>Optional custom action slot for CTA buttons or dropdowns.</li>
            <li>Responsive layout with graceful empty states when no data is available.</li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
