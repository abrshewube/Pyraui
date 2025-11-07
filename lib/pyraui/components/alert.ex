defmodule Pyraui.Components.Alert do
  @moduledoc """
  ARIA-friendly alert component for displaying important messages to users.

  ## Examples

      <.alert variant={:info} title="Information" message="This is an info alert" />
      <.alert variant={:error} dismissible={true} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  alias Phoenix.LiveView.JS

  attr :id, :string, default: nil, doc: "Unique ID for the alert"

  attr :variant, :atom,
    default: :info,
    values: [:info, :success, :warning, :danger, :error, :celebrate, :neutral, :note],
    doc: "Alert variant"

  attr :title, :string, default: nil, doc: "Alert title"
  attr :message, :string, default: nil, doc: "Alert message"
  attr :badge, :string, default: nil, doc: "Optional badge label displayed above the title"
  attr :icon, :string, default: nil, doc: "Override the default icon"
  attr :dismissible, :boolean, default: false, doc: "Allow dismissing the alert"
  attr :role, :string, default: "alert", doc: "ARIA role"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, doc: "Custom alert content"
  slot :actions, doc: "Action buttons rendered at the bottom of the alert"

  def alert(assigns) do
    normalized_variant = normalize_variant(assigns.variant)

    variant_styles = %{
      info: %{
        container:
          "border border-blue-400/30 bg-blue-500/10 text-blue-50 shadow-[0_12px_45px_-25px_rgba(59,130,246,0.75)]",
        glow: "bg-blue-500/20",
        accent: "from-sky-400 via-blue-500 to-indigo-500",
        icon_wrap: "bg-blue-500/15 text-blue-100 ring-1 ring-blue-400/30",
        badge: "border border-blue-300/40 bg-blue-500/15 text-blue-100"
      },
      success: %{
        container:
          "border border-emerald-400/25 bg-emerald-500/10 text-emerald-50 shadow-[0_12px_45px_-25px_rgba(16,185,129,0.6)]",
        glow: "bg-emerald-400/20",
        accent: "from-emerald-400 via-green-400 to-lime-400",
        icon_wrap: "bg-emerald-500/15 text-emerald-100 ring-1 ring-emerald-400/30",
        badge: "border border-emerald-300/40 bg-emerald-500/15 text-emerald-100"
      },
      warning: %{
        container:
          "border border-amber-400/35 bg-amber-400/10 text-amber-50 shadow-[0_12px_45px_-25px_rgba(251,191,36,0.55)]",
        glow: "bg-amber-400/20",
        accent: "from-amber-400 via-orange-400 to-yellow-400",
        icon_wrap: "bg-amber-400/15 text-amber-100 ring-1 ring-amber-300/30",
        badge: "border border-amber-300/40 bg-amber-400/15 text-amber-100"
      },
      danger: %{
        container:
          "border border-rose-500/30 bg-rose-500/10 text-rose-50 shadow-[0_12px_45px_-25px_rgba(244,63,94,0.6)]",
        glow: "bg-rose-500/20",
        accent: "from-rose-500 via-red-500 to-pink-500",
        icon_wrap: "bg-rose-500/15 text-rose-100 ring-1 ring-rose-400/30",
        badge: "border border-rose-300/40 bg-rose-500/15 text-rose-100"
      },
      celebrate: %{
        container:
          "border border-fuchsia-400/30 bg-fuchsia-500/10 text-fuchsia-50 shadow-[0_12px_45px_-25px_rgba(217,70,239,0.6)]",
        glow: "bg-fuchsia-500/20",
        accent: "from-fuchsia-400 via-purple-400 to-pink-400",
        icon_wrap: "bg-fuchsia-500/15 text-fuchsia-100 ring-1 ring-fuchsia-400/30",
        badge: "border border-fuchsia-300/40 bg-fuchsia-500/20 text-fuchsia-100"
      },
      neutral: %{
        container:
          "border border-slate-400/25 bg-slate-500/10 text-slate-100 shadow-[0_12px_45px_-25px_rgba(148,163,184,0.45)]",
        glow: "bg-slate-500/15",
        accent: "from-slate-300 via-slate-400 to-slate-600",
        icon_wrap: "bg-slate-500/15 text-slate-100 ring-1 ring-slate-400/30",
        badge: "border border-slate-300/35 bg-slate-600/20 text-slate-100"
      },
      note: %{
        container:
          "border border-sky-400/25 bg-sky-500/10 text-sky-50 shadow-[0_12px_45px_-25px_rgba(14,165,233,0.55)]",
        glow: "bg-sky-400/20",
        accent: "from-sky-400 via-cyan-400 to-blue-400",
        icon_wrap: "bg-sky-500/15 text-sky-100 ring-1 ring-sky-400/30",
        badge: "border border-sky-300/40 bg-sky-500/15 text-sky-100"
      }
    }

    icon_names = %{
      info: "hero-information-circle",
      success: "hero-check-badge",
      warning: "hero-exclamation-triangle",
      danger: "hero-x-circle",
      celebrate: "hero-sparkles",
      neutral: "hero-megaphone",
      note: "hero-book-open"
    }

    assigns =
      assigns
      |> assign_new(:id, fn -> "alert-#{System.unique_integer([:positive])}" end)
      |> assign(:variant_config, Map.fetch!(variant_styles, normalized_variant))
      |> assign_new(:icon, fn -> icon_names[normalized_variant] end)
      |> assign(:normalized_variant, normalized_variant)

    ~H"""
    <div
      id={@id}
      role={@role}
      aria-live="polite"
      aria-atomic="true"
      class={[
        "group/alert relative overflow-hidden rounded-xl border px-5 py-4 text-sm leading-6 backdrop-blur-md transition-all duration-200",
        @variant_config.container,
        @class
      ]}
      {@rest}
    >
      <div
        class={[
          "pointer-events-none absolute inset-0 opacity-0 transition-opacity duration-300 group-hover/alert:opacity-100",
          @variant_config.glow
        ]}
        aria-hidden="true"
      >
      </div>
      <div
        class={[
          "pointer-events-none absolute inset-y-3 left-3 w-[2px] rounded-full bg-gradient-to-b",
          @variant_config.accent
        ]}
        aria-hidden="true"
      >
      </div>

      <div class="relative z-10 flex items-start gap-4">
        <%= if @icon do %>
          <div class={[
            "flex h-9 w-9 items-center justify-center rounded-xl text-base shadow-[0_12px_30px_-20px_rgba(15,23,42,0.55)] backdrop-blur-sm",
            @variant_config.icon_wrap
          ]}>
            <.icon name={@icon} class="h-5 w-5" />
          </div>
        <% end %>

        <div class="flex-1 space-y-2 text-sm text-white/85">
          <div class="flex flex-wrap items-center gap-2">
            <%= if @badge do %>
              <span class={[
                "inline-flex items-center gap-2 rounded-full px-2.5 py-0.5 text-[0.65rem] font-semibold uppercase tracking-[0.35em]",
                @variant_config.badge
              ]}>
                <span class="h-1 w-1 rounded-full bg-white/70"></span>
                {@badge}
              </span>
            <% end %>

            <%= if @title do %>
              <h3 class="text-sm font-semibold tracking-tight text-white/95">{@title}</h3>
            <% end %>
          </div>

          <div class="space-y-1 text-[0.9rem] leading-6 text-white/80">
            <%= if assigns[:inner_block] != [] do %>
              {render_slot(@inner_block)}
            <% else %>
              <%= if @message do %>
                <p>{@message}</p>
              <% end %>
            <% end %>
          </div>

          <%= if @actions != [] do %>
            <div class="flex flex-wrap gap-2 pt-1">
              {render_slot(@actions)}
            </div>
          <% end %>
        </div>

        <%= if @dismissible do %>
          <button
            type="button"
            class="flex-shrink-0 rounded-full p-1 text-white/70 transition hover:text-white focus:outline-none focus:ring-2 focus:ring-white/40"
            phx-click={JS.push("dismiss-alert", value: %{id: @id}) |> JS.hide(transition: "fade-out")}
            aria-label="Dismiss alert"
          >
            <.icon name="hero-x-mark" class="h-4 w-4" />
          </button>
        <% end %>
      </div>
    </div>
    """
  end

  defp normalize_variant(:error), do: :danger
  defp normalize_variant(variant), do: variant
end
