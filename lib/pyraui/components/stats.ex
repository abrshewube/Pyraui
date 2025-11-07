defmodule Pyraui.Components.Stats do
  @moduledoc """
  Stats component for displaying statistics and metrics.

  ## Examples

      <.stats>
        <.stat title="Total Users" value="1,234" desc="21% more than last month" />
        <.stat title="Revenue" value="$45,678" desc="12% increase" />
      </.stats>
  """

  use Phoenix.Component

  attr :horizontal, :boolean,
    default: true,
    doc: "Layout stats horizontally (default) or vertically"

  attr :class, :string, default: ""
  attr :rest, :global

  slot :stat, required: true do
    attr :title, :string
    attr :value, :string
    attr :desc, :string
  end

  slot :figure
  slot :actions

  def stats(assigns) do
    layout_class = if assigns.horizontal, do: "stats-horizontal", else: "stats-vertical"

    assigns = assign(assigns, :layout_class, layout_class)

    ~H"""
    <div class={["stats", @layout_class, @class]} {@rest}>
      <%= for stat <- @stat do %>
        <div class="stat">
          <%= if @figure != [] do %>
            <div class="stat-figure">{render_slot(@figure)}</div>
          <% end %>

          <%= if stat.title do %>
            <div class="stat-title">{stat.title}</div>
          <% end %>

          <%= if stat.value do %>
            <div class="stat-value">{stat.value}</div>
          <% end %>

          <%= if stat.desc do %>
            <div class="stat-desc">{stat.desc}</div>
          <% end %>

          <%= if @actions != [] do %>
            <div class="stat-actions">{render_slot(@actions)}</div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
