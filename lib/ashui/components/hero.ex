defmodule Ashui.Components.Hero do
  @moduledoc """
  Hero banner component for prominent page headers and call-to-action sections.

  ## Examples

      <.hero title="Welcome" subtitle="Get started today" />
      <.hero title="Amazing Product" cta="Get Started" />
  """

  use Phoenix.Component

  attr :title, :string, required: true, doc: "Hero title"
  attr :subtitle, :string, default: nil, doc: "Hero subtitle"
  attr :cta, :string, default: nil, doc: "Call-to-action button text"
  attr :cta_href, :string, default: nil, doc: "CTA button link"
  attr :background, :string, default: nil, doc: "Background image URL"
  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Hero size"
  attr :centered, :boolean, default: true, doc: "Center align content"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, doc: "Custom hero content"

  def hero(assigns) do
    size_classes = %{
      sm: "py-12",
      md: "py-20",
      lg: "py-32"
    }

    assigns = assign(assigns, :size_class, size_classes[assigns.size])

    ~H"""
    <div
      class={[
        "hero relative overflow-hidden",
        @size_class,
        if(@centered, do: "text-center", else: ""),
        @class
      ]}
      style={
        if(@background,
          do:
            "background-image: url(#{@background}); background-size: cover; background-position: center;",
          else: ""
        )
      }
      {@rest}
    >
      <%= if @background do %>
        <div class="absolute inset-0 bg-black/40 dark:bg-black/60"></div>
      <% end %>

      <div class={[
        "relative z-10 max-w-4xl mx-auto px-4 sm:px-6 lg:px-8",
        if(@background, do: "text-white", else: "text-gray-900 dark:text-gray-100")
      ]}>
        <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold mb-4">{@title}</h1>

        <%= if @subtitle do %>
          <p class="text-xl sm:text-2xl mb-8 opacity-90">{@subtitle}</p>
        <% end %>

        <%= if assigns[:inner_block] != [] do %>
          <div class="mb-8">{render_slot(@inner_block)}</div>
        <% end %>

        <%= if @cta && @cta_href do %>
          <a
            href={@cta_href}
            class="inline-block px-8 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors shadow-lg"
          >
            {@cta}
          </a>
        <% end %>
      </div>
    </div>
    """
  end
end
