defmodule Pyraui.Components.Diff do
  @moduledoc """
  Diff component for side-by-side comparison of two items (text, code, etc.).

  ## Examples

      <.diff left="Old content" right="New content" />
      <.diff left={@old_code} right={@new_code} type={:code} />
  """

  use Phoenix.Component

  attr :left, :string, required: true, doc: "Left side content"
  attr :right, :string, required: true, doc: "Right side content"
  attr :left_label, :string, default: "Before", doc: "Label for left side"
  attr :right_label, :string, default: "After", doc: "Label for right side"
  attr :type, :atom, default: :text, values: [:text, :code], doc: "Content type"
  attr :class, :string, default: ""
  attr :rest, :global

  def diff(assigns) do
    ~H"""
    <div
      class={[
        "diff-container border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden",
        @class
      ]}
      {@rest}
    >
      <div class="grid grid-cols-1 md:grid-cols-2 divide-x divide-gray-200 dark:divide-gray-700">
        <!-- Left Side -->
        <div class="diff-left p-4 bg-red-50 dark:bg-red-900/20">
          <div class="text-xs font-semibold text-red-700 dark:text-red-400 mb-2 uppercase tracking-wide">
            {@left_label}
          </div>

          <div class={[
            "diff-content text-sm",
            if(@type == :code, do: "font-mono whitespace-pre-wrap", else: "")
          ]}>
            {@left}
          </div>
        </div>
        <!-- Right Side -->
        <div class="diff-right p-4 bg-green-50 dark:bg-green-900/20">
          <div class="text-xs font-semibold text-green-700 dark:text-green-400 mb-2 uppercase tracking-wide">
            {@right_label}
          </div>

          <div class={[
            "diff-content text-sm",
            if(@type == :code, do: "font-mono whitespace-pre-wrap", else: "")
          ]}>
            {@right}
          </div>
        </div>
      </div>
    </div>
    """
  end
end
