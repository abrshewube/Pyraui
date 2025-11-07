defmodule Pyraui.Components.Grid do
  @moduledoc """
  Grid layout component for responsive layouts using CSS Grid.

  ## Examples

      <.grid cols={3}>
        <div>Item 1</div>
        <div>Item 2</div>
        <div>Item 3</div>
      </.grid>

      <.grid cols={2} cols_md={3} cols_lg={4} gap={4}>
        <div>Item 1</div>
        <div>Item 2</div>
      </.grid>
  """

  use Phoenix.Component

  attr :cols, :integer, default: 1, doc: "Number of columns (default: 1)"
  attr :cols_sm, :integer, default: nil, doc: "Number of columns on small screens"
  attr :cols_md, :integer, default: nil, doc: "Number of columns on medium screens"
  attr :cols_lg, :integer, default: nil, doc: "Number of columns on large screens"
  attr :cols_xl, :integer, default: nil, doc: "Number of columns on extra large screens"
  attr :gap, :integer, default: 4, doc: "Gap between grid items (Tailwind gap value: 0-12)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def grid(assigns) do
    gap_class = "gap-#{assigns.gap}"

    cols_class = "grid-cols-#{assigns.cols}"

    cols_sm_class = if assigns.cols_sm, do: "sm:grid-cols-#{assigns.cols_sm}", else: ""
    cols_md_class = if assigns.cols_md, do: "md:grid-cols-#{assigns.cols_md}", else: ""
    cols_lg_class = if assigns.cols_lg, do: "lg:grid-cols-#{assigns.cols_lg}", else: ""
    cols_xl_class = if assigns.cols_xl, do: "xl:grid-cols-#{assigns.cols_xl}", else: ""

    assigns =
      assigns
      |> assign(:gap_class, gap_class)
      |> assign(:cols_class, cols_class)
      |> assign(:cols_sm_class, cols_sm_class)
      |> assign(:cols_md_class, cols_md_class)
      |> assign(:cols_lg_class, cols_lg_class)
      |> assign(:cols_xl_class, cols_xl_class)

    ~H"""
    <div
      class={[
        "grid",
        @cols_class,
        @cols_sm_class,
        @cols_md_class,
        @cols_lg_class,
        @cols_xl_class,
        @gap_class,
        @class
      ]}
      {@rest}
    >
      <slot />
    </div>
    """
  end
end
