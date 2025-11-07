defmodule Pyraui.Components.Heatmap do
  @moduledoc """
  Heatmap component for displaying data density and user interactions.

  ## Examples

      <.heatmap data={%{"2024-01-01" => 10, "2024-01-02" => 20}} />
      <.heatmap data={heatmap_data} color_scheme="blue" />
  """

  use Phoenix.Component

  attr :data, :map, required: true, doc: "Map of date/keys to values"
  attr :color_scheme, :atom, default: :blue, values: [:blue, :green, :red, :purple]
  attr :start_date, :string, default: nil
  attr :end_date, :string, default: nil
  attr :class, :string, default: ""
  attr :rest, :global

  def heatmap(assigns) do
    max_value = get_max_value(assigns.data)
    color_classes = get_color_classes(assigns.color_scheme)

    assigns =
      assigns
      |> assign(:max_value, max_value)
      |> assign(:color_classes, color_classes)

    ~H"""
    <div class={["heatmap-container", @class]} {@rest}>
      <div class="grid grid-cols-7 gap-1">
        <%= for {key, value} <- @data do %>
          <div
            class={[
              "aspect-square rounded",
              get_intensity_class(value, @max_value, @color_classes)
            ]}
            title={"#{key}: #{value}"}
          >
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp get_max_value(data) when is_map(data) do
    data
    |> Map.values()
    |> Enum.max(fn -> 0 end)
  end

  defp get_intensity_class(value, max_value, color_classes) when max_value > 0 do
    intensity = round(value / max_value * 100)

    cond do
      intensity == 0 -> Enum.at(color_classes, 0)
      intensity < 25 -> Enum.at(color_classes, 1)
      intensity < 50 -> Enum.at(color_classes, 2)
      intensity < 75 -> Enum.at(color_classes, 3)
      true -> Enum.at(color_classes, 4)
    end
  end

  defp get_intensity_class(_, _, color_classes), do: Enum.at(color_classes, 0)

  defp get_color_classes(:blue) do
    ["bg-gray-100", "bg-blue-100", "bg-blue-300", "bg-blue-500", "bg-blue-700"]
  end

  defp get_color_classes(:green) do
    ["bg-gray-100", "bg-green-100", "bg-green-300", "bg-green-500", "bg-green-700"]
  end

  defp get_color_classes(:red) do
    ["bg-gray-100", "bg-red-100", "bg-red-300", "bg-red-500", "bg-red-700"]
  end

  defp get_color_classes(:purple) do
    ["bg-gray-100", "bg-purple-100", "bg-purple-300", "bg-purple-500", "bg-purple-700"]
  end
end
