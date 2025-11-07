defmodule Pyraui.Components.Tabs do
  @moduledoc """
  Tabs component for navigation between different content sections.

  ## Examples

      <.tabs>
        <.tab id="tab-1" label="Tab 1" active={true}>Content 1</.tab>
        <.tab id="tab-2" label="Tab 2">Content 2</.tab>
      </.tabs>
  """

  use Phoenix.Component

  attr :id, :string, default: "tabs"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :tab,
    required: true,
    doc: "Individual tabs" do
    attr :id, :string, required: true
    attr :label, :string, required: true
    attr :active, :boolean
  end

  def tabs(assigns) do
    container_class =
      ["border-b border-gray-200", assigns.class]
      |> Enum.reject(&(&1 in [nil, ""]))
      |> Enum.join(" ")

    assigns = assign(assigns, :container_class, container_class)

    ~H"""
    <div id={@id} class={@container_class} {@rest}>
      <nav class="flex -mb-px space-x-8" aria-label="Tabs">
        <%= for tab <- @tab do %>
          <% active? = Map.get(tab, :active, false) %>
          <button
            type="button"
            phx-click="switch-tab"
            phx-value-tab={tab.id}
            class={
              [
                "whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm transition-colors",
                if(active?,
                  do: "border-blue-500 text-blue-600",
                  else: "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300"
                )
              ]
              |> Enum.join(" ")
            }
          >
            {tab.label}
          </button>
        <% end %>
      </nav>

      <div class="mt-4">
        <%= for tab <- @tab do %>
          <% active? = Map.get(tab, :active, false) %>
          <div
            id={"#{tab.id}-content"}
            class={if active?, do: "", else: "hidden"}
          >
            {render_slot(tab)}
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
