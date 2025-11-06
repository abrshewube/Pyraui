defmodule Ashui.Components.Modal do
  @moduledoc """
  ARIA-friendly modal dialog component for overlays and confirmations.

  ## Examples

      <.modal id="confirm-modal" show={@show_modal}>
        <:title>Confirm Action</:title>
        <p>Are you sure you want to proceed?</p>
        <:footer>
          <.button variant={:secondary} phx-click="close-modal">Cancel</.button>
          <.button variant={:primary} phx-click="confirm">Confirm</.button>
        </:footer>
      </.modal>
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS

  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :size, :atom, default: :md, values: [:sm, :md, :lg, :xl]
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

    title_id = if assigns.title != [], do: "#{assigns.id}-title", else: nil
    content_id = "#{assigns.id}-content"

    assigns =
      assigns
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:title_id, title_id)
      |> assign(:content_id, content_id)

    ~H"""
    <%= if @show do %>
      <div
        id={@id}
        class="fixed inset-0 z-50 overflow-y-auto"
        phx-hook="KeyboardNavigationHook"
        data-focusable-selector="button, [href], input, select, textarea, [tabindex]:not([tabindex='-1'])"
        phx-click-away={JS.push("close-modal")}
        phx-key="escape"
        phx-window-keydown="close-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby={@title_id}
        aria-describedby={@aria_describedby || @content_id}
        aria-label={@aria_label}
        tabindex="-1"
      >
        <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
          <div
            class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-75"
            phx-click={JS.push("close-modal")}
            aria-hidden="true"
          >
          </div>

          <div class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true"></div>

          <div
            class={[
              "inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle w-full",
              @size_class,
              @class
            ]}
            {@rest}
          >
            <div class="bg-white dark:bg-gray-800 px-4 pt-5 pb-4 sm:p-6">
              <%= if assigns.title != [] do %>
                <div class="mb-4">
                  <h3 id={@title_id} class="text-lg font-medium text-gray-900 dark:text-gray-100">
                    {render_slot(@title)}
                  </h3>
                </div>
              <% end %>

              <div id={@content_id} class="mt-2 text-gray-700 dark:text-gray-300">
                {render_slot(@inner_block)}
              </div>
            </div>

            <%= if assigns.footer != [] do %>
              <div class="bg-gray-50 dark:bg-gray-700 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse gap-3">
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
