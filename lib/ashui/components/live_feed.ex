defmodule Ashui.Components.LiveFeed do
  @moduledoc """
  Live feed component for scrollable real-time updates and notifications.

  ## Examples

      <.live_feed id="notifications" items={@notifications} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the feed"
  attr :items, :list, default: [], doc: "List of feed items"
  attr :empty_message, :string, default: "No updates yet"
  attr :auto_scroll, :boolean, default: true, doc: "Automatically scroll to new items"
  attr :max_height, :string, default: "400px", doc: "Maximum height of the feed"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :item, doc: "Custom item template"

  def live_feed(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "live-feed-container bg-white border border-gray-200 rounded-lg overflow-hidden",
        @class
      ]}
      phx-hook="LiveFeedHook"
      data-id={@id}
      data-auto-scroll={@auto_scroll}
      style={"max-height: #{@max_height};"}
      {@rest}
    >
      <div
        id={"#{@id}-feed"}
        class="overflow-y-auto p-4 space-y-3"
        style={"max-height: #{@max_height};"}
      >
        <%= if @items == [] do %>
          <div class="text-center py-8 text-gray-500">{@empty_message}</div>
        <% else %>
          <div
            :for={{item, index} <- Enum.with_index(@items)}
            id={"feed-item-#{index}"}
            class="feed-item"
          >
            <%= if assigns[:item] != [] do %>
              {render_slot(@item, item)}
            <% else %>
              <div class="flex items-start space-x-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <%= if Map.get(item, :avatar) do %>
                  <img src={Map.get(item, :avatar)} alt="" class="w-10 h-10 rounded-full" />
                <% else %>
                  <div class="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center text-white font-semibold">
                    {String.first(Map.get(item, :title, "?"))}
                  </div>
                <% end %>

                <div class="flex-1 min-w-0">
                  <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold text-gray-900">{Map.get(item, :title, "")}</p>

                    <%= if Map.get(item, :timestamp) do %>
                      <span class="text-xs text-gray-500">
                        {format_time(Map.get(item, :timestamp))}
                      </span>
                    <% end %>
                  </div>

                  <%= if Map.get(item, :content) do %>
                    <p class="text-sm text-gray-600 mt-1">{Map.get(item, :content)}</p>
                  <% end %>

                  <%= if Map.get(item, :action) do %>
                    <div class="mt-2">
                      <button
                        type="button"
                        class="text-xs text-blue-600 hover:text-blue-800 font-medium"
                        phx-click="feed-action"
                        phx-value-id={@id}
                        phx-value-item-id={Map.get(item, :id)}
                        phx-value-action={Map.get(item, :action)}
                      >
                        {Map.get(item, :action_label, "View")}
                      </button>
                    </div>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp format_time(nil), do: ""
  defp format_time(%DateTime{} = dt), do: Calendar.strftime(dt, "%H:%M")

  defp format_time(timestamp) when is_integer(timestamp),
    do: format_time(DateTime.from_unix!(timestamp))

  defp format_time(_), do: ""
end
