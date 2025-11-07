defmodule PyrauiWeb.DocsLive.KbdDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Kbd</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Keyboard shortcut display component for showing keyboard combinations.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Basic Usage</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <p class="text-gray-700 dark:text-gray-300 mb-4">
              Press
              <Pyraui.Components.Kbd.kbd>Ctrl</Pyraui.Components.Kbd.kbd>
              +
              <Pyraui.Components.Kbd.kbd>S</Pyraui.Components.Kbd.kbd>
              to save
            </p>

            <p class="text-gray-700 dark:text-gray-300 mb-4">
              Press
              <Pyraui.Components.Kbd.kbd>Esc</Pyraui.Components.Kbd.kbd>
              to close
            </p>

            <p class="text-gray-700 dark:text-gray-300">
              Press
              <Pyraui.Components.Kbd.kbd>Cmd</Pyraui.Components.Kbd.kbd>
              +
              <Pyraui.Components.Kbd.kbd>K</Pyraui.Components.Kbd.kbd>
              to search
            </p>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
              Press &lt;.kbd&gt;Ctrl&lt;/.kbd&gt; + &lt;.kbd&gt;S&lt;/.kbd&gt; to save
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">
            Different Sizes
          </h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm space-y-4">
            <div>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">Small</p>

              <Pyraui.Components.Kbd.kbd size={:sm}>Esc</Pyraui.Components.Kbd.kbd>
            </div>

            <div>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">Medium</p>

              <Pyraui.Components.Kbd.kbd size={:md}>Ctrl</Pyraui.Components.Kbd.kbd>
            </div>

            <div>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">Large</p>

              <Pyraui.Components.Kbd.kbd size={:lg}>Enter</Pyraui.Components.Kbd.kbd>
            </div>
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
                    size
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    atom
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    :md
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    Key size (:sm, :md, :lg)
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
