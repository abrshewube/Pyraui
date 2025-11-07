defmodule Pyraui.Components.ThemeSwitch do
  @moduledoc """
  Theme switch component for switching between dark and light modes.

  ## Examples

      <.theme_switch />
      <.theme_switch show_label={true} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :show_label, :boolean, default: false, doc: "Show label text"
  attr :label_position, :atom, default: :inline, values: [:inline, :stacked], doc: "Label layout"
  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Toggle size"

  attr :variant, :atom,
    default: :solid,
    values: [:solid, :glass, :outline, :gradient, :pill],
    doc: "Visual style"

  attr :icon_style, :atom, default: :dual, values: [:dual, :minimal, :emoji], doc: "Icon style"
  attr :hint, :string, default: nil, doc: "Optional helper text beneath the toggle"
  attr :class, :string, default: ""
  attr :rest, :global

  def theme_switch(assigns) do
    size_map = %{
      sm: %{
        track: "w-9 h-4",
        thumb: "w-3.5 h-3.5",
        base_shift: "translate-x-1",
        dark_shift: "dark:translate-x-4"
      },
      md: %{
        track: "w-12 h-6",
        thumb: "w-5 h-5",
        base_shift: "translate-x-1",
        dark_shift: "dark:translate-x-6"
      },
      lg: %{
        track: "w-16 h-8",
        thumb: "w-7 h-7",
        base_shift: "translate-x-1.5",
        dark_shift: "dark:translate-x-8"
      }
    }

    variant_map = %{
      solid: %{track: "bg-slate-200 dark:bg-slate-700", thumb: "bg-white", aura: nil},
      glass: %{
        track: "bg-white/30 dark:bg-slate-800/50 border border-white/40 backdrop-blur-sm",
        thumb: "bg-white/80 dark:bg-slate-200",
        aura: "bg-gradient-to-r from-white/20 via-white/10 to-transparent"
      },
      outline: %{
        track: "bg-transparent border border-slate-300 dark:border-slate-600",
        thumb: "bg-slate-300 dark:bg-slate-100",
        aura: "bg-gradient-to-r from-slate-200/40 via-transparent to-transparent"
      },
      gradient: %{
        track:
          "bg-gradient-to-r from-sky-400 via-indigo-500 to-purple-500 dark:from-indigo-500 dark:via-purple-500 dark:to-fuchsia-500",
        thumb: "bg-white",
        aura: "bg-gradient-to-r from-sky-400/30 via-indigo-500/20 to-transparent"
      },
      pill: %{
        track:
          "bg-slate-900/5 border border-slate-200 shadow-[inset_0_3px_12px_-8px_rgba(15,23,42,0.45)] dark:bg-white/10 dark:border-white/20",
        thumb: "bg-slate-900 dark:bg-white",
        aura: "bg-gradient-to-r from-slate-400/20 via-transparent to-transparent"
      }
    }

    assigns =
      assigns
      |> assign(:size_info, Map.fetch!(size_map, assigns.size))
      |> assign(:variant_info, Map.fetch!(variant_map, assigns.variant))
      |> assign(:label_group_class, label_group_class(assigns.show_label, assigns.label_position))
      |> assign(
        :label_helper_class,
        label_helper_class(assigns.show_label, assigns.label_position)
      )

    ~H"""
    <div class={["flex flex-col gap-2", @class]} {@rest}>
      <div class={@label_group_class}>
        <%= if @show_label && @label_position == :inline do %>
          <span class="text-sm font-medium text-slate-600 dark:text-slate-300">Light</span>
        <% end %>

        <div class="relative">
          <%= if aura_class = @variant_info.aura do %>
            <span
              class={[
                "pointer-events-none absolute inset-0 -z-10 rounded-full opacity-0 transition-opacity duration-300 group-hover/ts:opacity-90",
                aura_class
              ]}
              aria-hidden="true"
            >
            </span>
          <% end %>

          <button
            type="button"
            id="theme-toggle"
            class={[
              "group/ts relative inline-flex items-center rounded-full transition-all focus:outline-none focus:ring-2 focus:ring-sky-400 focus:ring-offset-2 focus:ring-offset-white dark:focus:ring-offset-slate-900",
              @size_info.track,
              @variant_info.track
            ]}
            phx-hook="ThemeToggleHook"
            aria-label="Toggle theme"
            role="switch"
            aria-checked="false"
          >
            <%= case @icon_style do %>
              <% :dual -> %>
                <span class="absolute inset-y-0 left-1 flex items-center text-sky-500 transition-opacity duration-300 dark:opacity-0">
                  <.icon name="hero-sun" class="h-4 w-4" />
                </span>
                <span class="absolute inset-y-0 right-1 flex items-center text-indigo-200 transition-opacity duration-300 opacity-0 dark:opacity-100">
                  <.icon name="hero-moon" class="h-4 w-4" />
                </span>
              <% :minimal -> %>
                <span class="absolute inset-y-0 left-2 flex items-center text-[0.5rem] text-slate-500 transition-opacity duration-200 dark:opacity-0">
                  •
                </span>
                <span class="absolute inset-y-0 right-2 flex items-center text-[0.5rem] text-slate-200 transition-opacity duration-200 opacity-0 dark:opacity-100">
                  •
                </span>
              <% :emoji -> %>
                <span class="absolute inset-y-0 left-1 flex items-center text-base transition-opacity duration-300 dark:opacity-0">
                  ☀️
                </span>
                <span class="absolute inset-y-0 right-1 flex items-center text-base transition-opacity duration-300 opacity-0 dark:opacity-100">
                  🌙
                </span>
            <% end %>

            <span class={[
              "inline-block rounded-full shadow-sm transition-transform duration-300",
              @size_info.thumb,
              @variant_info.thumb,
              @size_info.base_shift,
              @size_info.dark_shift
            ]}>
            </span>
          </button>
        </div>

        <%= if @show_label && @label_position == :inline do %>
          <span class="text-sm font-medium text-slate-600 dark:text-slate-300">Dark</span>
        <% end %>
      </div>

      <%= if @show_label && @label_position == :stacked do %>
        <div class="flex items-center justify-between text-xs font-medium uppercase tracking-[0.3em] text-slate-400 dark:text-slate-500">
          <span>Light</span>
          <span>Dark</span>
        </div>
      <% end %>

      <%= if @hint do %>
        <p class={@label_helper_class}>{@hint}</p>
      <% end %>
    </div>
    """
  end

  defp label_group_class(true, :stacked), do: "flex flex-col gap-3"
  defp label_group_class(_, _), do: "flex items-center gap-3"

  defp label_helper_class(true, :stacked), do: "text-xs text-slate-500 dark:text-slate-400"
  defp label_helper_class(true, :inline), do: "text-xs text-slate-500 dark:text-slate-400"
  defp label_helper_class(_, _), do: "text-xs text-slate-500 dark:text-slate-400"
end
