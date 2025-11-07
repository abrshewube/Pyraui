defmodule Pyraui.Components.Toast do
  @moduledoc """
  Toast component for displaying temporary notifications.

  ## Examples

      <.toast variant="success">Operation successful!</.toast>
      <.toast variant="error" position="top-end">Something went wrong</.toast>
      <.toast variant="info" dismissible={true}>Information message</.toast>
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PyrauiWeb.CoreComponents

  attr :id, :string, default: nil
  attr :variant, :atom, default: :info, values: [:info, :success, :warning, :error]

  attr :position, :atom,
    default: :top_end,
    values: [
      :top_start,
      :top_center,
      :top_end,
      :middle_start,
      :middle_center,
      :middle_end,
      :bottom_start,
      :bottom_center,
      :bottom_end
    ],
    doc: "Position of the toast on screen"

  attr :dismissible, :boolean, default: true

  attr :duration, :integer,
    default: 5000,
    doc: "Auto-dismiss duration in milliseconds (0 to disable)"

  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def toast(assigns) do
    id = assigns.id || "toast-#{System.unique_integer([:positive])}"

    variant_classes = %{
      info: "alert-info",
      success: "alert-success",
      warning: "alert-warning",
      error: "alert-error"
    }

    position_classes = %{
      top_start: "toast-top toast-start",
      top_center: "toast-top toast-center",
      top_end: "toast-top toast-end",
      middle_start: "toast-middle toast-start",
      middle_center: "toast-middle toast-center",
      middle_end: "toast-middle toast-end",
      bottom_start: "toast-bottom toast-start",
      bottom_center: "toast-bottom toast-center",
      bottom_end: "toast-bottom toast-end"
    }

    icon_names = %{
      info: "hero-information-circle",
      success: "hero-check-circle",
      warning: "hero-exclamation-triangle",
      error: "hero-exclamation-circle"
    }

    assigns =
      assigns
      |> assign(:id, id)
      |> assign(:variant_class, variant_classes[assigns.variant])
      |> assign(:position_class, position_classes[assigns.position])
      |> assign(:icon_name, icon_names[assigns.variant])
      |> assign(:auto_hide, assigns.duration > 0)

    ~H"""
    <div
      id={@id}
      class={["toast z-50", @position_class, @class]}
      phx-mounted={
        if @auto_hide, do: JS.hide(to: "##{@id}", time: @duration, transition: "fade-out-scale")
      }
      {@rest}
    >
      <div class={["alert w-80 sm:w-96 max-w-80 sm:max-w-96 text-wrap", @variant_class]}>
        <.icon name={@icon_name} class="size-5 shrink-0" />
        <div class="flex-1">{render_slot(@inner_block)}</div>

        <%= if @dismissible do %>
          <button
            type="button"
            class="group self-start cursor-pointer"
            aria-label="close"
            phx-click={JS.hide(to: "##{@id}", transition: "fade-out-scale")}
          >
            <.icon name="hero-x-mark" class="size-5 opacity-40 group-hover:opacity-70" />
          </button>
        <% end %>
      </div>
    </div>
    """
  end
end
