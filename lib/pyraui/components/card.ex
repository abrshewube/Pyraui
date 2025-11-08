defmodule Pyraui.Components.Card do
  @moduledoc """
  Card component for content containers.

  ## Examples

      <.card>
        <h2>Card Title</h2>
        <p>Card content</p>
      </.card>

      <.card padded={false}>
        <img src="..." />
      </.card>
  """

  use Phoenix.Component

  attr :padded, :boolean, default: true
  attr :shadow, :atom, default: :md, values: [:none, :sm, :md, :lg, :xl]
  attr :variant, :atom, default: :solid, values: [:solid, :soft, :glass, :outline]
  attr :tone, :atom, default: :neutral, values: [:neutral, :sky, :violet, :emerald, :amber, :rose]
  attr :hoverable, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true
  slot :header
  slot :media
  slot :badge
  slot :footer
  slot :actions

  def card(assigns) do
    shadow_classes = %{
      none: "",
      sm: "shadow-sm",
      md: "shadow-[0_30px_70px_-45px_rgba(15,23,42,0.25)]",
      lg: "shadow-[0_45px_90px_-50px_rgba(59,130,246,0.28)]",
      xl: "shadow-[0_60px_120px_-55px_rgba(56,189,248,0.38)]"
    }

    variant_tokens = %{
      solid: %{
        base: "bg-white text-slate-900 border border-slate-200",
        body: "text-slate-600",
        header: "text-slate-900",
        footer_border: "border-slate-200/80",
        footer_text: "text-slate-600",
        overlay: nil
      },
      soft: %{
        base:
          "bg-gradient-to-br from-slate-50 via-white to-slate-100 text-slate-900 border border-slate-200/70",
        body: "text-slate-600",
        header: "text-slate-900",
        footer_border: "border-slate-200/70",
        footer_text: "text-slate-600",
        overlay: nil
      },
      glass: %{
        base:
          "bg-white/8 text-white border border-white/15 backdrop-blur-xl shadow-[0_45px_95px_-55px_rgba(56,189,248,0.4)]",
        body: "text-white/80",
        header: "text-white",
        footer_border: "border-white/20",
        footer_text: "text-white/80",
        overlay:
          "pointer-events-none absolute inset-0 bg-gradient-to-br from-white/15 via-white/10 to-transparent opacity-70"
      },
      outline: %{
        base: "bg-transparent text-slate-900 border-2 border-slate-200",
        body: "text-slate-600",
        header: "text-slate-900",
        footer_border: "border-slate-200/70",
        footer_text: "text-slate-600",
        overlay: nil
      }
    }

    tone_gradients = %{
      neutral: nil,
      sky: "from-sky-400 via-sky-500 to-indigo-500",
      violet: "from-violet-500 via-purple-500 to-indigo-500",
      emerald: "from-emerald-400 via-teal-400 to-sky-400",
      amber: "from-amber-400 via-orange-400 to-rose-400",
      rose: "from-rose-400 via-pink-500 to-purple-500"
    }

    badge_tokens = %{
      neutral: "bg-slate-200/80 text-slate-700",
      sky: "bg-sky-100 text-sky-700",
      violet: "bg-violet-100 text-violet-700",
      emerald: "bg-emerald-100 text-emerald-700",
      amber: "bg-amber-100 text-amber-700",
      rose: "bg-rose-100 text-rose-700"
    }

    hover_tokens = %{
      neutral: "hover:-translate-y-1 hover:shadow-[0_45px_90px_-60px_rgba(15,23,42,0.35)]",
      sky: "hover:-translate-y-1 hover:shadow-[0_45px_95px_-55px_rgba(56,189,248,0.35)]",
      violet: "hover:-translate-y-1 hover:shadow-[0_45px_95px_-55px_rgba(129,140,248,0.35)]",
      emerald: "hover:-translate-y-1 hover:shadow-[0_45px_95px_-55px_rgba(34,197,94,0.32)]",
      amber: "hover:-translate-y-1 hover:shadow-[0_45px_95px_-55px_rgba(251,191,36,0.32)]",
      rose: "hover:-translate-y-1 hover:shadow-[0_45px_95px_-55px_rgba(244,63,94,0.34)]"
    }

    variant_data = variant_tokens[assigns.variant]

    assigns =
      assigns
      |> assign(:variant_data, variant_data)
      |> assign(:shadow_class, shadow_classes[assigns.shadow])
      |> assign(:tone_line_class, tone_gradients[assigns.tone])
      |> assign(:badge_class, badge_tokens[assigns.tone])
      |> assign(
        :hover_class,
        if(assigns.hoverable,
          do: ["transition-all duration-300 ease-out", hover_tokens[assigns.tone]],
          else: "transition-all duration-300 ease-out"
        )
      )
      |> assign(:has_header?, assigns.header != [])
      |> assign(:has_actions?, assigns.actions != [])
      |> assign(:has_media?, assigns.media != [])
      |> assign(:has_footer?, assigns.footer != [])

    ~H"""
    <div
      class={[
        "relative overflow-hidden rounded-[1.75rem]",
        @variant_data.base,
        @shadow_class,
        @hover_class,
        @class
      ]}
      {@rest}
    >
      <div :if={@variant_data.overlay} class={@variant_data.overlay}></div>

      <div
        :if={@tone != :neutral}
        class={[
          "pointer-events-none absolute inset-x-8 top-0 h-1 rounded-full bg-gradient-to-r opacity-90",
          @tone_line_class
        ]}
      >
      </div>

      <div :if={@badge != []} class="absolute right-6 top-6">
        <div class={[
          "inline-flex items-center gap-2 rounded-full px-3 py-1 text-xs font-semibold shadow-sm",
          @badge_class
        ]}>
          {render_slot(@badge)}
        </div>
      </div>

      <div class={[
        "relative flex h-full w-full flex-col gap-6",
        @padded && "p-6 md:p-8"
      ]}>
        <%= if @has_media? do %>
          <div class={[
            "overflow-hidden rounded-2xl",
            @padded && "-m-1 -mt-2 md:-m-2 md:-mt-4"
          ]}>
            {render_slot(@media)}
          </div>
        <% end %>

        <%= if @has_header? or @has_actions? do %>
          <div class="flex items-start justify-between gap-4">
            <div class={["space-y-2 leading-tight", @variant_data.header]}>
              <%= for header <- @header do %>
                <div>{render_slot(header)}</div>
              <% end %>
            </div>

            <%= if @has_actions? do %>
              <div class="flex shrink-0 items-center gap-2">
                <%= for action <- @actions do %>
                  {render_slot(action)}
                <% end %>
              </div>
            <% end %>
          </div>
        <% end %>

        <div class={[
          "space-y-4 text-sm leading-relaxed",
          @variant_data.body
        ]}>
          {render_slot(@inner_block)}
        </div>

        <%= if @has_footer? do %>
          <div class={[
            "mt-auto flex items-center gap-4 border-t pt-4 text-sm font-medium",
            @variant_data.footer_border,
            @variant_data.footer_text
          ]}>
            {render_slot(@footer)}
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
