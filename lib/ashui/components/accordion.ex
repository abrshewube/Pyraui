defmodule Ashui.Components.Accordion do
  @moduledoc """
  Accordion component for collapsible content sections.

  ## Examples

      <.accordion>
        <.accordion_item id="item-1" title="Section 1" open={true}>
          Content for section 1
        </.accordion_item>
        <.accordion_item id="item-2" title="Section 2">
          Content for section 2
        </.accordion_item>
      </.accordion>
  """

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :rest, :global
  slot :item, required: true

  def accordion(assigns) do
    ~H"""
    <div class={["space-y-2", @class]} {@rest}>
      <%= for item <- @item do %>
        <div class="border border-gray-200 rounded-lg overflow-hidden">
          <button
            type="button"
            phx-click="toggle-accordion"
            phx-value-id={item.id}
            class="w-full px-4 py-3 text-left flex items-center justify-between bg-gray-50 hover:bg-gray-100 transition-colors"
          >
            <span class="font-medium text-gray-900">{item.title}</span>
            <svg
              class={[
                "w-5 h-5 text-gray-500 transition-transform",
                if(item.open, do: "rotate-180", else: "")
              ]}
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M19 9l-7 7-7-7"
              />
            </svg>
          </button>
          <div
            id={"#{item.id}-content"}
            class={[
              "px-4 py-3 transition-all",
              if(item.open, do: "block", else: "hidden")
            ]}
          >
            {render_slot(item)}
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
