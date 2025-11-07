defmodule Pyraui.Components.Badge do
  @moduledoc """
  Badge component for status indicators and labels.

  ## Examples

      <.badge variant="success">Active</.badge>
      <.badge variant="warning" size="lg">Pending</.badge>
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :variant, :atom,
    default: :neutral,
    values: [:neutral, :primary, :success, :warning, :error, :info, :highlight]

  attr :size, :atom, default: :md, values: [:sm, :md, :lg]
  attr :tone, :atom, default: :solid, values: [:solid, :soft, :outline]
  attr :pill, :boolean, default: true
  attr :icon, :string, default: nil
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def badge(assigns) do
    variant_styles = %{
      neutral: %{
        solid: "bg-slate-900 text-white",
        soft: "bg-slate-100 text-slate-700",
        outline: "bg-transparent border border-slate-300 text-slate-700"
      },
      primary: %{
        solid: "bg-sky-600 text-white",
        soft: "bg-sky-100 text-sky-700",
        outline: "bg-transparent border border-sky-200 text-sky-600"
      },
      success: %{
        solid: "bg-emerald-600 text-white",
        soft: "bg-emerald-100 text-emerald-700",
        outline: "bg-transparent border border-emerald-200 text-emerald-600"
      },
      warning: %{
        solid: "bg-amber-500 text-slate-900",
        soft: "bg-amber-100 text-amber-700",
        outline: "bg-transparent border border-amber-200 text-amber-600"
      },
      error: %{
        solid: "bg-rose-600 text-white",
        soft: "bg-rose-100 text-rose-700",
        outline: "bg-transparent border border-rose-200 text-rose-600"
      },
      info: %{
        solid: "bg-indigo-500 text-white",
        soft: "bg-indigo-100 text-indigo-700",
        outline: "bg-transparent border border-indigo-200 text-indigo-600"
      },
      highlight: %{
        solid:
          "bg-gradient-to-r from-sky-500 via-indigo-500 to-purple-500 text-white shadow-[0_10px_25px_-20px_rgba(79,70,229,0.65)]",
        soft: "bg-gradient-to-r from-sky-100 via-indigo-100 to-purple-100 text-indigo-700",
        outline: "bg-transparent border border-indigo-300 text-indigo-600"
      }
    }

    size_tokens = %{
      sm: %{padding: "px-2.5 py-1", text: "text-xs", gap: "gap-2", icon: "w-3.5 h-3.5"},
      md: %{padding: "px-3.5 py-1.5", text: "text-sm", gap: "gap-2.5", icon: "w-4 h-4"},
      lg: %{padding: "px-4 py-2", text: "text-base", gap: "gap-3", icon: "w-5 h-5"}
    }

    tone_classes = variant_styles[assigns.variant][assigns.tone]
    size_data = size_tokens[assigns.size]

    assigns =
      assigns
      |> assign(:tone_classes, tone_classes)
      |> assign(:size_data, size_data)
      |> assign(:radius_class, if(assigns.pill, do: "rounded-full", else: "rounded-md"))

    ~H"""
    <span
      class={[
        "inline-flex items-center font-semibold leading-none transition-transform duration-200",
        "shadow-sm",
        @tone_classes,
        @radius_class,
        @size_data.padding,
        @size_data.text,
        @size_data.gap,
        @class
      ]}
      {@rest}
    >
      <%= if @icon do %>
        <.icon name={@icon} class={"flex-shrink-0 #{@size_data.icon}"} />
      <% end %>
      <span class="relative z-10"><slot /></span>
    </span>
    """
  end
end
