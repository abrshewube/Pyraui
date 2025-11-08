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
          "border border-blue-200 bg-blue-50 text-blue-900 shadow-[0_18px_60px_-40px_rgba(59,130,246,0.35)]",
        glow: "bg-blue-100/40",
        accent: "from-sky-400 via-blue-400 to-indigo-400",
        icon_wrap: "bg-blue-100 text-blue-600 ring-1 ring-blue-200",
        badge: "border border-blue-200 bg-blue-50 text-blue-600"
      },
      success: %{
        container:
          "border border-emerald-200 bg-emerald-50 text-emerald-900 shadow-[0_18px_60px_-40px_rgba(16,185,129,0.3)]",
        glow: "bg-emerald-100/40",
        accent: "from-emerald-400 via-green-400 to-lime-400",
        icon_wrap: "bg-emerald-100 text-emerald-600 ring-1 ring-emerald-200",
        badge: "border border-emerald-200 bg-emerald-50 text-emerald-600"
      },
      warning: %{
        container:
          "border border-amber-200 bg-amber-50 text-amber-900 shadow-[0_18px_60px_-40px_rgba(251,191,36,0.35)]",
        glow: "bg-amber-100/40",
        accent: "from-amber-400 via-orange-400 to-yellow-400",
        icon_wrap: "bg-amber-100 text-amber-600 ring-1 ring-amber-200",
        badge: "border border-amber-200 bg-amber-50 text-amber-600"
      },
      danger: %{
        container:
          "border border-rose-200 bg-rose-50 text-rose-900 shadow-[0_18px_60px_-40px_rgba(244,63,94,0.35)]",
        glow: "bg-rose-100/40",
        accent: "from-rose-400 via-red-400 to-pink-400",
        icon_wrap: "bg-rose-100 text-rose-600 ring-1 ring-rose-200",
        badge: "border border-rose-200 bg-rose-50 text-rose-600"
      },
      celebrate: %{
        container:
          "border border-fuchsia-200 bg-fuchsia-50 text-fuchsia-900 shadow-[0_18px_60px_-40px_rgba(217,70,239,0.3)]",
        glow: "bg-fuchsia-100/40",
        accent: "from-fuchsia-400 via-purple-400 to-pink-400",
        icon_wrap: "bg-fuchsia-100 text-fuchsia-600 ring-1 ring-fuchsia-200",
        badge: "border border-fuchsia-200 bg-fuchsia-50 text-fuchsia-600"
      },
      neutral: %{
        container:
          "border border-slate-200 bg-slate-50 text-slate-900 shadow-[0_18px_60px_-40px_rgba(148,163,184,0.35)]",
        glow: "bg-slate-200/40",
        accent: "from-slate-300 via-slate-400 to-slate-500",
        icon_wrap: "bg-slate-100 text-slate-600 ring-1 ring-slate-200",
        badge: "border border-slate-200 bg-slate-50 text-slate-600"
      },
      note: %{
        container:
          "border border-sky-200 bg-sky-50 text-sky-900 shadow-[0_18px_60px_-40px_rgba(14,165,233,0.35)]",
        glow: "bg-sky-100/40",
        accent: "from-sky-400 via-cyan-400 to-blue-400",
        icon_wrap: "bg-sky-100 text-sky-600 ring-1 ring-sky-200",
        badge: "border border-sky-200 bg-sky-50 text-sky-600"
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
        "group/alert relative overflow-hidden rounded-xl border px-5 py-4 text-sm leading-6 transition-all duration-200",
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

        <div class="flex-1 space-y-2 text-sm text-slate-700">
          <div class="flex flex-wrap items-center gap-2">
            <%= if @badge do %>
              <span class={[
                "inline-flex items-center gap-2 rounded-full px-2.5 py-0.5 text-[0.65rem] font-semibold uppercase tracking-[0.35em]",
                @variant_config.badge
              ]}>
                <span class="h-1 w-1 rounded-full bg-current/60"></span>
                {@badge}
              </span>
            <% end %>

            <%= if @title do %>
              <h3 class="text-sm font-semibold tracking-tight text-slate-900">{@title}</h3>
            <% end %>
          </div>

          <div class="space-y-1 text-[0.95rem] leading-6 text-slate-600">
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
            class="flex-shrink-0 rounded-full p-1 text-slate-400 transition hover:text-slate-600 focus:outline-none focus:ring-2 focus:ring-slate-300"
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
