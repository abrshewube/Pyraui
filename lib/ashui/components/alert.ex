defmodule Ashui.Components.Alert do
  @moduledoc """
  ARIA-friendly alert component for displaying important messages to users.

  ## Examples

      <.alert variant={:info} title="Information" message="This is an info alert" />
      <.alert variant={:error} dismissible={true} />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  alias Phoenix.LiveView.JS

  attr :id, :string, default: nil, doc: "Unique ID for the alert"

  attr :variant, :atom,
    default: :info,
    values: [:info, :success, :warning, :error],
    doc: "Alert variant"

  attr :title, :string, default: nil, doc: "Alert title"
  attr :message, :string, default: nil, doc: "Alert message"
  attr :dismissible, :boolean, default: false, doc: "Allow dismissing the alert"
  attr :role, :string, default: "alert", doc: "ARIA role"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, doc: "Custom alert content"

  def alert(assigns) do
    variant_classes = %{
      info:
        "bg-blue-50 border-blue-200 text-blue-800 dark:bg-blue-900 dark:border-blue-700 dark:text-blue-200",
      success:
        "bg-green-50 border-green-200 text-green-800 dark:bg-green-900 dark:border-green-700 dark:text-green-200",
      warning:
        "bg-yellow-50 border-yellow-200 text-yellow-800 dark:bg-yellow-900 dark:border-yellow-700 dark:text-yellow-200",
      error:
        "bg-red-50 border-red-200 text-red-800 dark:bg-red-900 dark:border-red-700 dark:text-red-200"
    }

    icon_names = %{
      info: "hero-information-circle",
      success: "hero-check-circle",
      warning: "hero-exclamation-triangle",
      error: "hero-x-circle"
    }

    assigns =
      assigns
      |> assign_new(:id, fn -> "alert-#{System.unique_integer([:positive])}" end)
      |> assign(:variant_class, variant_classes[assigns.variant])
      |> assign(:icon_name, icon_names[assigns.variant])

    ~H"""
    <div
      id={@id}
      role={@role}
      aria-live="polite"
      aria-atomic="true"
      class={[
        "alert border rounded-lg p-4 flex items-start space-x-3",
        @variant_class,
        @class
      ]}
      {@rest}
    >
      <div class="flex-shrink-0"><.icon name={@icon_name} class="w-5 h-5" /></div>

      <div class="flex-1 min-w-0">
        <%= if @title do %>
          <h3 class="font-semibold mb-1">{@title}</h3>
        <% end %>

        <%= if assigns[:inner_block] != [] do %>
          {render_slot(@inner_block)}
        <% else %>
          <%= if @message do %>
            <p>{@message}</p>
          <% end %>
        <% end %>
      </div>

      <%= if @dismissible do %>
        <button
          type="button"
          class="flex-shrink-0 text-current opacity-70 hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-current rounded"
          phx-click={JS.push("dismiss-alert", value: %{id: @id}) |> JS.hide(transition: "fade-out")}
          aria-label="Dismiss alert"
        >
          <.icon name="hero-x-mark" class="w-5 h-5" />
        </button>
      <% end %>
    </div>
    """
  end
end
