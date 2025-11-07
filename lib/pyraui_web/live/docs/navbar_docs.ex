defmodule PyrauiWeb.DocsLive.NavbarDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Navbar</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Responsive navbar component with mobile menu support and customizable navigation items.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Navbar.navbar brand="MyApp">
              <:item href="/">Home</:item>

              <:item href="/about">About</:item>

              <:item href="/contact">Contact</:item>
            </Pyraui.Components.Navbar.navbar>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.navbar brand="MyApp"&gt;
      &lt;:item href="/"&gt;Home&lt;/:item&gt;
      &lt;:item href="/about"&gt;About&lt;/:item&gt;
      &lt;:item href="/contact"&gt;Contact&lt;/:item&gt;
    &lt;/.navbar&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Active State</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Navbar.navbar brand="MyApp">
              <:item href="/" active={true}>Home</:item>

              <:item href="/about" active={false}>About</:item>

              <:item href="/contact" active={false}>Contact</:item>
            </Pyraui.Components.Navbar.navbar>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.navbar brand="MyApp"&gt;
      &lt;:item href="/" active={true}&gt;Home&lt;/:item&gt;
      &lt;:item href="/about" active={false}&gt;About&lt;/:item&gt;
      &lt;:item href="/contact" active={false}&gt;Contact&lt;/:item&gt;
    &lt;/.navbar&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Actions Slot</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Navbar.navbar brand="MyApp">
              <:item href="/">Home</:item>

              <:item href="/about">About</:item>

              <:actions>
                <Pyraui.Components.Button.button variant={:primary} size={:sm}>
                  Sign In
                </Pyraui.Components.Button.button>
              </:actions>
            </Pyraui.Components.Navbar.navbar>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.navbar brand="MyApp"&gt;
      &lt;:item href="/"&gt;Home&lt;/:item&gt;
      &lt;:item href="/about"&gt;About&lt;/:item&gt;
      &lt;:actions&gt;
        &lt;.button variant={:primary} size={:sm}&gt;Sign In&lt;/.button&gt;
      &lt;/:actions&gt;
    &lt;/.navbar&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">brand</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"Brand"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Brand name displayed in navbar</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    item (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Navigation items. Each item accepts:
                    <ul class="list-disc list-inside mt-1 space-y-1">
                      <li>
                        <code class="bg-gray-100 px-1 rounded">href</code>
                        - Navigation path (required)
                      </li>

                      <li>
                        <code class="bg-gray-100 px-1 rounded">active</code>
                        - Boolean to mark active item (optional)
                      </li>
                    </ul>
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    actions (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Content displayed on the right side of the navbar (e.g., buttons, user menu)
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Mobile Menu</h2>

          <p class="text-gray-700 mb-4">
            The navbar automatically includes a mobile menu toggle button. To handle the mobile menu toggle, add a LiveView event handler:
          </p>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    def handle_event("toggle-mobile-menu", _params, socket) do
      {:noreply, assign(socket, :mobile_menu_open, !socket.assigns[:mobile_menu_open])}
    end
            </code></pre>
          </div>

          <p class="text-gray-700 mt-4 text-sm">
            Note: You'll need to add JavaScript or LiveView logic to show/hide the mobile menu based on the state.
          </p>
        </section>
      </div>
    </div>
    """
  end
end
