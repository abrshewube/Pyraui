defmodule Ashui.Components.Lightbox do
  @moduledoc """
  Lightbox / Image Viewer component for full-screen image previews with navigation.

  ## Examples

      <.lightbox id="gallery-lightbox" images={@images} current_index={0} />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  alias Phoenix.LiveView.JS

  attr :id, :string, required: true, doc: "Unique ID for the lightbox"

  attr :images, :list,
    required: true,
    doc: "List of image URLs or maps with :src and optional :alt"

  attr :current_index, :integer, default: 0, doc: "Currently displayed image index"
  attr :show, :boolean, default: false, doc: "Show lightbox"
  attr :class, :string, default: ""
  attr :rest, :global

  def lightbox(assigns) do
    current_image = Enum.at(assigns.images, assigns.current_index)
    has_prev = assigns.current_index > 0
    has_next = assigns.current_index < length(assigns.images) - 1

    assigns =
      assigns
      |> assign(:current_image, current_image)
      |> assign(:has_prev, has_prev)
      |> assign(:has_next, has_next)
      |> assign(:total_images, length(assigns.images))

    ~H"""
    <%= if @show do %>
      <div
        id={@id}
        class="fixed inset-0 z-50 flex items-center justify-center bg-black/90 dark:bg-black/95"
        phx-click={JS.push("close-lightbox", value: %{id: @id})}
        phx-key="escape"
        phx-window-keydown="close-lightbox"
        {@rest}
      >
        <!-- Close Button -->
        <button
          type="button"
          class="absolute top-4 right-4 text-white hover:text-gray-300 transition-colors z-10"
          phx-click={JS.push("close-lightbox", value: %{id: @id})}
          aria-label="Close lightbox"
        >
          <.icon name="hero-x-mark" class="w-8 h-8" />
        </button>
        <!-- Previous Button -->
        <%= if @has_prev do %>
          <button
            type="button"
            class="absolute left-4 text-white hover:text-gray-300 transition-colors z-10"
            phx-click={JS.push("lightbox-prev", value: %{id: @id})}
            aria-label="Previous image"
          >
            <.icon name="hero-chevron-left" class="w-10 h-10" />
          </button>
        <% end %>
        <!-- Image Container -->
        <div class="relative max-w-7xl max-h-[90vh] mx-4 flex items-center justify-center">
          <%= if @current_image do %>
            <% image_src =
              if is_map(@current_image), do: Map.get(@current_image, :src, ""), else: @current_image %> <% image_alt =
              if is_map(@current_image), do: Map.get(@current_image, :alt, ""), else: "" %>
            <img
              src={image_src}
              alt={image_alt}
              class="max-w-full max-h-[90vh] object-contain"
            />
          <% end %>
        </div>
        <!-- Next Button -->
        <%= if @has_next do %>
          <button
            type="button"
            class="absolute right-4 text-white hover:text-gray-300 transition-colors z-10"
            phx-click={JS.push("lightbox-next", value: %{id: @id})}
            aria-label="Next image"
          >
            <.icon name="hero-chevron-right" class="w-10 h-10" />
          </button>
        <% end %>
        <!-- Image Counter -->
        <%= if @total_images > 1 do %>
          <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 text-white text-sm bg-black/50 px-4 py-2 rounded-lg">
            {@current_index + 1} / {@total_images}
          </div>
        <% end %>
      </div>
    <% end %>
    """
  end
end
