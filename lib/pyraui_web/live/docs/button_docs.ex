defmodule PyrauiWeb.DocsLive.ButtonDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Button</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">Button component with multiple variants and states.</p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex gap-4 flex-wrap">
              <Pyraui.Components.Button.button variant={:primary}>
                Primary
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:secondary}>
                Secondary
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:ghost}>
                Ghost
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:danger}>
                Danger
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:success}>
                Success
              </Pyraui.Components.Button.button>
            </div>
          </div>
          <pre class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200"><code phx-no-curly-interpolation class="text-gray-800">
    &lt;.button variant={:primary}&gt;Primary&lt;/.button&gt;
    &lt;.button variant={:secondary}&gt;Secondary&lt;/.button&gt;
    &lt;.button variant={:ghost}&gt;Ghost&lt;/.button&gt;
    </code></pre>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Prop
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Type
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Default
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Description
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    variant
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :primary | :secondary | :ghost | :danger | :success
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:primary</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Button style variant</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">size</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :sm | :md | :lg | :xl
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Button size</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    disabled
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Disable the button</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    loading
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Show loading spinner</td>
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
