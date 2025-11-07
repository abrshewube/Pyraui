defmodule Pyraui.Components.SignaturePad do
  @moduledoc """
  Signature Pad / Drawing Canvas component for approvals or annotations.

  ## Examples

      <.signature_pad id="signature-pad" width={400} height={200} />
      <.signature_pad id="approval-signature" width={600} height={300} clear_label="Clear" />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the signature pad"
  attr :width, :integer, default: 400, doc: "Canvas width"
  attr :height, :integer, default: 200, doc: "Canvas height"
  attr :line_color, :string, default: "#000000", doc: "Drawing line color"
  attr :line_width, :integer, default: 2, doc: "Drawing line width"
  attr :clear_label, :string, default: "Clear", doc: "Clear button label"
  attr :class, :string, default: ""
  attr :rest, :global

  def signature_pad(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "signature-pad-container border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800",
        @class
      ]}
      phx-hook="SignaturePadHook"
      data-line-color={@line_color}
      data-line-width={@line_width}
      {@rest}
    >
      <canvas
        width={@width}
        height={@height}
        class="signature-canvas cursor-crosshair w-full h-auto border-b border-gray-300 dark:border-gray-600"
      >
      </canvas>
      <div class="p-3 flex justify-between items-center">
        <span class="text-sm text-gray-600 dark:text-gray-400">Sign above</span>
        <button
          type="button"
          class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600 rounded-lg transition-colors"
          phx-click="clear-signature"
          phx-value-id={@id}
        >
          {@clear_label}
        </button>
      </div>
      <input type="hidden" name="signature" id={"#{@id}-data"} />
    </div>
    """
  end
end
