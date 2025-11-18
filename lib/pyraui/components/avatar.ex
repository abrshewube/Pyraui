defmodule Pyraui.Components.Avatar do
  @moduledoc """
  Avatar component for displaying user profile pictures or initials.

  ## Examples

      <.avatar src="/images/user.jpg" />
      <.avatar name="John Doe" />
      <.avatar name="JD" online={true} />
  """

  use Phoenix.Component

  attr :src, :string, default: nil, doc: "Image source URL"
  attr :name, :string, default: nil, doc: "Name for placeholder avatar (displays initials)"
  attr :size, :atom, default: :md, values: [:xs, :sm, :md, :lg, :xl], doc: "Avatar size"
  attr :online, :boolean, default: nil, doc: "Show online status indicator (true/false/nil)"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block

  def avatar(assigns) do
    size_tokens = %{
      xs: %{
        outer: "h-10 w-10",
        padding: "p-[2px]",
        text: "text-xs",
        badge_size: "h-2.5 w-2.5 border-[2px]",
        badge_position: "-bottom-0.5 -right-0.5"
      },
      sm: %{
        outer: "h-12 w-12",
        padding: "p-[3px]",
        text: "text-sm",
        badge_size: "h-3 w-3 border-[2px]",
        badge_position: "-bottom-0.5 -right-0.5"
      },
      md: %{
        outer: "h-16 w-16",
        padding: "p-[3px]",
        text: "text-base",
        badge_size: "h-3.5 w-3.5 border-[3px]",
        badge_position: "-bottom-0.5 -right-0.5"
      },
      lg: %{
        outer: "h-20 w-20",
        padding: "p-[4px]",
        text: "text-xl",
        badge_size: "h-4 w-4 border-[3px]",
        badge_position: "-bottom-1 -right-1"
      },
      xl: %{
        outer: "h-28 w-28",
        padding: "p-[6px]",
        text: "text-2xl",
        badge_size: "h-5 w-5 border-[4px]",
        badge_position: "-bottom-1 -right-1"
      }
    }

    initials =
      if assigns.name && is_nil(assigns.src) do
        assigns.name
        |> String.trim()
        |> String.split(~r/\s+/, trim: true)
        |> Enum.map(&String.first/1)
        |> Enum.join()
        |> String.upcase()
        |> String.slice(0, 2)
      end

    gradient_identifier = assigns.name || assigns.src || "pyraui-avatar"

    gradient_palette = [
      "from-sky-400 via-blue-500 to-indigo-500",
      "from-emerald-400 via-teal-500 to-cyan-400",
      "from-amber-400 via-orange-500 to-rose-500",
      "from-fuchsia-500 via-purple-500 to-indigo-500",
      "from-cyan-400 via-blue-500 to-violet-500",
      "from-rose-400 via-pink-500 to-purple-500",
      "from-lime-400 via-emerald-500 to-sky-400",
      "from-indigo-400 via-slate-500 to-slate-900"
    ]

    gradient_index = :erlang.phash2(gradient_identifier, length(gradient_palette))
    gradient_class = "bg-gradient-to-br #{Enum.at(gradient_palette, gradient_index)}"

    status =
      case assigns.online do
        true -> %{dot: "bg-emerald-400", pulse: "bg-emerald-400/40"}
        false -> %{dot: "bg-rose-400", pulse: "bg-rose-400/35"}
        _ -> nil
      end

    tokens = Map.fetch!(size_tokens, assigns.size)

    assigns =
      assigns
      |> assign(:tokens, tokens)
      |> assign(:gradient_class, gradient_class)
      |> assign(:initials, initials)
      |> assign(:status, status)
      |> assign(:slot?, assigns.inner_block != [])

    ~H"""
    <div class={["relative inline-flex", @tokens.outer, @class]} {@rest}>
      <div class={[
        "group relative inline-flex size-full items-center justify-center rounded-full shadow-[0_24px_50px_-30px_rgba(59,130,246,0.6)] transition-all duration-300 hover:-translate-y-0.5",
        @tokens.padding,
        @gradient_class
      ]}>
        <div class={[
          "relative flex size-full items-center justify-center overflow-hidden rounded-full bg-slate-950/80 text-white ring-1 ring-white/20 backdrop-blur-sm transition-all duration-300 group-hover:ring-white/50"
        ]}>
          <%= if @src do %>
            <img
              src={@src}
              alt={@name || "Avatar"}
              class="size-full rounded-full object-cover transition-transform duration-500 group-hover:scale-[1.02]"
              loading="lazy"
            />
          <% else %>
            <%= case {@initials, @slot?} do %>
              <% {initials, _} when not is_nil(initials) -> %>
                <span class={["font-semibold uppercase tracking-wide drop-shadow", @tokens.text]}>
                  {initials}
                </span>
              <% {_, true} -> %>
                <span class={["flex items-center justify-center text-white/90", @tokens.text]}>
                  {render_slot(@inner_block)}
                </span>
              <% _ -> %>
                <span class={["font-semibold uppercase tracking-wide text-white/80", @tokens.text]}>
                  ?
                </span>
            <% end %>
          <% end %>
        </div>
      </div>

      <%= if @status do %>
        <span class={[
          "pointer-events-none absolute flex items-center justify-center rounded-full border border-white/90 shadow-md shadow-slate-900/30",
          @tokens.badge_size,
          @tokens.badge_position
        ]}>
          <span class={["absolute inset-0 animate-ping rounded-full", @status.pulse]}></span>
          <span class={["relative inline-flex size-full rounded-full", @status.dot]}></span>
        </span>
      <% end %>
    </div>
    """
  end
end
