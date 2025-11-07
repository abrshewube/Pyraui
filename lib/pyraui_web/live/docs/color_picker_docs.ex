defmodule PyrauiWeb.DocsLive.ColorPickerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Color Picker</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Color picker / palette selector component for design dashboards or admin apps.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.ColorPicker.color_picker id="color-demo" value="#3b82f6" />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.color_picker id="primary-color" value="#3b82f6" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Palette</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.ColorPicker.color_picker
                id="color-palette-demo"
                value="#000000"
                show_palette={true}
              />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.color_picker id="theme-color" value="#000000" show_palette={true} /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
