defmodule PyrauiWeb.DocsLive.ToastDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Toast</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Toast component for displaying temporary notifications that appear at fixed positions on the screen.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Toast</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-4">
              <p class="text-sm text-gray-600 mb-4">
                Toasts are fixed position notifications. Here are examples of different variants:
              </p>

              <div class="relative h-64 border border-gray-200 rounded-lg p-4">
                <Pyraui.Components.Toast.toast
                  variant={:success}
                  position={:top_end}
                  id="toast-success-demo"
                >
                  Operation successful!
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:error}
                  position={:top_end}
                  id="toast-error-demo"
                >
                  Something went wrong
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:info}
                  position={:top_end}
                  id="toast-info-demo"
                >
                  Information message
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:warning}
                  position={:top_end}
                  id="toast-warning-demo"
                >
                  Warning message
                </Pyraui.Components.Toast.toast>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.toast variant={:success}&gt;Operation successful!&lt;/.toast&gt;
              &lt;.toast variant={:error}&gt;Something went wrong&lt;/.toast&gt;
              &lt;.toast variant={:info}&gt;Information message&lt;/.toast&gt;
              &lt;.toast variant={:warning}&gt;Warning message&lt;/.toast&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Positions</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-4">
              <p class="text-sm text-gray-600 mb-4">
                Toasts can be positioned at different locations on the screen:
              </p>

              <div class="relative h-64 border border-gray-200 rounded-lg p-4">
                <Pyraui.Components.Toast.toast
                  variant={:info}
                  position={:top_start}
                  id="toast-top-start-demo"
                >
                  Top Start
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:info}
                  position={:top_center}
                  id="toast-top-center-demo"
                >
                  Top Center
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:info}
                  position={:bottom_end}
                  id="toast-bottom-end-demo"
                >
                  Bottom End
                </Pyraui.Components.Toast.toast>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.toast variant={:info} position={:top_start}&gt;Top Start&lt;/.toast&gt;
              &lt;.toast variant={:info} position={:top_center}&gt;Top Center&lt;/.toast&gt;
              &lt;.toast variant={:info} position={:top_end}&gt;Top End&lt;/.toast&gt;
              &lt;.toast variant={:info} position={:bottom_start}&gt;Bottom Start&lt;/.toast&gt;
              &lt;.toast variant={:info} position={:bottom_center}&gt;Bottom Center&lt;/.toast&gt;
              &lt;.toast variant={:info} position={:bottom_end}&gt;Bottom End&lt;/.toast&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Auto-Dismiss</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-4">
              <p class="text-sm text-gray-600 mb-4">
                Toasts can automatically dismiss after a specified duration:
              </p>

              <div class="relative h-64 border border-gray-200 rounded-lg p-4">
                <Pyraui.Components.Toast.toast
                  variant={:success}
                  position={:top_end}
                  duration={3000}
                  id="toast-auto-dismiss-demo"
                >
                  This toast will auto-dismiss in 3 seconds
                </Pyraui.Components.Toast.toast>

                <Pyraui.Components.Toast.toast
                  variant={:info}
                  position={:top_end}
                  duration={0}
                  id="toast-no-auto-dismiss-demo"
                >
                  This toast won't auto-dismiss (duration={0})
                </Pyraui.Components.Toast.toast>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.toast variant={:success} duration={3000}&gt;Auto-dismiss in 3 seconds&lt;/.toast&gt;
              &lt;.toast variant={:info} duration={0}&gt;No auto-dismiss&lt;/.toast&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Non-Dismissible</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-4">
              <p class="text-sm text-gray-600 mb-4">
                Toasts can be made non-dismissible by setting dismissible={false}:
              </p>

              <div class="relative h-64 border border-gray-200 rounded-lg p-4">
                <Pyraui.Components.Toast.toast
                  variant={:warning}
                  position={:top_end}
                  dismissible={false}
                  id="toast-non-dismissible-demo"
                >
                  This toast cannot be dismissed manually
                </Pyraui.Components.Toast.toast>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.toast variant={:warning} dismissible={false}&gt;Non-dismissible toast&lt;/.toast&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With LiveView</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-4">
              <p class="text-sm text-gray-600 mb-4">
                Toasts work seamlessly with LiveView. You can show/hide them using JS commands:
              </p>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              # In your LiveView
              def handle_event("show-success", _params, socket) do
                {:noreply, socket}
              end

              # In your template
              &lt;button phx-click="show-success" phx-click-js={JS.show(to: "#toast-success", transition: "fade-in-scale")}&gt;
                Show Success Toast
              &lt;/button&gt;

              &lt;.toast id="toast-success" variant={:success}&gt;
                Operation completed successfully!
              &lt;/.toast&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">id</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">auto-generated</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Unique ID for the toast (required for JS.show/hide)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    variant
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :info | :success | :warning | :error
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:info</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Visual variant of the toast</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    position
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :top_start | :top_center | :top_end | :middle_start | :middle_center | :middle_end | :bottom_start | :bottom_center | :bottom_end
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:top_end</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Position of the toast on the screen</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    dismissible
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Show close button to manually dismiss
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    duration
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">5000</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Auto-dismiss duration in milliseconds (0 to disable)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
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
