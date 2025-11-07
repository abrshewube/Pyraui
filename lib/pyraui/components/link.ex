defmodule Pyraui.Components.Link do
  @moduledoc """
  Enhanced link component with various styling options.

  ## Examples

      <.link href="/about">About</.link>
      <.link href="/contact" variant={:primary}>Contact Us</.link>
      <.link navigate={~p"/dashboard"} external={false}>Dashboard</.link>
  """

  use Phoenix.Component

  attr :href, :string, default: nil, doc: "Link URL"
  attr :navigate, :string, default: nil, doc: "LiveView navigation path"
  attr :patch, :string, default: nil, doc: "LiveView patch path"

  attr :variant, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :underline],
    doc: "Link variant"

  attr :external, :boolean, default: false, doc: "External link (opens in new tab)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def link(assigns) do
    variant_classes = %{
      default: "text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300",
      primary:
        "text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 font-semibold",
      secondary: "text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-300",
      underline: "text-blue-600 dark:text-blue-400 hover:underline"
    }

    assigns =
      assigns
      |> assign(:variant_class, variant_classes[assigns.variant])
      |> assign(:target, if(assigns.external, do: "_blank", else: nil))
      |> assign(:rel, if(assigns.external, do: "noopener noreferrer", else: nil))

    ~H"""
    <%= cond do %>
      <% @navigate -> %>
        <Phoenix.Component.link
          navigate={@navigate}
          class={["transition-colors", @variant_class, @class]}
          {@rest}
        >
          {render_slot(@inner_block)}
        </Phoenix.Component.link>
      <% @patch -> %>
        <Phoenix.Component.link
          patch={@patch}
          class={["transition-colors", @variant_class, @class]}
          {@rest}
        >
          {render_slot(@inner_block)}
        </Phoenix.Component.link>
      <% @href -> %>
        <a
          href={@href}
          target={@target}
          rel={@rel}
          class={["transition-colors", @variant_class, @class]}
          {@rest}
        >
          {render_slot(@inner_block)}
        </a>
      <% true -> %>
        <span class={[@variant_class, @class]} {@rest}>{render_slot(@inner_block)}</span>
    <% end %>
    """
  end
end
