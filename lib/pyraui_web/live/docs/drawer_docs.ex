defmodule PyrauiWeb.DocsLive.DrawerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    assigns = assign(assigns, :drawer_open_state, Map.get(assigns, :"drawer-docs_open", false))

    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Drawer</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Drawer sidebar component for off-canvas navigation.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Left Drawer</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <Pyraui.Components.Drawer.drawer id="drawer-docs" open={@drawer_open_state} side={:left}>
              <:trigger>
                <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                  Open Drawer
                </button>
              </:trigger>

              <:content>
                <nav class="space-y-2">
                  <a
                    href="#"
                    class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg"
                  >
                    Home
                  </a>
                  <a
                    href="#"
                    class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg"
                  >
                    About
                  </a>
                  <a
                    href="#"
                    class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg"
                  >
                    Contact
                  </a>
                </nav>
              </:content>
            </Pyraui.Components.Drawer.drawer>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
              &lt;.drawer id="nav-drawer" open={@drawer_open_state}&gt;
                &lt;:trigger&gt;Open Menu&lt;/:trigger&gt;
                &lt;:content&gt;
                  &lt;nav&gt;Navigation items&lt;/nav&gt;
                &lt;/.drawer&gt;
            </code></pre>
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
                    side
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    atom
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    :left
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    Drawer side (:left or :right)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    overlay
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    boolean
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    true
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    Show overlay backdrop
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
