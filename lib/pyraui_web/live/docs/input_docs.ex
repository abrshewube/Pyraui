defmodule PyrauiWeb.DocsLive.InputDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Input</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Input field component with validation states and helper text.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-4">
              <Pyraui.Components.Input.input type="text" label="Name" placeholder="Enter your name" />
              <Pyraui.Components.Input.input
                type="email"
                label="Email"
                helper="We'll never share your email"
              />
              <Pyraui.Components.Input.input
                type="password"
                label="Password"
                error="Password is required"
              />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.input type="text" label="Name" placeholder="Enter your name" /&gt;
    &lt;.input type="email" label="Email" helper="We'll never share your email" /&gt;
    &lt;.input type="password" label="Password" error="Password is required" /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
