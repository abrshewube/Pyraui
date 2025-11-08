defmodule PyrauiWeb.DocsLive.UsageDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Usage</h1>
      
      <div class="space-y-6">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>
          
          <p class="text-gray-700 mb-4">Once imported, use components in your LiveView templates:</p>
          
          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
            defmodule MyAppWeb.UserLive do
              use MyAppWeb, :live_view

              def render(assigns) do
                ~H&quot;&quot;&quot;
                &lt;.button variant={:primary} phx-click=&quot;save&quot;&gt;Save&lt;/.button&gt;
                &lt;.input type=&quot;text&quot; label=&quot;Name&quot; field={@form[:name]} /&gt;
                &quot;&quot;&quot;
              end
            end
          </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
