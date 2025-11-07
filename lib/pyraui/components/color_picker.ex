defmodule Pyraui.Components.ColorPicker do
  @moduledoc """
  Color Picker / Palette Selector component for design dashboards or admin apps.

  ## Examples

      <.color_picker id="primary-color" value="#3b82f6" />
      <.color_picker id="theme-color" value="#000000" show_palette={true} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the color picker"
  attr :value, :string, default: "#000000", doc: "Current color value (hex)"
  attr :show_palette, :boolean, default: false, doc: "Show predefined color palette"
  attr :label, :string, default: nil, doc: "Input label"
  attr :class, :string, default: ""
  attr :rest, :global

  def color_picker(assigns) do
    palette = [
      "#000000",
      "#FFFFFF",
      "#FF0000",
      "#00FF00",
      "#0000FF",
      "#FFFF00",
      "#FF00FF",
      "#00FFFF",
      "#808080",
      "#FFA500",
      "#800080",
      "#008000",
      "#000080",
      "#800000",
      "#008080"
    ]

    assigns = assign(assigns, :palette, palette)

    ~H"""
    <div
      id={@id}
      class={["color-picker-container", @class]}
      phx-hook="ColorPickerHook"
      {@rest}
    >
      <%= if @label do %>
        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
          {@label}
        </label>
      <% end %>

      <div class="flex items-center gap-3">
        <div class="relative">
          <input
            type="color"
            value={@value}
            class="w-16 h-16 rounded-lg border-2 border-gray-300 dark:border-gray-600 cursor-pointer"
            phx-change="color-changed"
            phx-value-id={@id}
          />
        </div>

        <input
          type="text"
          value={@value}
          class="px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100 font-mono text-sm"
          phx-blur="color-changed"
          phx-value-id={@id}
          placeholder="#000000"
        />
      </div>

      <%= if @show_palette do %>
        <div class="mt-4">
          <p class="text-sm text-gray-600 dark:text-gray-400 mb-2">Color Palette</p>

          <div class="flex flex-wrap gap-2">
            <%= for color <- @palette do %>
              <button
                type="button"
                class={[
                  "w-8 h-8 rounded border-2 transition-all",
                  if(color == @value,
                    do: "border-blue-600 dark:border-blue-400 scale-110",
                    else: "border-gray-300 dark:border-gray-600 hover:scale-105"
                  )
                ]}
                style={"background-color: #{color}"}
                phx-click="select-color"
                phx-value-id={@id}
                phx-value-color={color}
                aria-label={"Select color #{color}"}
              >
              </button>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
