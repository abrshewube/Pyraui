defmodule PyrauiWeb.DocsLive.MockupDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Mockup</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Mockup component for displaying phone, browser, or window mockups.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Phone Mockup</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <Pyraui.Components.Mockup.mockup type={:phone}>
              <div class="p-4 bg-gray-100 dark:bg-gray-800 h-64 flex items-center justify-center">
                <p class="text-gray-600 dark:text-gray-400">Phone Content</p>
              </div>
            </Pyraui.Components.Mockup.mockup>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
              &lt;.mockup type={:phone}&gt;
                &lt;img src="/screenshot.png" /&gt;
              &lt;/.mockup&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Browser Mockup</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <Pyraui.Components.Mockup.mockup type={:browser} url="example.com">
              <div class="p-4">
                <h2 class="text-xl font-bold mb-2">Browser Content</h2>

                <p class="text-gray-600 dark:text-gray-400">This is a browser mockup</p>
              </div>
            </Pyraui.Components.Mockup.mockup>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Window Mockup</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <Pyraui.Components.Mockup.mockup type={:window} title="Application Window">
              <div class="p-4">
                <p class="text-gray-600 dark:text-gray-400">Window content here</p>
              </div>
            </Pyraui.Components.Mockup.mockup>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Props</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 border border-gray-200 dark:border-gray-700">
              <thead class="bg-gray-50 dark:bg-gray-800">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Prop
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Type
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Default
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Description
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    type
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    atom
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    -
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    Mockup type (:phone, :browser, :window)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    url
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    string
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    nil
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    URL for browser mockup
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
