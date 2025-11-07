defmodule PyrauiWeb.DocsLive.ProgressDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Progress</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">Progress bar component for showing completion status.</p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-6">
              <Pyraui.Components.Progress.progress value={25} />
              <Pyraui.Components.Progress.progress value={50} variant={:success} />
              <Pyraui.Components.Progress.progress value={75} variant={:warning} />
              <Pyraui.Components.Progress.progress value={90} variant={:error} show_label={true} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.progress value={75} max={100} /&gt;
    &lt;.progress value={50} variant={:success} /&gt;
    &lt;.progress value={90} variant={:error} show_label={true} /&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">value</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">required</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Current progress value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">max</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">100</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Maximum value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    variant
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :primary | :success | :warning | :error
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:primary</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Progress bar color variant</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    show_label
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Show percentage label</td>
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
