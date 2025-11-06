defmodule Ashui.Components.ResizablePanels do
  @moduledoc """
  Resizable panels component for split layouts like IDEs or dashboards.

  ## Examples

      <.resizable_panels id="split-layout" orientation={:horizontal}>
        <:panel min_width="200px" default_width="300px">
          <div class="p-4">Left Panel</div>
        </:panel>
        <:panel>
          <div class="p-4">Right Panel</div>
        </:panel>
      </.resizable_panels>
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the panels"

  attr :orientation, :atom,
    default: :horizontal,
    values: [:horizontal, :vertical],
    doc: "Layout orientation"

  attr :class, :string, default: ""
  attr :rest, :global

  slot :panel, required: true do
    attr :min_width, :string
    attr :min_height, :string
    attr :default_width, :string
    attr :default_height, :string
  end

  def resizable_panels(assigns) do
    orientation_class = if assigns.orientation == :vertical, do: "flex-col", else: "flex-row"

    assigns = assign(assigns, :orientation_class, orientation_class)

    ~H"""
    <div
      id={@id}
      class={["resizable-panels-container flex", @orientation_class, @class]}
      phx-hook="ResizablePanelsHook"
      data-orientation={@orientation}
      {@rest}
    >
      <%= for {panel, index} <- Enum.with_index(@panel) do %>
        <div
          class={[
            "resizable-panel",
            if(@orientation == :horizontal,
              do: "border-r border-gray-300",
              else: "border-b border-gray-300"
            )
          ]}
          style={
            [
              if(@orientation == :horizontal,
                do: "min-width: #{Map.get(panel, :min_width, "100px")};",
                else: ""
              ),
              if(@orientation == :vertical,
                do: "min-height: #{Map.get(panel, :min_height, "100px")};",
                else: ""
              ),
              if(@orientation == :horizontal && Map.get(panel, :default_width),
                do: "width: #{Map.get(panel, :default_width)};",
                else: ""
              ),
              if(@orientation == :vertical && Map.get(panel, :default_height),
                do: "height: #{Map.get(panel, :default_height)};",
                else: ""
              )
            ]
            |> Enum.filter(&(&1 != ""))
            |> Enum.join(" ")
          }
          data-panel-index={index}
        >
          {render_slot(panel)}
        </div>

        <%= if index < length(@panel) - 1 do %>
          <div
            class={[
              "resizer cursor-col-resize bg-gray-200 hover:bg-blue-500 transition-colors",
              if(@orientation == :horizontal, do: "w-1", else: "h-1 w-full")
            ]}
            data-resizer-index={index}
          >
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end
end
