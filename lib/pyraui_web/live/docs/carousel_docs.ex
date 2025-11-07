defmodule PyrauiWeb.DocsLive.CarouselDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Carousel</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Carousel component for displaying images, testimonials, or content cards in a sliding carousel with navigation controls.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Carousel</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Carousel.carousel
              id="docs-carousel-1"
              current_slide={Map.get(assigns, :docs_carousel_1_current_slide, 0)}
            >
              <:slide>
                <div class="bg-blue-100 p-12 text-center rounded-lg">
                  <h3 class="text-2xl font-bold mb-2">Slide 1</h3>

                  <p class="text-gray-700">First slide content</p>
                </div>
              </:slide>

              <:slide>
                <div class="bg-green-100 p-12 text-center rounded-lg">
                  <h3 class="text-2xl font-bold mb-2">Slide 2</h3>

                  <p class="text-gray-700">Second slide content</p>
                </div>
              </:slide>

              <:slide>
                <div class="bg-purple-100 p-12 text-center rounded-lg">
                  <h3 class="text-2xl font-bold mb-2">Slide 3</h3>

                  <p class="text-gray-700">Third slide content</p>
                </div>
              </:slide>
            </Pyraui.Components.Carousel.carousel>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.carousel id="my-carousel"&gt;
                &lt;:slide&gt;
                  &lt;div class="p-8"&gt;Slide 1&lt;/div&gt;
                &lt;/:slide&gt;
                &lt;:slide&gt;
                  &lt;div class="p-8"&gt;Slide 2&lt;/div&gt;
                &lt;/:slide&gt;
              &lt;/.carousel&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Autoplay</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.carousel id="autoplay-carousel" autoplay={true} interval={3000} /&gt;
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

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for the carousel</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    autoplay
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Automatically advance slides</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    interval
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">5000</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Autoplay interval in milliseconds</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    show_indicators
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Show slide indicators</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    show_arrows
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Show navigation arrows</td>
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
