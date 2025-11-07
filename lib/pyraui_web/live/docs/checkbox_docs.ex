defmodule PyrauiWeb.DocsLive.CheckboxDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Checkbox</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">Checkbox component with label and validation support.</p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-4">
              <Pyraui.Components.Checkbox.checkbox label="Accept terms and conditions" />
              <Pyraui.Components.Checkbox.checkbox label="Subscribe to newsletter" checked={true} />
              <Pyraui.Components.Checkbox.checkbox label="Required field" required={true} />
              <Pyraui.Components.Checkbox.checkbox label="Disabled checkbox" disabled={true} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.checkbox label="Accept terms" /&gt;
    &lt;.checkbox label="Subscribe" checked={true} /&gt;
    &lt;.checkbox label="Required" required={true} /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
