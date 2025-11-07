defmodule PyrauiWeb.DocsLive.InstallationDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Installation</h1>

      <div class="space-y-6">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Add to mix.exs</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
            def deps do
              [
                {:pyraui, path: "../pyraui"}
              ]
            end
          </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Import Components</h2>

          <p class="text-gray-700 mb-4">
            In your <code class="bg-gray-200 px-1 rounded text-gray-900">lib/your_app_web.ex</code>
            file, add imports:
          </p>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
            import Pyraui.Components.Button
            import Pyraui.Components.Input
            import Pyraui.Components.Alert
            # ... more components
          </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
