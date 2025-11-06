defmodule Ashui.Components.Skeleton do
  @moduledoc """
  Skeleton component for loading placeholders during async data loading.

  ## Examples

      <.skeleton variant={:text} />
      <.skeleton variant={:circle} size={:lg} />
      <.skeleton variant={:rect} width="200px" height="100px" />
  """

  use Phoenix.Component

  attr :variant, :atom,
    default: :text,
    values: [:text, :circle, :rect],
    doc: "Skeleton shape variant"

  attr :size, :atom,
    default: :md,
    values: [:sm, :md, :lg],
    doc: "Size for text and circle variants"

  attr :width, :string, default: nil, doc: "Custom width"
  attr :height, :string, default: nil, doc: "Custom height"
  attr :lines, :integer, default: 1, doc: "Number of lines for text variant"
  attr :class, :string, default: ""
  attr :rest, :global

  def skeleton(assigns) do
    size_classes = %{
      sm: %{text: "h-3", circle: "w-8 h-8"},
      md: %{text: "h-4", circle: "w-12 h-12"},
      lg: %{text: "h-6", circle: "w-16 h-16"}
    }

    variant_class =
      case assigns.variant do
        :text -> size_classes[assigns.size].text
        :circle -> "#{size_classes[assigns.size].circle} rounded-full"
        :rect -> "h-4"
      end

    width_class =
      cond do
        assigns.width != nil -> ""
        assigns.variant == :text -> "w-full"
        assigns.variant == :rect -> "w-full"
        true -> ""
      end

    assigns =
      assigns
      |> assign(:variant_class, variant_class)
      |> assign(:width_class, width_class)

    ~H"""
    <div class={["skeleton-container", @class]} {@rest}>
      <%= if @variant == :text do %>
        <%= for i <- 1..@lines do %>
          <div
            class={[
              "skeleton bg-gray-200 rounded animate-pulse",
              @variant_class,
              @width_class,
              if(i < @lines, do: "mb-2", else: "")
            ]}
            style={
              [
                if(@width, do: "width: #{@width};", else: ""),
                if(@height, do: "height: #{@height};", else: "")
              ]
              |> Enum.filter(&(&1 != ""))
              |> Enum.join(" ")
            }
          >
          </div>
        <% end %>
      <% else %>
        <div
          class={[
            "skeleton bg-gray-200 rounded animate-pulse",
            @variant_class,
            @width_class
          ]}
          style={[
            if(@width, do: "width: #{@width};", else: ""),
            if(@height, do: "height: #{@height};", else: "")
          ]}
        >
        </div>
      <% end %>
    </div>
    """
  end
end
