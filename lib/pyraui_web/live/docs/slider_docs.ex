defmodule PyrauiWeb.DocsLive.SliderDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Slider</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Slider component for selecting a numeric value within a range with visual feedback.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Slider</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-6">
              <Pyraui.Components.Slider.slider label="Volume" value={50} />
              <Pyraui.Components.Slider.slider label="Brightness" value={75} />
              <Pyraui.Components.Slider.slider label="Opacity" value={25} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.slider label="Volume" value={50} /&gt;
              &lt;.slider label="Brightness" value={75} /&gt;
              &lt;.slider label="Opacity" value={25} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Range</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-6">
              <Pyraui.Components.Slider.slider
                label="Temperature (°C)"
                value={20}
                min={-10}
                max={40}
              />
              <Pyraui.Components.Slider.slider
                label="Price Range ($)"
                value={500}
                min={0}
                max={1000}
                step={50}
              /> <Pyraui.Components.Slider.slider label="Rating" value={3} min={1} max={5} step={1} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.slider label="Temperature (°C)" value={20} min={-10} max={40} /&gt;
              &lt;.slider label="Price Range ($)" value={500} min={0} max={1000} step={50} /&gt;
              &lt;.slider label="Rating" value={3} min={1} max={5} step={1} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Without Value Display</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-6">
              <Pyraui.Components.Slider.slider label="Volume" value={50} show_value={false} />
              <Pyraui.Components.Slider.slider label="Speed" value={60} show_value={false} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.slider label="Volume" value={50} show_value={false} /&gt;
              &lt;.slider label="Speed" value={60} show_value={false} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Validation</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-6">
              <Pyraui.Components.Slider.slider
                label="Required Value"
                value={50}
                error="This field is required"
              />
              <Pyraui.Components.Slider.slider
                label="Value with Helper"
                value={30}
                helper="Adjust the slider to set your preferred value"
              />
              <Pyraui.Components.Slider.slider label="Disabled Slider" value={50} disabled={true} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.slider label="Required Value" value={50} error="This field is required" /&gt;
              &lt;.slider label="Value with Helper" value={30} helper="Adjust the slider to set your preferred value" /&gt;
              &lt;.slider label="Disabled Slider" value={50} disabled={true} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Form Field</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <p class="text-sm text-gray-600 mb-4">
                When used with a form field, the slider integrates with Phoenix forms:
              </p>
              <Pyraui.Components.Slider.slider label="Volume" value={50} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.form for={@form} phx-change="validate" phx-submit="save"&gt;
                &lt;.slider label="Volume" field={@form[:volume]} /&gt;
                &lt;.button type="submit"&gt;Save&lt;/.button&gt;
              &lt;/.form&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">field</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    Phoenix.HTML.FormField
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Form field struct from to_form/2</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">label</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Label text displayed above the slider
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">value</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">50</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Current slider value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">min</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">0</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Minimum selectable value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">max</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">100</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Maximum selectable value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">step</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">1</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Step increment for slider value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">error</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Error message to display</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    helper
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Helper text displayed below the slider
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    disabled
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Disable the slider</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    show_value
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Show current value next to the slider
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
