# Live Chat Component Spotlight

`Pyraui.Components.LiveChat` turns any LiveView into a polished support or collaboration surface—complete with typing indicators, quick replies, and glassmorphism styling.

> Live demo: [`/docs/live-chat`](http://localhost:4000/docs/live-chat)

## Anatomy

```elixir
attr :id, :string, required: true
attr :messages, :list, default: []
attr :current_user, :any
attr :typing_users, :list, default: []
attr :placeholder, :string, default: "Type a message..."
slot :header
slot :toolbar
slot :message
```

### Built-in features

- Frosted-glass shell with gradient accents
- Auto-scrolls on new messages via `LiveChatHook`
- Typing indicator strip with animated dots
- Composer with optional toolbar macro buttons
- Custom `:message` slot if you need complete control over each bubble

## Rendering conversation history

```heex
<.live_chat
  id="support-chat"
  messages={@messages}
  current_user={@current_user_id}
  typing_users={@typing}
>
  <:header>
    <.badge icon="sparkles" variant={:gradient}>Premium Support</.badge>
    <h3 class="mt-3 text-lg font-semibold">Ava Stone</h3>
    <p class="text-xs text-slate-500">Response time &lt; 2 minutes</p>
  </:header>

  <:toolbar>
    <button phx-click="chat-quick-reply" phx-value-text="Can you share the Tailwind tokens?">Tailwind tokens</button>
    <button phx-click="chat-quick-reply" phx-value-text="Do you have a dark theme preset?">Dark theme tips</button>
  </:toolbar>
</.live_chat>
```

Messages are maps with `:text`, `:user_id`, optional `:user_name`, and `:timestamp`. The component handles alignments, gradients, and timestamps automatically.

## Handling events in LiveView

```elixir
def handle_event("chat-send", %{"id" => "support-chat", "message" => message}, socket) do
  trimmed = String.trim(message || "")

  if trimmed == "" do
    {:noreply, socket}
  else
    socket =
      socket
      |> append_message(:"support-chat_messages", %{
        text: trimmed,
        user_id: socket.assigns.current_user_id,
        user_name: "You"
      })
      |> assign(:typing, [])

    Process.send_after(self(), {:bot_typing, "support-chat"}, 400)
    Process.send_after(self(), {:bot_reply, "support-chat"}, 1200)

    {:noreply, socket}
  end
end

def handle_event("chat-quick-reply", %{"id" => "support-chat", "text" => text}, socket) do
  handle_event("chat-send", %{"id" => "support-chat", "message" => text}, socket)
end
```

And the corresponding `handle_info` callbacks:

```elixir
def handle_info({:bot_typing, "support-chat"}, socket) do
  {:noreply, assign(socket, :typing, ["Ava Stone"])}
end

def handle_info({:bot_reply, "support-chat"}, socket) do
  reply = Enum.random(@bot_reply_templates)

  socket =
    socket
    |> assign(:typing, [])
    |> append_message(:"support-chat_messages", %{
      text: reply,
      user_id: "ava",
      user_name: "Ava Stone"
    })

  {:noreply, socket}
end
```

`append_message/2` is a tiny helper that grabs the existing list from assigns, appends the new map, and returns the socket.

## Custom bubble layout

Use the `:message` slot if you want more control:

```heex
<.live_chat ...>
  <:message :let={msg}>
    <div class={if msg.user_id == @current_user, do: "text-right", else: "text-left"}>
      <div class="inline-flex max-w-lg items-start gap-3">
        <%= if msg.user_id != @current_user do %>
          <.avatar label={msg.user_name} />
        <% end %>
        <div class="rounded-2xl bg-white/90 px-4 py-3 shadow">
          <p class="text-sm text-slate-700">{msg.text}</p>
          <span class="mt-2 block text-[0.65rem] uppercase tracking-wide text-slate-400">
            {Calendar.strftime(msg.timestamp, "%H:%M")}
          </span>
        </div>
      </div>
    </div>
  </:message>
</.live_chat>
```

## Styling & theming

- Override bubble colors by passing `class` to `live_chat` (`class="bg-slate-900 text-slate-100"`).
- Want dark mode? Pair the chat with `/docs/theme-switch` for a cohesive experience.
- The shell uses CSS backdrop blur; if you target older browsers, set `class="backdrop-blur-0"` to disable it.

For a fully working example (complete with quick replies and rolling message history) clone the repo and open the `/docs/live-chat` page inside the playground.

