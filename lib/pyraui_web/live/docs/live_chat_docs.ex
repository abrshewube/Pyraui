defmodule PyrauiWeb.DocsLive.LiveChatDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    demo_messages = demo_messages()

    assigns =
      assigns
      |> assign(:chat_current_user, Map.get(assigns, :live_chat_current_user, "user-1"))
      |> assign(:chat_messages, Map.get(assigns, :"docs-chat-1_messages", demo_messages))
      |> assign(:chat_typing_users, Map.get(assigns, :"docs-chat-1_typing_users", []))

    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <h1 class="text-4xl font-bold">Live Chat</h1>
          <p class="text-lg text-slate-600">
            Real-time messaging with typing indicators, quick replies, and LiveView-powered state.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_90px_-45px_rgba(15,23,42,0.45)] space-y-6">
          <div class="grid gap-8 lg:grid-cols-[minmax(0,1fr)_18rem]">
            <div class="space-y-6">
              <div class="relative h-[28rem] overflow-hidden rounded-2xl border border-slate-200 bg-white/70 shadow-inner">
                <Pyraui.Components.LiveChat.live_chat
                  id="docs-chat-1"
                  messages={@chat_messages}
                  current_user={@chat_current_user}
                  typing_users={@chat_typing_users}
                  placeholder="Send a message to Ava..."
                >
                  <:header>
                    <div class="flex items-center justify-between">
                      <div class="flex items-center gap-3">
                        <div class="flex h-12 w-12 items-center justify-center rounded-full bg-gradient-to-br from-blue-500 via-indigo-500 to-purple-500 text-sm font-semibold text-white shadow-lg shadow-blue-500/30">
                          AS
                        </div>
                        <div>
                          <p class="text-sm font-semibold text-slate-900">Ava Stone</p>
                          <p class="text-xs text-slate-500">Senior Product Specialist · Online now</p>
                        </div>
                      </div>
                      <div class="flex items-center gap-2 text-slate-400">
                        <button
                          type="button"
                          class="rounded-xl border border-slate-200 bg-white/70 p-2 transition hover:border-slate-300 hover:text-slate-600"
                        >
                          <.icon name="hero-phone" class="h-4 w-4" />
                        </button>
                        <button
                          type="button"
                          class="rounded-xl border border-slate-200 bg-white/70 p-2 transition hover:border-slate-300 hover:text-slate-600"
                        >
                          <.icon name="hero-video-camera" class="h-4 w-4" />
                        </button>
                        <span class="inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-600">
                          <span class="h-2 w-2 rounded-full bg-emerald-500 animate-pulse"></span> Live
                        </span>
                      </div>
                    </div>
                  </:header>

                  <:toolbar>
                    <button
                      type="button"
                      phx-click="chat-quick-reply"
                      phx-value-id="docs-chat-1"
                      phx-value-text="Can you send the Tailwind tokens?"
                      class="rounded-full border border-slate-200 bg-white px-3 py-1.5 text-xs font-medium text-slate-600 transition hover:border-slate-300 hover:text-slate-900"
                    >
                      Tailwind tokens
                    </button>
                    <button
                      type="button"
                      phx-click="chat-quick-reply"
                      phx-value-id="docs-chat-1"
                      phx-value-text="Any tips for glass surfaces?"
                      class="rounded-full border border-slate-200 bg-white px-3 py-1.5 text-xs font-medium text-slate-600 transition hover:border-slate-300 hover:text-slate-900"
                    >
                      Glass tips
                    </button>
                    <button
                      type="button"
                      phx-click="chat-quick-reply"
                      phx-value-id="docs-chat-1"
                      phx-value-text="Can we make this dark mode ready?"
                      class="rounded-full border border-slate-200 bg-white px-3 py-1.5 text-xs font-medium text-slate-600 transition hover:border-slate-300 hover:text-slate-900"
                    >
                      Dark mode
                    </button>
                  </:toolbar>
                </Pyraui.Components.LiveChat.live_chat>
              </div>

              <p class="text-sm text-slate-500">
                The demo keeps conversation state inside the LiveView, streams responses, and simulates an agent reply so you can feel the real interaction cadence.
              </p>
            </div>

            <div class="hidden lg:flex flex-col gap-4 text-sm text-slate-600">
              <div class="rounded-2xl border border-slate-200 bg-slate-50 p-5">
                <h3 class="text-sm font-semibold text-slate-700">Highlights</h3>
                <ul class="mt-3 space-y-2 text-sm leading-relaxed">
                  <li class="flex gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-blue-500"></span>
                    Modern glass shell with gradient accents and subtle motion.
                  </li>
                  <li class="flex gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-blue-500"></span>
                    Live typing indicator plus quick reply macros driven by LiveView events.
                  </li>
                  <li class="flex gap-2">
                    <span class="mt-1 h-1.5 w-1.5 rounded-full bg-blue-500"></span>
                    Fully stateful example—messages stream, replies queue, and typing clears automatically.
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <div class="bg-slate-50 p-4 rounded-lg overflow-x-auto border border-slate-200">
            <pre class="text-sm text-slate-800"><code phx-no-curly-interpolation>
              &lt;.live_chat
                id="support-chat"
                messages={@chat_messages}
                current_user={@chat_current_user}
                typing_users={@chat_typing_users}
              &gt;
                &lt;:header&gt;...&lt;/:header&gt;
                &lt;:toolbar&gt;...&lt;/:toolbar&gt;
              &lt;/.live_chat&gt;
            </code></pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_90px_-45px_rgba(15,23,42,0.45)] space-y-6">
          <h2 class="text-2xl font-semibold">LiveView Wiring</h2>
          <p class="text-sm text-slate-600">
            The docs LiveView keeps per-chat state using dynamic assigns. Here’s the distilled version you can copy into your project:
          </p>
          <div class="bg-slate-900 text-slate-100">
            <pre class="overflow-x-auto p-6 text-xs leading-relaxed"><code phx-no-curly-interpolation>
              defmodule MyAppWeb.SupportLive do
                use Phoenix.LiveView

                def mount(_params, _session, socket) do
                  messages = demo_messages()

                  {:ok,
                   socket
                   |> assign(:chat_current_user, "user-1")
                   |> assign(:chat_typing_users, [])
                   |> assign(:chat_reply_index, 0)
                   |> assign(:"support-chat_messages", messages)}
                end

                def handle_event("chat-send", %{"id" => "support-chat", "message" => message}, socket) do
                  trimmed = String.trim(message || "")

                  if trimmed == "" do
                    {:noreply, socket}
                  else
                    socket =
                      socket
                      |> append_message("support-chat", %{text: trimmed, user_id: "user-1", user_name: "You"})
                      |> assign(:chat_typing_users, [])

                    Process.send_after(self(), {:show_typing, "support-chat"}, 400)
                    Process.send_after(self(), {:bot_reply, "support-chat"}, 1400)

                    {:noreply, socket}
                  end
                end

                def handle_event("chat-typing", %{"id" => "support-chat"}, socket) do
                  Process.send_after(self(), {:clear_typing, "support-chat"}, 1200)
                  {:noreply, assign(socket, :chat_typing_users, ["Support Bot"])}
                end

                def handle_event("chat-quick-reply", %{"id" => "support-chat", "text" => text}, socket) do
                  handle_event("chat-send", %{"id" => "support-chat", "message" => text}, socket)
                end

                def handle_info({:show_typing, "support-chat"}, socket) do
                  {:noreply, assign(socket, :chat_typing_users, ["Support Bot"])}
                end

                def handle_info({:clear_typing, "support-chat"}, socket) do
                  {:noreply, assign(socket, :chat_typing_users, [])}
                end

                def handle_info({:bot_reply, "support-chat"}, socket) do
                  replies = demo_replies()
                  idx = rem(socket.assigns[:chat_reply_index], length(replies))

                  socket =
                    socket
                    |> assign(:chat_reply_index, socket.assigns[:chat_reply_index] + 1)
                    |> assign(:chat_typing_users, [])
                    |> append_message("support-chat", %{
                      text: Enum.at(replies, idx),
                      user_id: "bot",
                      user_name: "Support Bot"
                    })

                  {:noreply, socket}
                end

                defp append_message(socket, id, attrs) do
                  messages = Map.get(socket.assigns, :"#{id}_messages", [])
                  assign(socket, :"#{id}_messages", messages ++ [Map.put_new(attrs, :timestamp, DateTime.utc_now())])
                end
              end
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp demo_messages do
    now = DateTime.utc_now()

    [
      %{
        user_id: "ava",
        user_name: "Ava Stone",
        text: "Welcome to PyraUI live support! 👋",
        timestamp: DateTime.add(now, -600, :second)
      },
      %{
        user_id: "ava",
        user_name: "Ava Stone",
        text: "Drop your question—I'll reply in real time with polished patterns.",
        timestamp: DateTime.add(now, -540, :second)
      },
      %{
        user_id: "user-1",
        user_name: "You",
        text: "Hey Ava! I'm trying to theme the dashboard chat area.",
        timestamp: DateTime.add(now, -420, :second)
      },
      %{
        user_id: "ava",
        user_name: "Ava Stone",
        text: "Love it. Are you targeting a light or glow surface?",
        timestamp: DateTime.add(now, -360, :second)
      }
    ]
  end
end
