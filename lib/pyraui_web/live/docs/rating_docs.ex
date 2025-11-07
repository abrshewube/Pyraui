defmodule PyrauiWeb.DocsLive.RatingDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Rating</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Rating / Star input component for reviews and feedback with interactive star selection.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Rating</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center space-x-1">
              <%= for i <- 1..5 do %>
                <button type="button" class="transition-colors cursor-pointer hover:scale-110">
                  <%= if i <= 3 do %>
                    <.icon name="hero-star" class="w-6 h-6 text-yellow-400 fill-yellow-400" />
                  <% else %>
                    <.icon name="hero-star" class="w-6 h-6 text-gray-300" />
                  <% end %>
                </button>
              <% end %>
              <span class="ml-2 text-sm text-gray-600">3/5</span>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rating field={@form[:rating]} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Sizes</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm space-y-4">
            <div>
              <p class="text-sm text-gray-600 mb-2">Small:</p>

              <div class="flex items-center space-x-1">
                <%= for i <- 1..5 do %>
                  <.icon name="hero-star" class="w-4 h-4 text-gray-300" />
                <% end %>
              </div>
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Medium (default):</p>

              <div class="flex items-center space-x-1">
                <%= for i <- 1..5 do %>
                  <.icon name="hero-star" class="w-6 h-6 text-gray-300" />
                <% end %>
              </div>
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Large:</p>

              <div class="flex items-center space-x-1">
                <%= for i <- 1..5 do %>
                  <.icon name="hero-star" class="w-8 h-8 text-gray-300" />
                <% end %>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rating field={@form[:score]} size={:sm} /&gt;
              &lt;.rating field={@form[:score]} size={:md} /&gt;
              &lt;.rating field={@form[:score]} size={:lg} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Readonly Rating</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center space-x-1">
              <%= for i <- 1..5 do %>
                <div class="cursor-default">
                  <%= if i <= 4 do %>
                    <.icon name="hero-star" class="w-6 h-6 text-yellow-400 fill-yellow-400" />
                  <% else %>
                    <.icon name="hero-star" class="w-6 h-6 text-gray-300" />
                  <% end %>
                </div>
              <% end %>
              <span class="ml-2 text-sm text-gray-600">4/5</span>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rating value={4} readonly={true} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Max Rating</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rating field={@form[:score]} max={10} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Note</h2>

          <div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <p class="text-sm text-blue-800">
              The rating component requires a JavaScript hook (<code class="bg-blue-100 px-1 rounded">RatingHook</code>) for interactive star selection.
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

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Form field struct (optional)</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">value</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">0</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Current rating value</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">max</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">5</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Maximum rating (number of stars)</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">size</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:sm | :md | :lg</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Star size</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    readonly
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Display-only mode (no interaction)</td>
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
