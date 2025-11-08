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

  @cols_classes Enum.zip(1..12, ~w(grid-cols-1 grid-cols-2 grid-cols-3 grid-cols-4 grid-cols-5 grid-cols-6 grid-cols-7 grid-cols-8 grid-cols-9 grid-cols-10 grid-cols-11 grid-cols-12)) |> Map.new()
  @cols_sm_classes Enum.zip(1..12, ~w(sm:grid-cols-1 sm:grid-cols-2 sm:grid-cols-3 sm:grid-cols-4 sm:grid-cols-5 sm:grid-cols-6 sm:grid-cols-7 sm:grid-cols-8 sm:grid-cols-9 sm:grid-cols-10 sm:grid-cols-11 sm:grid-cols-12)) |> Map.new()
  @cols_md_classes Enum.zip(1..12, ~w(md:grid-cols-1 md:grid-cols-2 md:grid-cols-3 md:grid-cols-4 md:grid-cols-5 md:grid-cols-6 md:grid-cols-7 md:grid-cols-8 md:grid-cols-9 md:grid-cols-10 md:grid-cols-11 md:grid-cols-12)) |> Map.new()
  @cols_lg_classes Enum.zip(1..12, ~w(lg:grid-cols-1 lg:grid-cols-2 lg:grid-cols-3 lg:grid-cols-4 lg:grid-cols-5 lg:grid-cols-6 lg:grid-cols-7 lg:grid-cols-8 lg:grid-cols-9 lg:grid-cols-10 lg:grid-cols-11 lg:grid-cols-12)) |> Map.new()
  @cols_xl_classes Enum.zip(1..12, ~w(xl:grid-cols-1 xl:grid-cols-2 xl:grid-cols-3 xl:grid-cols-4 xl:grid-cols-5 xl:grid-cols-6 xl:grid-cols-7 xl:grid-cols-8 xl:grid-cols-9 xl:grid-cols-10 xl:grid-cols-11 xl:grid-cols-12)) |> Map.new()
  @gap_classes Enum.zip(0..12, ~w(gap-0 gap-1 gap-2 gap-3 gap-4 gap-5 gap-6 gap-7 gap-8 gap-9 gap-10 gap-11 gap-12)) |> Map.new()

  attr :cols, :integer, default: 1, doc: "Number of columns (default: 1, max 12)"
  attr :cols_sm, :integer, default: nil, doc: "Number of columns on small screens"
  attr :cols_md, :integer, default: nil, doc: "Number of columns on medium screens"
  attr :cols_lg, :integer, default: nil, doc: "Number of columns on large screens"
  attr :cols_xl, :integer, default: nil, doc: "Number of columns on extra large screens"
  attr :gap, :integer, default: 4, doc: "Gap between grid items (Tailwind gap value: 0-12)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def grid(assigns) do
    gap_class = Map.get(@gap_classes, assigns.gap, Map.fetch!(@gap_classes, 4))
    cols_class = Map.get(@cols_classes, assigns.cols, Map.fetch!(@cols_classes, 1))

    cols_sm_class =
      if assigns.cols_sm,
        do: Map.get(@cols_sm_classes, assigns.cols_sm, ""),
        else: ""

    cols_md_class =
      if assigns.cols_md,
        do: Map.get(@cols_md_classes, assigns.cols_md, ""),
        else: ""

    cols_lg_class =
      if assigns.cols_lg,
        do: Map.get(@cols_lg_classes, assigns.cols_lg, ""),
        else: ""

    cols_xl_class =
      if assigns.cols_xl,
        do: Map.get(@cols_xl_classes, assigns.cols_xl, ""),
        else: ""

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
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
