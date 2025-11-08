defmodule Pyraui.Components.LiveChat do
  @moduledoc """
  Live chat component with typing indicators and real-time messaging.

  ## Examples

      <.live_chat id="chat-room" messages={@messages} current_user={@current_user} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the chat"
  attr :messages, :list, default: [], doc: "List of messages"
  attr :current_user, :any, doc: "Current user identifier"
  attr :typing_users, :list, default: [], doc: "List of users currently typing"
  attr :placeholder, :string, default: "Type a message..."
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global

  slot :message, doc: "Custom message template"
  slot :header, doc: "Optional header shown above the message list"
  slot :toolbar, doc: "Optional toolbar rendered below the composer"

  def live_chat(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "relative flex h-full flex-col overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-[0_24px_80px_-28px_rgba(15,23,42,0.35)] backdrop-blur supports-[backdrop-filter]:bg-white/85",
        @class
      ]}
      phx-hook="LiveChatHook"
      data-id={@id}
      {@rest}
    >
      <div class="pointer-events-none absolute inset-x-0 top-0 h-32 bg-gradient-to-r from-blue-100 via-transparent to-indigo-100/70">
      </div>
      <div class="pointer-events-none absolute inset-y-0 right-0 w-32 bg-gradient-to-b from-purple-100/40 via-transparent to-transparent">
      </div>

      <%= if assigns[:header] != [] do %>
        <div class="relative z-10 border-b border-slate-200/70 bg-white/90 px-5 py-4">
          {render_slot(@header)}
        </div>
      <% end %>
      
    <!-- Messages Area -->
      <div
        id={"#{@id}-messages"}
        class="relative z-10 flex-1 overflow-y-auto px-5 py-6 space-y-4"
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
                "max-w-[22rem] rounded-2xl px-5 py-3 text-sm shadow-sm",
                if(Map.get(message, :user_id) == @current_user,
                  do:
                    "bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 text-white shadow-blue-500/30",
                  else: "bg-white/90 text-slate-900 ring-1 ring-slate-200"
                )
              ]}>
                <%= if Map.get(message, :user_name) && Map.get(message, :user_id) != @current_user do %>
                  <div class="text-xs font-semibold uppercase tracking-wide text-slate-500">
                    {Map.get(message, :user_name)}
                  </div>
                <% end %>

                <div class="mt-1 whitespace-pre-wrap leading-relaxed">
                  {Map.get(message, :text, "")}
                </div>

                <div class="mt-2 text-[0.7rem] uppercase tracking-wide text-white/70">
                  <%= if Map.get(message, :user_id) == @current_user do %>
                    {format_time(Map.get(message, :timestamp))}
                  <% else %>
                    <span class="text-slate-500">
                      {format_time(Map.get(message, :timestamp))}
                    </span>
                  <% end %>
                </div>
              </div>
            </div>
          <% end %>
        </div>
      </div>
      <!-- Typing Indicator -->
      <%= if @typing_users != [] do %>
        <div class="relative z-10 border-t border-slate-200 bg-slate-50/90 px-5 py-3">
          <div class="flex items-center gap-3 text-sm text-slate-600">
            <div class="flex gap-1">
              <div
                class="h-2.5 w-2.5 animate-bounce rounded-full bg-slate-400"
                style="animation-delay: 0s"
              >
              </div>
              <div
                class="h-2.5 w-2.5 animate-bounce rounded-full bg-slate-400"
                style="animation-delay: 0.2s"
              >
              </div>
              <div
                class="h-2.5 w-2.5 animate-bounce rounded-full bg-slate-400"
                style="animation-delay: 0.4s"
              >
              </div>
            </div>
            <span class="font-medium text-slate-500">
              {format_typing_users(@typing_users)} {if length(@typing_users) == 1,
                do: "is",
                else: "are"} typing...
            </span>
          </div>
        </div>
      <% end %>
      <!-- Input Area -->
      <div class="relative z-10 border-t border-slate-200 bg-white/95 px-5 py-4">
        <form phx-submit="chat-send" phx-value-id={@id} class="space-y-3">
          <div class="flex items-end gap-3">
            <button
              type="button"
              class="inline-flex h-11 w-11 items-center justify-center rounded-xl border border-slate-200 text-slate-500 transition-colors hover:border-slate-300 hover:text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-200 focus:ring-offset-1"
              disabled={@disabled}
            >
              <.icon name="hero-paper-clip" class="h-5 w-5" />
            </button>
            <div class="flex-1">
              <input
                type="text"
                name="message"
                placeholder={@placeholder}
                class="w-full rounded-xl border border-slate-200 bg-white/90 px-4 py-3 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-400 focus:outline-none focus:ring-2 focus:ring-blue-100"
                phx-change="chat-typing"
                phx-value-id={@id}
                phx-debounce="500"
                disabled={@disabled}
                autocomplete="off"
              />
            </div>
            <button
              type="submit"
              class="inline-flex items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 px-5 py-3 text-sm font-semibold text-white shadow-sm shadow-blue-500/40 transition hover:from-blue-500 hover:via-indigo-500 hover:to-purple-500 disabled:opacity-40"
              disabled={@disabled}
            >
              <.icon name="hero-paper-airplane" class="h-4 w-4" /> Send
            </button>
          </div>
          <%= if assigns[:toolbar] != [] do %>
            <div class="flex flex-wrap items-center gap-2 text-xs text-slate-500">
              {render_slot(@toolbar)}
            </div>
          <% end %>
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
