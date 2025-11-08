defmodule Pyraui.Components.Dock do
  @moduledoc """
  Dock / Bottom Navigation component for mobile-style bottom navigation bars.

  ## Examples

      <.dock id="main-dock">
        <:item icon="hero-home" label="Home" active={true} />
        <:item icon="hero-user" label="Profile" />
      </.dock>
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the dock"
  attr :class, :string, default: ""
  attr :position, :atom, default: :fixed, values: [:fixed, :inline]
  attr :rest, :global

  slot :item, required: true do
    attr :icon, :string, required: true
    attr :label, :string
    attr :href, :string
    attr :navigate, :string
    attr :active, :boolean
  end

  def dock(assigns) do
    assigns =
      assigns
      |> assign(:nav_classes, dock_wrapper_classes(assigns.class, assigns.position))

    ~H"""
    <nav id={@id} class={@nav_classes} {@rest}>
      <div class="flex items-center justify-around gap-1 px-3 py-2 md:gap-2 md:px-4 md:py-3">
        <%= for %{icon: icon} = item <- @item do %>
          <% active = item[:active] || false %>
          <% label = item[:label] %>
          <% item_classes = dock_item_classes(active) %>
          <% icon_classes = dock_icon_classes(active) %>
          <% content =
            assigns
            |> assign(:icon, icon)
            |> assign(:label, label)
            |> assign(:icon_classes, icon_classes)
            |> assign(:active, active) %>

          <%= cond do %>
            <% navigate = item[:navigate] -> %>
              <Phoenix.Component.link navigate={navigate} class={item_classes}>
                {dock_item_inner(content)}
              </Phoenix.Component.link>
            <% href = item[:href] -> %>
              <a href={href} class={item_classes}>
                {dock_item_inner(content)}
              </a>
            <% true -> %>
              <button type="button" class={item_classes}>
                {dock_item_inner(content)}
              </button>
          <% end %>
        <% end %>
      </div>
    </nav>
    """
  end

  defp dock_item_inner(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-0.5">
      <.icon name={@icon} class={@icon_classes} />
      <%= if @label do %>
        <span class={[
          "text-[11px] font-medium md:text-xs transition-colors",
          if(@active,
            do: "text-blue-600 dark:text-blue-300",
            else: "text-slate-600 dark:text-slate-400"
          )
        ]}>
          {@label}
        </span>
      <% end %>
    </div>
    """
  end

  defp dock_wrapper_classes(extra, position) do
    [
      "dock z-40 bg-white/95 shadow-lg shadow-slate-900/10 dark:bg-slate-900/90 dark:shadow-slate-900/40",
      dock_position_classes(position),
      extra
    ]
    |> Enum.reject(&(&1 in [nil, ""]))
    |> Enum.join(" ")
  end

  defp dock_item_classes(true) do
    [
      "dock-item flex flex-1 items-center justify-center rounded-2xl px-3 py-2 transition-all duration-200 md:px-4",
      "bg-blue-50/80 text-blue-600 shadow-inner shadow-blue-500/10 ring-1 ring-blue-300/50 dark:bg-blue-500/15 dark:text-blue-200 dark:ring-blue-400/30 scale-[1.03]"
    ]
  end

  defp dock_item_classes(false) do
    [
      "dock-item flex flex-1 items-center justify-center rounded-2xl px-3 py-2 transition-all duration-200 md:px-4",
      "text-slate-600 dark:text-slate-400 hover:bg-slate-100/80 hover:text-slate-900 dark:hover:bg-slate-800/70 dark:hover:text-slate-100"
    ]
  end

  defp dock_icon_classes(true) do
    [
      "mb-1 transition-all duration-200 scale-110 text-blue-600 dark:text-blue-300",
      "w-6 h-6 md:w-7 md:h-7"
    ]
  end

  defp dock_icon_classes(false) do
    [
      "mb-1 transition-all duration-200 scale-100 text-slate-500 dark:text-slate-400",
      "w-6 h-6 md:w-7 md:h-7"
    ]
  end

  defp dock_position_classes(:fixed),
    do: "fixed bottom-0 left-0 right-0 border-t border-slate-200/70 dark:border-slate-700/60"

  defp dock_position_classes(:inline),
    do:
      "relative mx-auto w-full max-w-xl rounded-3xl border border-white/20 bg-white/80 backdrop-blur-lg dark:border-white/10 dark:bg-slate-900/70"
end
