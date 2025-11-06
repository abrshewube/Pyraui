defmodule Ashui.Components.Map do
  @moduledoc """
  Interactive map component for displaying locations and events.

  Uses OpenStreetMap tiles. For production, consider using Mapbox or Google Maps.

  ## Examples

      <.map latitude={37.7749} longitude={-122.4194} zoom={13} />
      <.map latitude={40.7128} longitude={-74.0060} markers={[%{lat: 40.7128, lng: -74.0060, label: "NYC"}]} />
  """

  use Phoenix.Component

  attr :latitude, :float, required: true
  attr :longitude, :float, required: true
  attr :zoom, :integer, default: 13

  attr :markers, :list,
    default: [],
    doc: "List of marker maps with :lat, :lng, and optional :label"

  attr :width, :string, default: "100%"
  attr :height, :string, default: "400px"
  attr :class, :string, default: ""
  attr :rest, :global

  def map(assigns) do
    id = "map-#{System.unique_integer([:positive])}"
    tile_url = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"

    assigns =
      assigns
      |> assign(:id, id)
      |> assign(:tile_url, tile_url)

    ~H"""
    <div
      id={@id}
      class={["map-container rounded-lg overflow-hidden border border-gray-200", @class]}
      style={"width: #{@width}; height: #{@height};"}
      phx-hook="MapHook"
      data-latitude={@latitude}
      data-longitude={@longitude}
      data-zoom={@zoom}
      data-markers={Jason.encode!(@markers)}
      data-tile-url={@tile_url}
      {@rest}
    >
      <div class="w-full h-full bg-gray-100 flex items-center justify-center">
        <div class="text-center text-gray-500">
          <svg class="w-12 h-12 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
            />
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
            />
          </svg>
          <p class="text-sm">Map Loading...</p>

          <p class="text-xs mt-1">Lat: {@latitude}, Lng: {@longitude}</p>
        </div>
      </div>
    </div>
    """
  end
end
