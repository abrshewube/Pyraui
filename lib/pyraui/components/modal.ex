defmodule Pyraui.Components.Modal do
  @moduledoc """
  ARIA-friendly modal dialog component for overlays and confirmations.

  ## Examples

      <.modal id="confirm-modal" show={@show_modal}>
        <:title>Confirm Action</:title>
        <p>Are you sure you want to proceed?</p>
        <:footer>
          <.button variant={:secondary} phx-click="close-modal" phx-value-id="confirm-modal">Cancel</.button>
          <.button variant={:primary} phx-click="confirm">Confirm</.button>
        </:footer>
      </.modal>
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS

  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :size, :atom, default: :md, values: [:sm, :md, :lg, :xl]
  attr :variant, :atom, default: :classic, values: [:classic, :glass, :danger]
  attr :aria_label, :string, default: nil, doc: "ARIA label for the modal"
  attr :aria_labelledby, :string, default: nil, doc: "ID of element that labels the modal"
  attr :aria_describedby, :string, default: nil, doc: "ID of element that describes the modal"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :title
  slot :inner_block, required: true
  slot :footer

  def modal(assigns) do
    size_classes = %{
      sm: "max-w-md",
      md: "max-w-lg",
      lg: "max-w-2xl",
      xl: "max-w-4xl"
    }

    frame_classes = %{
      classic: "bg-white dark:bg-gray-800 rounded-xl shadow-xl ring-1 ring-black/5",
      glass:
        "bg-white/70 dark:bg-gray-800/60 backdrop-blur-md rounded-xl shadow-2xl ring-1 ring-white/30 dark:ring-white/10",
      danger: "bg-white dark:bg-gray-800 rounded-xl shadow-xl ring-1 ring-rose-200"
    }

    header_classes = %{
      classic: "",
      glass: "",
      danger: "border-b border-rose-100"
    }

    title_id = if assigns.title != [], do: "#{assigns.id}-title", else: nil
    content_id = "#{assigns.id}-content"

    assigns =
      assigns
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:title_id, title_id)
      |> assign(:content_id, content_id)
      |> assign(:frame_class, frame_classes[assigns.variant])
      |> assign(:header_class, header_classes[assigns.variant])

    ~H"""
    <%= if @show do %>
      <div
        id={@id}
        class="fixed inset-0 z-50 overflow-y-auto"
        phx-hook="KeyboardNavigationHook"
        data-focusable-selector="button, [href], input, select, textarea, [tabindex]:not([tabindex='-1'])"
        phx-click-away={JS.push("close-modal", value: %{id: @id})}
        phx-key="escape"
        phx-window-keydown="close-modal"
        phx-value-id={@id}
        role="dialog"
        aria-modal="true"
        aria-labelledby={@title_id}
        aria-describedby={@aria_describedby || @content_id}
        aria-label={@aria_label}
        tabindex="-1"
      >
        <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
          <div
            class="fixed inset-0 transition-opacity bg-slate-900/70"
            phx-click={JS.push("close-modal", value: %{id: @id})}
            aria-hidden="true"
          >
          </div>

          <div class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true"></div>

          <div
            class={[
              "inline-block align-bottom text-left overflow-hidden transform transition-all sm:my-8 sm:align-middle w-full",
              @size_class,
              @frame_class,
              @class
            ]}
            {@rest}
          >
            <div class={["px-6 pt-6 pb-4", @header_class]}>
              <%= if @title != [] do %>
                <div class="mb-2">
                  <h3
                    id={@title_id}
                    class="text-xl font-semibold tracking-tight text-slate-900 dark:text-white"
                  >
                    {render_slot(@title)}
                  </h3>
                </div>
              <% end %>

              <div id={@content_id} class="mt-2 text-slate-700 dark:text-slate-200">
                {render_slot(@inner_block)}
              </div>
            </div>

            <%= if @footer != [] do %>
              <div class="bg-slate-50/80 dark:bg-slate-800/50 px-6 py-4 sm:flex sm:flex-row-reverse gap-3">
                {render_slot(@footer)}
              </div>
            <% end %>
          </div>
        </div>
      </div>
    <% end %>
    """
  end
end
