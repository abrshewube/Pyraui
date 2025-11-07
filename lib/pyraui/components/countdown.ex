defmodule Pyraui.Components.Countdown do
  @moduledoc """
  Countdown timer component for events, offers, or games.

  ## Examples

      <.countdown id="sale-timer" target_date={~U[2024-12-31 23:59:59Z]} />
      <.countdown id="event-timer" target_date={@event_date} format={:detailed} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the countdown"

  attr :target_date, :any,
    required: true,
    doc: "Target date/time (DateTime, NaiveDateTime, or ISO string)"

  attr :format, :atom, default: :compact, values: [:compact, :detailed], doc: "Display format"
  attr :on_complete, :string, default: nil, doc: "Event to dispatch when countdown completes"
  attr :class, :string, default: ""
  attr :rest, :global

  def countdown(assigns) do
    target_timestamp = parse_target_date(assigns.target_date)

    assigns =
      assigns
      |> assign(:target_timestamp, target_timestamp)
      |> assign(:formatted_date, format_target_date(assigns.target_date))

    ~H"""
    <div
      id={@id}
      class={["countdown-container", @class]}
      phx-hook="CountdownHook"
      data-target-timestamp={@target_timestamp}
      data-on-complete={@on_complete}
      data-format={@format}
      {@rest}
    >
      <div class="countdown-display flex items-center justify-center space-x-2">
        <%= if @format == :detailed do %>
          <div class="countdown-item">
            <div class="countdown-value" data-unit="days">0</div>

            <div class="countdown-label text-xs text-gray-600">Days</div>
          </div>

          <div class="countdown-separator text-gray-400">:</div>
        <% end %>

        <div class="countdown-item">
          <div class="countdown-value" data-unit="hours">0</div>

          <div class="countdown-label text-xs text-gray-600">Hours</div>
        </div>

        <div class="countdown-separator text-gray-400">:</div>

        <div class="countdown-item">
          <div class="countdown-value" data-unit="minutes">0</div>

          <div class="countdown-label text-xs text-gray-600">Minutes</div>
        </div>

        <div class="countdown-separator text-gray-400">:</div>

        <div class="countdown-item">
          <div class="countdown-value" data-unit="seconds">0</div>

          <div class="countdown-label text-xs text-gray-600">Seconds</div>
        </div>
      </div>

      <%= if @format == :detailed do %>
        <div class="text-center mt-2 text-sm text-gray-500">Until {@formatted_date}</div>
      <% end %>
    </div>
    """
  end

  defp parse_target_date(%DateTime{} = dt), do: DateTime.to_unix(dt)

  defp parse_target_date(%NaiveDateTime{} = dt),
    do: DateTime.from_naive!(dt, "Etc/UTC") |> DateTime.to_unix()

  defp parse_target_date(date_string) when is_binary(date_string) do
    case DateTime.from_iso8601(date_string) do
      {:ok, dt, _} -> DateTime.to_unix(dt)
      _ -> 0
    end
  end

  defp parse_target_date(timestamp) when is_integer(timestamp), do: timestamp
  defp parse_target_date(_), do: 0

  defp format_target_date(%DateTime{} = dt), do: Calendar.strftime(dt, "%B %d, %Y at %H:%M")
  defp format_target_date(%NaiveDateTime{} = dt), do: Calendar.strftime(dt, "%B %d, %Y at %H:%M")
  defp format_target_date(date_string) when is_binary(date_string), do: date_string
  defp format_target_date(_), do: ""
end
