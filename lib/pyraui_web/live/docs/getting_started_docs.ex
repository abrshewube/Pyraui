defmodule PyrauiWeb.DocsLive.GettingStartedDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Getting Started</h1>

      <p class="text-xl text-gray-700 mb-8">
        PyraUI is a modular, reusable UI library for Phoenix LiveView applications.
      </p>

      <div class="space-y-6">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Features</h2>

          <ul class="space-y-2 text-gray-700 list-disc list-inside">
            <li>✅ LiveView-first: Components work natively in .heex templates</li>

            <li>✅ Composable & Modular: Each component is independent and reusable</li>

            <li>✅ Minimal JavaScript: Reactive behavior handled by Phoenix assigns</li>

            <li>✅ Theme-ready: Light/dark mode support</li>

            <li>✅ Developer-friendly: Semantic naming, minimal boilerplate</li>
          </ul>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Quick Example</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
            &lt;.button variant={:primary}&gt;Click me&lt;/.button&gt;
            &lt;.input type="text" label="Name" /&gt;
            &lt;.alert variant={:success}&gt;Success!&lt;/.alert&gt;
          </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
