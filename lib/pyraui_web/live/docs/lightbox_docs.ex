defmodule PyrauiWeb.DocsLive.LightboxDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Lightbox</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Lightbox / Image Viewer component for full-screen image previews with navigation.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Basic Lightbox</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm">
            <div class="grid grid-cols-3 gap-4">
              <%= for {image, index} <- Enum.with_index(@sample_images) do %>
                <button
                  type="button"
                  phx-click="open-lightbox"
                  phx-value-id={@lightbox_id}
                  phx-value-index={index}
                  class="cursor-pointer"
                >
                  <img
                    src={image.src}
                    alt={image.alt}
                    class="w-full h-32 object-cover rounded-lg hover:opacity-80 transition-opacity"
                  />
                </button>
              <% end %>
            </div>

            <Pyraui.Components.Lightbox.lightbox
              id={@lightbox_id}
              images={@sample_images}
              current_index={@lightbox_current_index}
              show={@lightbox_show}
            />
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
              &lt;.lightbox id="gallery-lightbox" images={@images} current_index={0} show={@show_lightbox} /&gt;
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
                    images
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    list
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    -
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    List of image URLs or maps with :src and optional :alt
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    current_index
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    integer
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    0
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                    Currently displayed image index
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
