defmodule PyrauiWeb.DocsLive.MapDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Map</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Interactive map component for displaying locations and events. Uses OpenStreetMap tiles for rendering.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Map</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Map.map latitude={37.7749} longitude={-122.4194} zoom={13} />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.map latitude={37.7749} longitude={-122.4194} zoom={13} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Markers</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Map.map
              latitude={40.7128}
              longitude={-74.0060}
              zoom={12}
              markers={[
                %{lat: 40.7128, lng: -74.0060, label: "New York"},
                %{lat: 40.7589, lng: -73.9851, label: "Times Square"}
              ]}
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.map
                latitude={40.7128}
                longitude={-74.0060}
                zoom={12}
                markers={[
                  %{lat: 40.7128, lng: -74.0060, label: "New York"},
                  %{lat: 40.7589, lng: -73.9851, label: "Times Square"}
                ]}
              /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Size</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Map.map
              latitude={51.5074}
              longitude={-0.1278}
              zoom={10}
              width="600px"
              height="300px"
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.map latitude={51.5074} longitude={-0.1278} zoom={10} width="600px" height="300px" /&gt;
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
                    latitude
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">float</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Center latitude coordinate</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    longitude
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">float</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Center longitude coordinate</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">zoom</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">13</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Zoom level (1-18)</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    markers
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">list</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">[]</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    List of marker maps with :lat, :lng, and optional :label
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">width</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"100%"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Map width (CSS value)</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    height
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"400px"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Map height (CSS value)</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Note</h2>

          <div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <p class="text-sm text-blue-800">
              The map component requires a JavaScript hook (<code class="bg-blue-100 px-1 rounded">MapHook</code>) for full interactivity.
              For production use, consider integrating with Mapbox, Google Maps, or Leaflet.js for enhanced features.
            </p>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
