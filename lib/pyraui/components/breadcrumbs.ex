defmodule Pyraui.Components.Breadcrumbs do
  @moduledoc """
  Breadcrumb navigation component.

  ## Examples

      <.breadcrumbs>
        <.breadcrumb_item href="/">Home</.breadcrumb_item>
        <.breadcrumb_item href="/products">Products</.breadcrumb_item>
        <.breadcrumb_item active={true}>Current Page</.breadcrumb_item>
      </.breadcrumbs>
  """

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :rest, :global

  slot :item,
    required: true,
    doc: "Breadcrumb entries" do
    attr :href, :string
    attr :active, :boolean
  end

  def breadcrumbs(assigns) do
    breadcrumbs_class =
      ["flex", assigns.class]
      |> Enum.reject(&(&1 in [nil, ""]))
      |> Enum.join(" ")

    assigns =
      assigns
      |> assign(:breadcrumbs_class, breadcrumbs_class)

    ~H"""
    <nav class={@breadcrumbs_class} aria-label="Breadcrumb" {@rest}>
      <ol class="inline-flex items-center space-x-1 md:space-x-3">
        <%= for {item, index} <- Enum.with_index(@item) do %>
          <li class="inline-flex items-center">
            <% active? = Map.get(item, :active, false) %>
            <%= if index > 0 do %>
              <svg class="w-3 h-3 text-gray-400 mx-1" fill="currentColor" viewBox="0 0 20 20">
                <path
                  fill-rule="evenodd"
                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                  clip-rule="evenodd"
                />
              </svg>
            <% end %>

            <%= if active? do %>
              <span class="text-sm font-medium text-gray-500" aria-current="page">
                {render_slot(item)}
              </span>
            <% else %>
              <.link
                navigate={item.href}
                class="text-sm font-medium text-gray-700 hover:text-blue-600"
              >
                {render_slot(item)}
              </.link>
            <% end %>
          </li>
        <% end %>
      </ol>
    </nav>
    """
  end
end
