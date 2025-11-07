defmodule Pyraui.Components.BadgeCard do
  @moduledoc """
  Badge or achievement card component for gamification and progress tracking.

  ## Examples

      <.badge_card
        title="First Steps"
        description="Complete your first task"
        icon="hero-trophy"
        unlocked={true}
        progress={100}
      />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :title, :string, required: true, doc: "Badge title"
  attr :description, :string, default: nil, doc: "Badge description"
  attr :icon, :string, default: "hero-star", doc: "Icon name"
  attr :unlocked, :boolean, default: false, doc: "Whether the badge is unlocked"
  attr :progress, :integer, default: 0, doc: "Progress percentage (0-100)"

  attr :rarity, :atom,
    default: :common,
    values: [:common, :rare, :epic, :legendary],
    doc: "Badge rarity"

  attr :points, :integer, default: nil, doc: "Points awarded for this badge"
  attr :unlocked_at, :any, default: nil, doc: "Date when badge was unlocked"
  attr :class, :string, default: ""
  attr :rest, :global

  def badge_card(assigns) do
    rarity_classes = %{
      common: "border-gray-300 bg-gray-50",
      rare: "border-blue-300 bg-blue-50",
      epic: "border-purple-300 bg-purple-50",
      legendary: "border-yellow-400 bg-yellow-50"
    }

    icon_classes = %{
      common: "text-gray-600",
      rare: "text-blue-600",
      epic: "text-purple-600",
      legendary: "text-yellow-600"
    }

    assigns =
      assigns
      |> assign(:rarity_class, rarity_classes[assigns.rarity])
      |> assign(:icon_class, icon_classes[assigns.rarity])
      |> assign(:progress_percent, min(100, max(0, assigns.progress)))

    ~H"""
    <div
      class={[
        "badge-card border-2 rounded-lg p-4 transition-all",
        @rarity_class,
        if(@unlocked, do: "opacity-100", else: "opacity-60"),
        @class
      ]}
      {@rest}
    >
      <div class="flex items-start space-x-4">
        <!-- Icon -->
        <div class={[
          "flex-shrink-0 w-12 h-12 rounded-full flex items-center justify-center",
          if(@unlocked, do: "bg-white", else: "bg-gray-200")
        ]}>
          <.icon
            name={@icon}
            class={"w-6 h-6 #{if(@unlocked, do: @icon_class, else: "text-gray-400")}"}
          />
        </div>
        <!-- Content -->
        <div class="flex-1 min-w-0">
          <div class="flex items-start justify-between">
            <div class="flex-1">
              <h3 class={[
                "text-base font-semibold",
                if(@unlocked, do: "text-gray-900", else: "text-gray-500")
              ]}>
                {@title}
              </h3>

              <%= if @description do %>
                <p class="text-sm text-gray-600 mt-1">{@description}</p>
              <% end %>
            </div>

            <%= if @unlocked do %>
              <span class={[
                "px-2 py-1 text-xs font-semibold rounded",
                case @rarity do
                  :common -> "bg-gray-200 text-gray-700"
                  :rare -> "bg-blue-200 text-blue-700"
                  :epic -> "bg-purple-200 text-purple-700"
                  :legendary -> "bg-yellow-200 text-yellow-700"
                end
              ]}>
                {String.capitalize(to_string(@rarity))}
              </span>
            <% end %>
          </div>
          <!-- Progress Bar -->
          <%= if !@unlocked && @progress > 0 do %>
            <div class="mt-3">
              <div class="flex items-center justify-between mb-1">
                <span class="text-xs text-gray-600">Progress</span>
                <span class="text-xs font-medium text-gray-700">{@progress_percent}%</span>
              </div>

              <div class="w-full bg-gray-200 rounded-full h-2">
                <div
                  class="bg-blue-600 h-2 rounded-full transition-all duration-300"
                  style={"width: #{@progress_percent}%"}
                >
                </div>
              </div>
            </div>
          <% end %>
          <!-- Footer Info -->
          <div class="flex items-center justify-between mt-3">
            <%= if @points do %>
              <span class="text-xs text-gray-500">
                {@points} {if @points == 1, do: "point", else: "points"}
              </span>
            <% end %>

            <%= if @unlocked && @unlocked_at do %>
              <span class="text-xs text-gray-500">Unlocked {format_date(@unlocked_at)}</span>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp format_date(nil), do: ""
  defp format_date(%DateTime{} = dt), do: Calendar.strftime(dt, "%b %d, %Y")
  defp format_date(%NaiveDateTime{} = dt), do: Calendar.strftime(dt, "%b %d, %Y")
  defp format_date(date_string) when is_binary(date_string), do: date_string
  defp format_date(_), do: ""
end
