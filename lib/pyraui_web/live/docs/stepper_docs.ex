defmodule PyrauiWeb.DocsLive.StepperDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Stepper</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Stepper component for displaying multi-step processes and progress indicators.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Stepper</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-6">
              <Pyraui.Components.Stepper.stepper>
                <:step label="Step 1" status={:completed} /> <:step label="Step 2" status={:active} />
                <:step label="Step 3" status={:pending} /> <:step label="Step 4" status={:pending} />
              </Pyraui.Components.Stepper.stepper>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.stepper&gt;
                &lt;:step label="Step 1" status={:completed} /&gt;
                &lt;:step label="Step 2" status={:active} /&gt;
                &lt;:step label="Step 3" status={:pending} /&gt;
                &lt;:step label="Step 4" status={:pending} /&gt;
              &lt;/.stepper&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Vertical Stepper</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-6">
              <Pyraui.Components.Stepper.stepper orientation={:vertical}>
                <:step label="Account Setup" status={:completed} />
                <:step label="Profile Information" status={:completed} />
                <:step label="Preferences" status={:active} />
                <:step label="Review" status={:pending} />
              </Pyraui.Components.Stepper.stepper>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.stepper orientation={:vertical}&gt;
                &lt;:step label="Account Setup" status={:completed} /&gt;
                &lt;:step label="Profile Information" status={:completed} /&gt;
                &lt;:step label="Preferences" status={:active} /&gt;
                &lt;:step label="Review" status={:pending} /&gt;
              &lt;/.stepper&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Icons</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-6">
              <Pyraui.Components.Stepper.stepper>
                <:step label="Cart" status={:completed} icon="hero-shopping-cart" />
                <:step label="Shipping" status={:completed} icon="hero-truck" />
                <:step label="Payment" status={:active} icon="hero-credit-card" />
                <:step label="Review" status={:pending} icon="hero-check-circle" />
              </Pyraui.Components.Stepper.stepper>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.stepper&gt;
                &lt;:step label="Cart" status={:completed} icon="hero-shopping-cart" /&gt;
                &lt;:step label="Shipping" status={:completed} icon="hero-truck" /&gt;
                &lt;:step label="Payment" status={:active} icon="hero-credit-card" /&gt;
                &lt;:step label="Review" status={:pending} icon="hero-check-circle" /&gt;
              &lt;/.stepper&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Variants</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-6">
              <Pyraui.Components.Stepper.stepper>
                <:step label="Success" status={:completed} variant={:success} />
                <:step label="Warning" status={:active} variant={:warning} />
                <:step label="Error" status={:pending} variant={:error} />
              </Pyraui.Components.Stepper.stepper>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.stepper&gt;
                &lt;:step label="Success" status={:completed} variant={:success} /&gt;
                &lt;:step label="Warning" status={:active} variant={:warning} /&gt;
                &lt;:step label="Error" status={:pending} variant={:error} /&gt;
              &lt;/.stepper&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Step Status</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="space-y-6">
              <div>
                <p class="text-sm text-gray-600 mb-2">Pending (default):</p>

                <Pyraui.Components.Stepper.stepper>
                  <:step label="Pending Step" status={:pending} />
                </Pyraui.Components.Stepper.stepper>
              </div>

              <div>
                <p class="text-sm text-gray-600 mb-2">Active:</p>

                <Pyraui.Components.Stepper.stepper>
                  <:step label="Active Step" status={:active} />
                </Pyraui.Components.Stepper.stepper>
              </div>

              <div>
                <p class="text-sm text-gray-600 mb-2">Completed:</p>

                <Pyraui.Components.Stepper.stepper>
                  <:step label="Completed Step" status={:completed} />
                </Pyraui.Components.Stepper.stepper>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;:step label="Pending Step" status={:pending} /&gt;
              &lt;:step label="Active Step" status={:active} /&gt;
              &lt;:step label="Completed Step" status={:completed} /&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    orientation
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :horizontal | :vertical
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:horizontal</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Layout orientation of the stepper</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
                </tr>

                <tr>
                  <td colspan="4" class="px-6 py-4 text-sm font-medium text-gray-900 bg-gray-50">
                    Step Slot Props
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">label</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Label text for the step</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    status
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :pending | :active | :completed
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:pending</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Status of the step</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    variant
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :primary | :secondary | :accent | :info | :success | :warning | :error
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:primary</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Color variant for active/completed steps
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">icon</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Heroicon name (e.g., "hero-check-circle")
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
