defmodule PyrauiWeb.DocsLive.MultiSelectDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Multi-Select</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Multi-select component with chips/tags display for selecting multiple items from a list.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Multi-Select</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="min-h-[42px] p-2 border border-gray-300 rounded-lg bg-white flex flex-wrap gap-2 items-center">
              <span class="text-gray-400 text-sm">Select options...</span>
              <div class="ml-auto">
                <.icon name="hero-chevron-down" class="w-5 h-5 text-gray-400" />
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.multi_select field={@form[:tags]} options={["Option 1", "Option 2", "Option 3"]} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Selected Values</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="min-h-[42px] p-2 border border-gray-300 rounded-lg bg-white flex flex-wrap gap-2 items-center">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                Option 1
                <button
                  type="button"
                  class="ml-2 inline-flex items-center justify-center w-4 h-4 rounded-full hover:bg-blue-200"
                >
                  <.icon name="hero-x-mark" class="w-3 h-3" />
                </button>
              </span>
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                Option 2
                <button
                  type="button"
                  class="ml-2 inline-flex items-center justify-center w-4 h-4 rounded-full hover:bg-blue-200"
                >
                  <.icon name="hero-x-mark" class="w-3 h-3" />
                </button>
              </span>
              <div class="ml-auto">
                <.icon name="hero-chevron-down" class="w-5 h-5 text-gray-400" />
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.multi_select field={@form[:categories]} options={categories} label="Categories" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Label-Value Pairs</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.multi_select
                field={@form[:tags]}
                options={[
                  {"Frontend", "frontend"},
                  {"Backend", "backend"},
                  {"DevOps", "devops"}
                ]}
              /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Note</h2>

          <div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <p class="text-sm text-blue-800">
              The multi-select component requires a JavaScript hook (<code class="bg-blue-100 px-1 rounded">MultiSelectHook</code>) for dropdown toggle functionality.
              Selected values are submitted as an array in the form params.
            </p>
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

                  <td class="px-6 py-4 text-sm text-gray-700">Form field struct</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    options
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">list</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    List of options (strings or label-value tuples)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    placeholder
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    "Select options..."
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Placeholder text when no items selected
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
