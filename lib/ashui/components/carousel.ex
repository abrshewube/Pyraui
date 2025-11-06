defmodule Ashui.Components.Carousel do
  @moduledoc """
  Carousel component for displaying images, testimonials, or content cards in a sliding carousel.

  ## Examples

      <.carousel id="testimonials">
        <:slide>
          <div class="p-8">Testimonial 1</div>
        </:slide>
        <:slide>
          <div class="p-8">Testimonial 2</div>
        </:slide>
      </.carousel>
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the carousel"
  attr :autoplay, :boolean, default: false, doc: "Automatically advance slides"
  attr :interval, :integer, default: 5000, doc: "Autoplay interval in milliseconds"
  attr :show_indicators, :boolean, default: true, doc: "Show slide indicators"
  attr :show_arrows, :boolean, default: true, doc: "Show navigation arrows"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :slide, required: true, doc: "Carousel slides"

  def carousel(assigns) do
    current_slide = Map.get(assigns, :current_slide, 0)
    total_slides = length(assigns.slide)

    assigns =
      assigns
      |> assign(:current_slide, current_slide)
      |> assign(:total_slides, total_slides)

    ~H"""
    <div
      id={@id}
      class={["carousel-container relative", @class]}
      phx-hook="CarouselHook"
      data-autoplay={@autoplay}
      data-interval={@interval}
      {@rest}
    >
      <div class="carousel-wrapper relative overflow-hidden rounded-lg">
        <div
          class="carousel-track flex transition-transform duration-500 ease-in-out"
          style={"transform: translateX(-#{@current_slide * 100}%)"}
        >
          <%= for slide <- @slide do %>
            <div class="carousel-slide min-w-full flex-shrink-0">{render_slot(slide)}</div>
          <% end %>
        </div>
      </div>

      <%= if @show_arrows && @total_slides > 1 do %>
        <button
          type="button"
          class="carousel-prev absolute left-4 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white rounded-full p-2 shadow-lg transition-colors z-10"
          phx-click="carousel-prev"
          phx-value-id={@id}
          aria-label="Previous slide"
        >
          <.icon name="hero-chevron-left" class="w-6 h-6 text-gray-800" />
        </button>
        <button
          type="button"
          class="carousel-next absolute right-4 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white rounded-full p-2 shadow-lg transition-colors z-10"
          phx-click="carousel-next"
          phx-value-id={@id}
          aria-label="Next slide"
        >
          <.icon name="hero-chevron-right" class="w-6 h-6 text-gray-800" />
        </button>
      <% end %>

      <%= if @show_indicators && @total_slides > 1 do %>
        <div class="carousel-indicators flex justify-center gap-2 mt-4">
          <%= for i <- 0..(@total_slides - 1) do %>
            <button
              type="button"
              class={[
                "carousel-indicator w-2 h-2 rounded-full transition-all",
                if(i == @current_slide, do: "bg-blue-600 w-8", else: "bg-gray-300 hover:bg-gray-400")
              ]}
              phx-click="carousel-go-to"
              phx-value-id={@id}
              phx-value-index={i}
              aria-label={"Go to slide #{i + 1}"}
            >
            </button>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
