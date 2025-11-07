defmodule PyrauiWeb.DocsLive.SelectDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Select</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Select dropdown component with options and validation states.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-4">
              <Pyraui.Components.Select.select label="Country">
                <option value="">Select a country</option>

                <option value="us">United States</option>

                <option value="uk">United Kingdom</option>

                <option value="ca">Canada</option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select label="Status" helper="Choose your status">
                <option value="active">Active</option>

                <option value="inactive">Inactive</option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select label="Error State" error="This field is required">
                <option value="">Select an option</option>
              </Pyraui.Components.Select.select>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.select label="Country"&gt;
      &lt;option value=""&gt;Select a country&lt;/option&gt;
      &lt;option value="us"&gt;United States&lt;/option&gt;
      &lt;option value="uk"&gt;United Kingdom&lt;/option&gt;
    &lt;/.select&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
