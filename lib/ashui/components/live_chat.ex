defmodule Ashui.Components.LiveChat do
  @moduledoc """
  Live chat component with typing indicators and real-time messaging.

  ## Examples

      <.live_chat id="chat-room" messages={@messages} current_user={@current_user} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the chat"
  attr :messages, :list, default: [], doc: "List of messages"
  attr :current_user, :any, doc: "Current user identifier"
  attr :typing_users, :list, default: [], doc: "List of users currently typing"
  attr :placeholder, :string, default: "Type a message..."
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global

  slot :message, doc: "Custom message template"

  def live_chat(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "live-chat-container flex flex-col h-full bg-white border border-gray-200 rounded-lg",
        @class
      ]}
      phx-hook="LiveChatHook"
      data-id={@id}
      {@rest}
    >
      <!-- Messages Area -->
      <div
        id={"#{@id}-messages"}
        class="flex-1 overflow-y-auto p-4 space-y-4"
      >
        <div
          :for={{message, index} <- Enum.with_index(@messages)}
          id={"message-#{index}"}
          class="message-item"
        >
          <%= if assigns[:message] != [] do %>
            {render_slot(@message, message)}
          <% else %>
            <div class={[
              "flex",
              if(Map.get(message, :user_id) == @current_user,
                do: "justify-end",
                else: "justify-start"
              )
            ]}>
              <div class={[
                "max-w-xs lg:max-w-md px-4 py-2 rounded-lg",
                if(Map.get(message, :user_id) == @current_user,
                  do: "bg-blue-600 text-white",
                  else: "bg-gray-100 text-gray-900"
                )
              ]}>
                <%= if Map.get(message, :user_name) && Map.get(message, :user_id) != @current_user do %>
                  <div class="text-xs font-semibold mb-1 opacity-75">
                    {Map.get(message, :user_name)}
                  </div>
                <% end %>

                <div class="text-sm whitespace-pre-wrap">{Map.get(message, :text, "")}</div>

                <div class="text-xs mt-1 opacity-75">{format_time(Map.get(message, :timestamp))}</div>
              </div>
            </div>
          <% end %>
        </div>
      </div>
      <!-- Typing Indicator -->
      <%= if @typing_users != [] do %>
        <div class="px-4 py-2 border-t border-gray-200 bg-gray-50">
          <div class="flex items-center space-x-2 text-sm text-gray-600">
            <div class="typing-indicator flex space-x-1">
              <div class="w-2 h-2 bg-gray-400 rounded-full animate-bounce" style="animation-delay: 0s">
              </div>

              <div
                class="w-2 h-2 bg-gray-400 rounded-full animate-bounce"
                style="animation-delay: 0.2s"
              >
              </div>

              <div
                class="w-2 h-2 bg-gray-400 rounded-full animate-bounce"
                style="animation-delay: 0.4s"
              >
              </div>
            </div>

            <span>
              {format_typing_users(@typing_users)} {if length(@typing_users) == 1,
                do: "is",
                else: "are"} typing...
            </span>
          </div>
        </div>
      <% end %>
      <!-- Input Area -->
      <div class="p-4 border-t border-gray-200">
        <form phx-submit="chat-send" phx-value-id={@id}>
          <div class="flex space-x-2">
            <input
              type="text"
              name="message"
              placeholder={@placeholder}
              class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              phx-change="chat-typing"
              phx-value-id={@id}
              phx-debounce="1000"
              disabled={@disabled}
              autocomplete="off"
            />
            <button
              type="submit"
              class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              disabled={@disabled}
            >
              Send
            </button>
          </div>
        </form>
      </div>
    </div>
    """
  end

  defp format_time(nil), do: ""
  defp format_time(%DateTime{} = dt), do: Calendar.strftime(dt, "%H:%M")

  defp format_time(timestamp) when is_integer(timestamp),
    do: format_time(DateTime.from_unix!(timestamp))

  defp format_time(_), do: ""

  defp format_typing_users([user]), do: user
  defp format_typing_users([user1, user2]), do: "#{user1} and #{user2}"

  defp format_typing_users(users),
    do: Enum.join(Enum.take(users, 2), ", ") <> " and #{length(users) - 2} others"
end
