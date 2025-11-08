defmodule PyrauiWeb.DocsLive do
  use PyrauiWeb, :live_view

  alias PyrauiWeb.DocsLive.{
    GettingStartedDocs,
    InstallationDocs,
    UsageDocs,
    ButtonDocs,
    InputDocs,
    CardDocs,
    SelectDocs,
    TextareaDocs,
    CheckboxDocs,
    ProgressDocs,
    NavbarDocs,
    TabsDocs,
    BadgeDocs,
    ModalDocs,
    TableDocs,
    AccordionDocs,
    BreadcrumbsDocs,
    GridDocs,
    ListDocs,
    StatsDocs,
    AvatarDocs,
    DatepickerDocs,
    SliderDocs,
    ToastDocs,
    StepperDocs,
    ChartDocs,
    GaugeDocs,
    HeatmapDocs,
    MapDocs,
    FileUploadDocs,
    RichTextEditorDocs,
    MultiSelectDocs,
    RatingDocs,
    PasswordStrengthMeterDocs,
    TagInputDocs,
    SignaturePadDocs,
    ColorPickerDocs,
    ConditionalFormDocs,
    CarouselDocs,
    WizardDocs,
    ResizablePanelsDocs,
    FilterPanelDocs,
    SkeletonDocs,
    SkeletonLayoutDocs,
    AutocompleteDocs,
    SortableListDocs,
    LiveChatDocs,
    LiveFeedDocs,
    CountdownDocs,
    KanbanDocs,
    GanttDocs,
    LiveDataTableDocs,
    UserProfileCardDocs,
    AvatarGroupDocs,
    ConnectionsWidgetDocs,
    BadgeCardDocs,
    ThemeSwitchDocs,
    AlertDocs,
    ThemeConfigDocs,
    DiffDocs,
    KbdDocs,
    LinkDocs,
    HeroDocs,
    SwapDocs,
    DockDocs,
    DrawerDocs,
    MockupDocs,
    TimelineDocs,
    LightboxDocs,
    VideoPlayerDocs,
    AnimatedChartDocs,
    MasonryGridDocs,
    ComingSoonDocs
  }

  @impl true
  def mount(params, _session, socket) do
    section = Map.get(params, "section", "getting-started")
    component = Map.get(params, "component", nil)

    socket =
      socket
      |> assign(section: section, component: component)
      |> assign(rich_text_content: nil)
      |> assign(form: to_form(%{"content" => nil}))
      |> assign(sidebar_open: true)
      |> assign(:sample_users, sample_users())
      |> assign_section_resources(section)

    chat_messages = live_chat_default_messages()
    sortable_items = sortable_list_default_items()

    socket =
      socket
      |> assign(:live_chat_current_user, "user-1")
      |> assign(:live_chat_current_user_name, "You")
      |> assign(:live_chat_reply_index, 0)
      |> assign(:"docs-chat-1_messages", chat_messages)
      |> assign(:"docs-chat-1_typing_users", [])
      |> assign(:"docs-sortable-1_items", sortable_items)

    {:ok, socket}
  end

  defp sample_users do
    [
      %{
        name: "Ava Stone",
        avatar: "https://i.pravatar.cc/160?img=12",
        online: true
      },
      %{
        name: "Kai Morgan",
        avatar: "https://i.pravatar.cc/160?img=49",
        online: true
      },
      %{
        name: "Noah Hill",
        avatar: "https://i.pravatar.cc/160?img=33",
        online: false
      },
      %{
        name: "Evelyn Wu",
        avatar: "https://i.pravatar.cc/160?img=45",
        online: true
      },
      %{
        name: "Leo Park",
        avatar: "https://i.pravatar.cc/160?img=21",
        online: true
      },
      %{
        name: "Mila Chen",
        avatar: "https://i.pravatar.cc/160?img=56",
        online: false
      }
    ]
  end

  @impl true
  def handle_params(params, _url, socket) do
    if Map.has_key?(params, "section") do
      section = Map.get(params, "section", "getting-started")
      component = Map.get(params, "component", nil)

      {:noreply,
       socket
       |> assign(section: section, component: component)
       |> assign_section_resources(section)}
    else
      {:noreply,
       socket
       |> assign(section: "getting-started", component: nil)
       |> assign_section_resources("getting-started")
       |> push_navigate(to: ~p"/docs/getting-started")}
    end
  end

  @impl true
  def handle_event("validate", %{"content" => content}, socket) do
    {:noreply, assign(socket, rich_text_content: content)}
  end

  @impl true
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle-sidebar", _params, socket) do
    current = Map.get(socket.assigns, :sidebar_open, true)
    {:noreply, assign(socket, sidebar_open: not current)}
  end

  @impl true
  def handle_event(event, %{"ref" => ref}, socket)
      when event in ["cancel-upload", "remove-upload"] do
    {:noreply, maybe_cancel_docs_upload(socket, ref)}
  end

  @impl true
  def handle_event("update-rich-text", %{"content" => content}, socket) do
    {:noreply, assign(socket, rich_text_content: content)}
  end

  @impl true
  def handle_progress(:docs_files, entry, socket) do
    if entry.done? do
      {results, socket} =
        consume_uploaded_entries(socket, :docs_files, fn _meta, entry ->
          {:ok, %{name: entry.client_name, size: entry.client_size}}
        end)

      socket =
        update(socket, :docs_uploaded_files, fn files ->
          results ++ files
        end)

      {:noreply, socket}
    else
      {:noreply, socket}
    end
  end

  def handle_progress(_name, _entry, socket), do: {:noreply, socket}

  @impl true
  def handle_event("carousel-prev", %{"id" => id}, socket) do
    current = Map.get(socket.assigns, :"#{id}_current_slide", 0)
    new_current = max(0, current - 1)
    {:noreply, assign(socket, :"#{id}_current_slide", new_current)}
  end

  @impl true
  def handle_event("carousel-next", %{"id" => id}, socket) do
    current = Map.get(socket.assigns, :"#{id}_current_slide", 0)
    {:noreply, assign(socket, :"#{id}_current_slide", current + 1)}
  end

  @impl true
  def handle_event("carousel-go-to", %{"id" => id, "index" => index}, socket) do
    {:noreply, assign(socket, :"#{id}_current_slide", String.to_integer(index))}
  end

  @impl true
  def handle_event("wizard-prev", %{"id" => _id}, socket) do
    # Wizard navigation would need to be handled by updating step active states
    {:noreply, socket}
  end

  @impl true
  def handle_event("wizard-next", %{"id" => _id}, socket) do
    # Wizard navigation would need to be handled by updating step active states
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle-filter-panel", %{"id" => id}, socket) do
    current = Map.get(socket.assigns, :"#{id}_collapsed", false)
    {:noreply, assign(socket, :"#{id}_collapsed", !current)}
  end

  @impl true
  def handle_event("filter-changed", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("clear-filters", %{"id" => _id}, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("autocomplete-search", %{"id" => id, "value" => value}, socket) do
    # Filter options based on search value
    # In a real app, this would filter from server-side data
    {:noreply, assign(socket, :"#{id}_search_value", value)}
  end

  @impl true
  def handle_event("sortable-reorder", %{"id" => id, "order" => order}, socket) do
    order_ids = normalize_sort_order(order)
    items = Map.get(socket.assigns, :"#{id}_items", [])
    reordered_items = reorder_sortable_items(items, order_ids)

    {:noreply,
     socket
     |> assign(:"#{id}_items", reordered_items)
     |> assign(:"#{id}_order", order_ids)}
  end

  @impl true
  def handle_event("chat-send", %{"id" => "docs-chat-1", "message" => message}, socket) do
    trimmed = message |> to_string() |> String.trim()

    if trimmed == "" do
      {:noreply, socket}
    else
      socket =
        socket
        |> append_live_chat_message("docs-chat-1", %{
          text: trimmed,
          user_id: socket.assigns[:live_chat_current_user] || "user-1",
          user_name: socket.assigns[:live_chat_current_user_name] || "You"
        })
        |> assign(:"docs-chat-1_typing_users", [])

      Process.send_after(self(), {:demo_chat_show_typing, "docs-chat-1"}, 400)
      Process.send_after(self(), {:demo_chat_reply, "docs-chat-1"}, 1_400)

      {:noreply, socket}
    end
  end

  def handle_event("chat-send", _params, socket), do: {:noreply, socket}

  @impl true
  def handle_event("chat-typing", %{"id" => "docs-chat-1"}, socket) do
    Process.send_after(self(), {:clear_chat_typing, "docs-chat-1"}, 1_200)
    {:noreply, assign(socket, :"docs-chat-1_typing_users", ["Ava Stone"])}
  end

  @impl true
  def handle_event("chat-typing", _params, socket), do: {:noreply, socket}

  @impl true
  def handle_event("chat-quick-reply", %{"id" => "docs-chat-1", "text" => text}, socket) do
    trimmed = text |> to_string() |> String.trim()

    if trimmed == "" do
      {:noreply, socket}
    else
      socket =
        socket
        |> append_live_chat_message("docs-chat-1", %{
          text: trimmed,
          user_id: socket.assigns[:live_chat_current_user] || "user-1",
          user_name: socket.assigns[:live_chat_current_user_name] || "You"
        })
        |> assign(:"docs-chat-1_typing_users", [])

      Process.send_after(self(), {:demo_chat_show_typing, "docs-chat-1"}, 400)
      Process.send_after(self(), {:demo_chat_reply, "docs-chat-1"}, 1_200)

      {:noreply, socket}
    end
  end

  @impl true
  def handle_event(
        "feed-action",
        %{"id" => _id, "item-id" => _item_id, "action" => _action},
        socket
      ) do
    # Handle feed item action
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle-connection", %{"id" => _id}, socket) do
    # Handle connection toggle
    {:noreply, socket}
  end

  @impl true
  def handle_event("view-all-connections", %{"type" => _type}, socket) do
    # Handle view all connections
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle-drawer", %{"id" => id}, socket) do
    current_state = Map.get(socket.assigns, :"#{id}_open", false)
    {:noreply, assign(socket, :"#{id}_open", !current_state)}
  end

  @impl true
  def handle_event("close-drawer", %{"id" => id}, socket) do
    {:noreply, assign(socket, :"#{id}_open", false)}
  end

  @impl true
  def handle_event("open-lightbox", %{"id" => id, "index" => index}, socket) do
    images = Map.get(socket.assigns, :"#{id}_images", [])

    {:noreply,
     socket
     |> assign(:"#{id}_show", true)
     |> assign(:"#{id}_current_index", String.to_integer(index))
     |> assign(:"#{id}_images", images)}
  end

  @impl true
  def handle_event("close-lightbox", %{"id" => id}, socket) do
    {:noreply, assign(socket, :"#{id}_show", false)}
  end

  @impl true
  def handle_event("lightbox-prev", %{"id" => id}, socket) do
    current_index = Map.get(socket.assigns, :"#{id}_current_index", 0)
    new_index = max(0, current_index - 1)
    {:noreply, assign(socket, :"#{id}_current_index", new_index)}
  end

  @impl true
  def handle_event("lightbox-next", %{"id" => id}, socket) do
    current_index = Map.get(socket.assigns, :"#{id}_current_index", 0)
    images = Map.get(socket.assigns, :"#{id}_images", [])
    new_index = min(length(images) - 1, current_index + 1)
    {:noreply, assign(socket, :"#{id}_current_index", new_index)}
  end

  @impl true
  def handle_event("open-modal", %{"id" => id}, socket) do
    {:noreply, assign(socket, String.to_atom("#{id}_open"), true)}
  end

  @impl true
  def handle_event("close-modal", %{"id" => id}, socket) do
    {:noreply, assign(socket, String.to_atom("#{id}_open"), false)}
  end

  @impl true
  def handle_info({:demo_chat_show_typing, "docs-chat-1"}, socket) do
    {:noreply, assign(socket, :"docs-chat-1_typing_users", ["Ava Stone"])}
  end

  @impl true
  def handle_info({:clear_chat_typing, "docs-chat-1"}, socket) do
    {:noreply, assign(socket, :"docs-chat-1_typing_users", [])}
  end

  @impl true
  def handle_info({:demo_chat_reply, "docs-chat-1"}, socket) do
    replies = demo_chat_replies()
    reply_idx = Map.get(socket.assigns, :live_chat_reply_index, 0)
    reply = Enum.at(replies, rem(reply_idx, max(length(replies), 1)))

    socket =
      socket
      |> assign(:live_chat_reply_index, reply_idx + 1)
      |> assign(:"docs-chat-1_typing_users", [])
      |> append_live_chat_message("docs-chat-1", %{
        text: reply,
        user_id: "ava",
        user_name: "Ava Stone"
      })

    {:noreply, socket}
  end

  @impl true
  def handle_info(_msg, socket), do: {:noreply, socket}

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="relative min-h-screen overflow-hidden bg-slate-950 text-white">
        <div class="absolute inset-0 -z-10 overflow-hidden">
          <div class="absolute -top-40 -right-32 h-80 w-80 rounded-full bg-blue-500/10 blur-3xl">
          </div>

          <div class="absolute top-1/3 -left-20 h-60 w-60 rounded-full bg-purple-500/10 blur-3xl">
          </div>

          <div class="absolute bottom-0 right-1/4 h-96 w-96 rounded-full bg-cyan-500/10 blur-3xl">
          </div>

          <div class="absolute -bottom-20 left-1/3 h-64 w-64 rounded-full bg-emerald-500/10 blur-3xl">
          </div>

          <div class="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:64px_64px] [mask-image:radial-gradient(ellipse_80%_55%_at_50%_-10%,black,transparent)]">
          </div>
        </div>

        <div class="relative z-10 flex h-screen flex-col overflow-hidden">
          <header class="sticky top-0 z-30 h-20 border-b border-white/10 bg-slate-950/80 backdrop-blur">
            <div class="mx-auto flex h-full w-full max-w-7xl items-center justify-between px-6 sm:px-8 lg:px-12">
              <div class="flex items-center gap-4">
                <.link
                  navigate={~p"/"}
                  class="flex items-center gap-4 text-sm font-semibold uppercase tracking-[0.35em] text-white/90 transition hover:text-white"
                >
                  <div class="flex h-14 w-14 items-center justify-center rounded-full bg-white shadow-xl shadow-blue-500/30">
                    <img
                      src={~p"/images/pyraui-logo.png"}
                      alt="PyraUI logo"
                      class="h-11 w-11 object-contain"
                    />
                  </div>
                  PyraUI
                </.link>
                <span class="hidden text-xs font-semibold uppercase tracking-[0.35em] text-white/50 md:inline-flex">
                  Docs
                </span>
              </div>

              <nav class="hidden items-center gap-8 text-sm font-semibold text-white/70 lg:flex">
                <.link navigate={~p"/"} class="transition-colors duration-200 hover:text-white">
                  Home
                </.link>
                <.link
                  navigate={~p"/docs/getting-started"}
                  class="relative text-white transition-colors duration-200 hover:text-white"
                >
                  Docs
                  <span class="absolute -bottom-2 left-0 h-0.5 w-full scale-x-100 bg-gradient-to-r from-blue-400 via-white to-purple-400">
                  </span>
                </.link>
                <.link
                  navigate={~p"/docs/components"}
                  class="transition-colors duration-200 hover:text-white"
                >
                  Components
                </.link>
                <.link
                  navigate={~p"/docs/roadmap"}
                  class="transition-colors duration-200 hover:text-white"
                >
                  Roadmap
                </.link>
                <.link
                  href="https://demo.ashui.dev"
                  target="_blank"
                  class="transition-colors duration-200 hover:text-white"
                >
                  Playground
                </.link>
                <.link
                  href="https://github.com/AbrhamWube/ashui"
                  target="_blank"
                  class="transition-colors duration-200 hover:text-white"
                >
                  GitHub
                </.link>
              </nav>

              <div class="hidden items-center lg:flex">
                <Pyraui.Components.Button.button
                  variant={:primary}
                  size={:sm}
                  class="px-5 py-2 text-sm font-semibold shadow-lg shadow-blue-500/30 transition hover:-translate-y-0.5 hover:shadow-blue-400/40"
                  href="https://demo.ashui.dev"
                  target="_blank"
                  id="docs-header-cta"
                >
                  Launch Playground
                </Pyraui.Components.Button.button>
              </div>

              <div class="flex items-center gap-3 lg:hidden">
                <Pyraui.Components.Button.button
                  variant={:ghost}
                  size={:sm}
                  class="border border-white/20 px-4 py-2 text-xs font-semibold text-white/90 hover:bg-white/10"
                  href="https://demo.ashui.dev"
                  target="_blank"
                  id="docs-header-mobile-cta"
                >
                  Playground
                </Pyraui.Components.Button.button>
              </div>
            </div>
          </header>

          <div class="relative flex flex-1 overflow-hidden">
            <button
              :if={!@sidebar_open}
              type="button"
              phx-click="toggle-sidebar"
              class="absolute left-4 top-6 z-30 flex h-11 w-11 items-center justify-center rounded-full border border-white/15 bg-slate-950/90 text-white shadow-xl shadow-blue-500/30 transition-all duration-200 hover:-translate-y-0.5 hover:bg-slate-900/80 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-950 md:left-4 md:top-6 md:translate-x-0 md:translate-y-0"
              aria-label="Open navigation"
            >
              <.icon name="hero-bars-3" class="h-5 w-5" />
              <span class="sr-only">Open navigation</span>
            </button>

            <%= if @sidebar_open do %>
              <button
                type="button"
                phx-click="toggle-sidebar"
                class="absolute inset-x-0 top-20 bottom-0 z-20 bg-slate-900/50 backdrop-blur-sm transition-opacity duration-300 md:hidden"
                aria-label="Close navigation overlay"
              >
              </button>
            <% end %>

            <aside class={[
              "docs-sidebar absolute inset-y-0 left-0 z-30 flex h-full flex-shrink-0 flex-col overflow-hidden border-r border-white/10 bg-slate-950/90 backdrop-blur-xl transition-[transform,opacity,width] duration-300 ease-out shadow-[0_0_160px_-40px_rgba(59,130,246,0.55)] md:relative md:inset-auto md:left-auto",
              if(@sidebar_open,
                do:
                  "pointer-events-auto w-full max-w-xs translate-x-0 opacity-100 md:w-72 md:max-w-none md:translate-x-0 md:opacity-100",
                else:
                  "-translate-x-full opacity-0 pointer-events-none w-full max-w-xs md:-translate-x-full md:w-0 md:opacity-0 md:pointer-events-none"
              )
            ]}>
              <button
                type="button"
                phx-click="toggle-sidebar"
                class="absolute right-4 top-4 z-30 flex h-10 w-10 items-center justify-center rounded-full border border-white/15 bg-white/10 text-white shadow-lg shadow-blue-500/20 transition hover:bg-white/20 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-950 md:hidden"
                aria-label="Close navigation"
              >
                <.icon name="hero-x-mark" class="h-4 w-4" />
              </button>

              <button
                type="button"
                phx-click="toggle-sidebar"
                class="absolute left-full top-1/2 z-30 hidden h-11 w-11 -translate-y-1/2 translate-x-3 items-center justify-center rounded-full border border-white/15 bg-white/10 text-white shadow-xl shadow-blue-500/20 transition-all duration-200 hover:translate-x-4 hover:bg-white/20 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-950 md:flex"
                aria-label="Collapse navigation"
              >
                <.icon name="hero-chevron-left" class="h-5 w-5" />
              </button>

              <div class="flex h-full flex-col">
                <div class="absolute inset-0 -z-10 bg-gradient-to-b from-blue-600/20 via-slate-950/40 to-slate-950">
                </div>

                <div class="absolute -left-20 top-24 -z-10 h-60 w-60 rounded-full bg-cyan-500/10 blur-3xl">
                </div>

                <div class="absolute -right-16 top-40 -z-10 h-48 w-48 rounded-full bg-purple-500/15 blur-2xl">
                </div>

                <div class="px-6 pb-5 pt-6">
                  <div class="flex items-center justify-between">
                    <span class="text-xs font-semibold uppercase tracking-[0.35em] text-white/60">
                      Browse Components
                    </span>
                    <span class="text-xs text-white/40">
                      {navigation_item_count()}
                    </span>
                  </div>
                </div>

                <nav class="flex-1 overflow-y-auto px-3 pb-10">
                  <%= for item <- navigation_items() do %>
                    <.link
                      patch={~p"/docs/#{item.path}"}
                      class={[
                        "group flex items-center justify-between rounded-lg px-3 py-2 text-sm font-medium transition",
                        if(@section == item.path,
                          do:
                            "bg-gradient-to-r from-blue-600/90 via-indigo-500/90 to-purple-500/90 text-white shadow-sm shadow-blue-500/30",
                          else: "text-slate-300 hover:text-white hover:bg-white/10"
                        )
                      ]}
                    >
                      <span>{item.label}</span>
                      <.icon
                        name="hero-arrow-up-right"
                        class={
                                "h-4 w-4 " <>
                                  if(@section == item.path,
                                    do: "text-white",
                                    else: "text-slate-500 group-hover:text-slate-300"
                                  )
                              }
                      />
                    </.link>
                  <% end %>
                </nav>
              </div>
            </aside>

            <main class={main_wrapper_classes(@section)}>
              <div class={content_wrapper_classes(@section)}>{render_section(assigns)}</div>
            </main>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp navigation_sections_raw do
    [
      {"Getting Started",
       [
         %{label: "Introduction", path: "getting-started"},
         %{label: "Installation", path: "installation"},
         %{label: "Usage", path: "usage"}
       ]},
      {"Layout & Navigation",
       [
         %{label: "Navbar", path: "navbar"},
         %{label: "Tabs", path: "tabs"},
         %{label: "Breadcrumbs", path: "breadcrumbs"},
         %{label: "Accordion", path: "accordion"},
         %{label: "Grid", path: "grid"}
       ]},
      {"Data Display",
       [
         %{label: "Table", path: "table"},
         %{label: "List", path: "list"},
         %{label: "Badge", path: "badge"},
         %{label: "Stats", path: "stats"},
         %{label: "Avatar", path: "avatar"}
       ]},
      {"Forms",
       [
         %{label: "Input", path: "input"},
         %{label: "Select", path: "select"},
         %{label: "DatePicker", path: "datepicker"},
         %{label: "Slider", path: "slider"},
         %{label: "File Upload", path: "file-upload"},
         %{label: "Rich Text Editor", path: "rich-text-editor"},
         %{label: "Multi-Select", path: "multi-select"},
         %{label: "Rating", path: "rating"},
         %{label: "Password Strength Meter", path: "password-strength-meter"},
         %{label: "Tag Input", path: "tag-input"},
         %{label: "Signature Pad", path: "signature-pad"},
         %{label: "Color Picker", path: "color-picker"},
         %{label: "Conditional Form", path: "conditional-form"}
       ]},
      {"Feedback",
       [
         %{label: "Alert", path: "alert"},
         %{label: "Modal", path: "modal"},
         %{label: "Toast", path: "toast"},
         %{label: "Progress", path: "progress"}
       ]},
      {"Utilities",
       [
         %{label: "Button", path: "button"},
         %{label: "Card", path: "card"},
         %{label: "Stepper", path: "stepper"}
       ]},
      {"Layout & Utilities",
       [
         %{label: "Carousel", path: "carousel"},
         %{label: "Wizard", path: "wizard"},
         %{label: "Resizable Panels", path: "resizable-panels"},
         %{label: "Filter Panel", path: "filter-panel"},
         %{label: "Skeleton", path: "skeleton"}
       ]},
      {"Interactive",
       [
         %{label: "Autocomplete", path: "autocomplete"},
         %{label: "Sortable List", path: "sortable-list"},
         %{label: "Live Chat", path: "live-chat"},
         %{label: "Live Feed", path: "live-feed"},
         %{label: "Countdown", path: "countdown"},
         %{label: "Kanban Board", path: "kanban"},
         %{label: "Gantt Chart", path: "gantt"},
         %{label: "Live Data Table", path: "live-data-table"}
       ]},
      {"User & Social",
       [
         %{label: "User Profile Card", path: "user-profile-card"},
         %{label: "Avatar Group", path: "avatar-group"},
         %{label: "Connections Widget", path: "connections-widget"},
         %{label: "Badge Card", path: "badge-card"}
       ]},
      {"Accessibility & Theming",
       [
         %{label: "Theme Switch", path: "theme-switch"},
         %{label: "Alert", path: "alert"},
         %{label: "Theme Config", path: "theme-config"}
       ]},
      {"Miscellaneous",
       [
         %{label: "Diff", path: "diff"},
         %{label: "Kbd", path: "kbd"},
         %{label: "Link", path: "link"},
         %{label: "Hero", path: "hero"},
         %{label: "Swap", path: "swap"},
         %{label: "Dock", path: "dock"},
         %{label: "Drawer", path: "drawer"},
         %{label: "Mockup", path: "mockup"},
         %{label: "Timeline", path: "timeline"}
       ]},
      {"Visual & Presentation",
       [
         %{label: "Lightbox", path: "lightbox"},
         %{label: "Video Player", path: "video-player"},
         %{label: "Animated Chart", path: "animated-chart"},
         %{label: "Skeleton Layout", path: "skeleton-layout"},
         %{label: "Masonry Grid", path: "masonry-grid"}
       ]},
      {"Data & Analytics",
       [
         %{label: "Chart", path: "chart"},
         %{label: "Gauge", path: "gauge"},
         %{label: "Heatmap", path: "heatmap"},
         %{label: "Map", path: "map"}
       ]}
    ]
  end

  defp navigation_items do
    navigation_sections_raw()
    |> Enum.flat_map(fn {_title, items} -> items end)
    |> Enum.uniq_by(& &1.path)
    |> Enum.sort_by(&String.downcase(&1.label))
  end

  defp navigation_item_count do
    navigation_items() |> length()
  end

  defp assign_section_resources(socket, section) do
    socket
    |> maybe_assign_heatmap_samples(section)
    |> maybe_assign_animated_chart_samples(section)
    |> maybe_assign_autocomplete_samples(section)
    |> maybe_assign_live_feed_samples(section)
    |> maybe_assign_timeline_samples(section)
    |> maybe_assign_masonry_samples(section)
    |> maybe_assign_user_profile_actions(section)
    |> maybe_assign_badge_card_samples(section)
    |> maybe_assign_list_samples(section)
    |> maybe_assign_select_samples(section)
    |> maybe_assign_kanban_samples(section)
    |> maybe_assign_live_data_table_samples(section)
    |> maybe_assign_connections_samples(section)
    |> maybe_assign_gantt_samples(section)
    |> maybe_assign_countdown_samples(section)
    |> maybe_assign_drawer_samples(section)
    |> maybe_assign_lightbox_samples(section)
    |> maybe_assign_file_upload_samples(section)
  end

  defp maybe_assign_heatmap_samples(socket, "heatmap") do
    assign(socket, :sample_data, heatmap_sample_data())
  end

  defp maybe_assign_heatmap_samples(socket, _section), do: socket

  defp maybe_assign_animated_chart_samples(socket, "animated-chart") do
    {data, labels} = animated_chart_sample_data()

    socket
    |> assign(:sample_data, data)
    |> assign(:sample_labels, labels)
  end

  defp maybe_assign_animated_chart_samples(socket, _section), do: socket

  defp maybe_assign_autocomplete_samples(socket, "autocomplete") do
    assign(socket, :sample_options, autocomplete_sample_options())
  end

  defp maybe_assign_autocomplete_samples(socket, _section), do: socket

  defp maybe_assign_live_feed_samples(socket, "live-feed") do
    assign(socket, :sample_items, live_feed_sample_items())
  end

  defp maybe_assign_live_feed_samples(socket, _section), do: socket

  defp maybe_assign_timeline_samples(socket, "timeline") do
    {items, nested_items} = timeline_sample_items()

    socket
    |> assign(:sample_items, items)
    |> assign(:nested_items, nested_items)
  end

  defp maybe_assign_timeline_samples(socket, _section), do: socket

  defp maybe_assign_masonry_samples(socket, "masonry-grid") do
    assign(socket, :sample_items, masonry_grid_sample_items())
  end

  defp maybe_assign_masonry_samples(socket, _section), do: socket

  defp maybe_assign_user_profile_actions(socket, "user-profile-card") do
    assign(socket, :sample_actions, user_profile_card_sample_actions())
  end

  defp maybe_assign_user_profile_actions(socket, _section), do: socket

  defp maybe_assign_badge_card_samples(socket, "badge-card") do
    assign(socket, :demo_badges, badge_card_demo_badges())
  end

  defp maybe_assign_badge_card_samples(socket, _section), do: socket

defp maybe_assign_list_samples(socket, "list") do
  socket
  |> assign(:list_profiles, list_demo_profiles())
  |> assign(:list_activity, list_demo_activity())
end

defp maybe_assign_list_samples(socket, _section), do: socket

defp maybe_assign_select_samples(socket, "select") do
  profile_form =
    %{
      "country" => "us",
      "region" => "north_america",
      "timezone" => "utc-5"
    }
    |> to_form(as: :profile)

  filters_form =
    %{
      "status" => "active",
      "owner" => "ava-stone",
      "timezone" => ""
    }
    |> to_form(as: :filters)

  socket
  |> assign(:select_profile_form, profile_form)
  |> assign(:select_filters_form, filters_form)
  |> assign(:select_status_options, select_status_options())
  |> assign(:select_team_members, select_team_members())
  |> assign(:select_timezone_groups, select_timezone_groups())
end

defp maybe_assign_select_samples(socket, _section), do: socket

defp maybe_assign_kanban_samples(socket, "kanban") do
  {columns, metadata} = kanban_demo_data()

  socket
  |> assign(:demo_columns, columns)
  |> assign(:demo_metadata, metadata)
end

defp maybe_assign_kanban_samples(socket, _section), do: socket

defp maybe_assign_live_data_table_samples(socket, "live-data-table") do
  socket
  |> assign(:demo_rows, live_data_table_rows())
  |> assign(:demo_columns, live_data_table_columns())
  |> assign(:demo_filters, live_data_table_filters())
end

defp maybe_assign_live_data_table_samples(socket, _section), do: socket

  defp maybe_assign_connections_samples(socket, "connections-widget") do
    samples = connections_widget_demo_connections()

    socket
    |> assign(:demo_connections, samples)
    |> assign(:demo_current_user, 99)
  end

  defp maybe_assign_connections_samples(socket, _section), do: socket

defp maybe_assign_gantt_samples(socket, "gantt") do
  {tasks, start_date, end_date} = gantt_demo_data()

  socket
  |> assign(:demo_tasks, tasks)
  |> assign(:demo_start_date, start_date)
  |> assign(:demo_end_date, end_date)
end

defp maybe_assign_gantt_samples(socket, _section), do: socket

  defp maybe_assign_drawer_samples(socket, "drawer") do
    socket
    |> assign(:drawer_open_state, Map.get(socket.assigns, :"drawer-docs_open", false))
    |> assign(:drawer_open_state_right, Map.get(socket.assigns, :"drawer-docs-right_open", false))
  end

  defp maybe_assign_drawer_samples(socket, _section), do: socket

  defp maybe_assign_countdown_samples(socket, "countdown") do
    socket
    |> assign(:future_date, countdown_future_date())
    |> assign(:target_date, countdown_future_date())
  end

  defp maybe_assign_countdown_samples(socket, _section), do: socket

  defp maybe_assign_lightbox_samples(socket, "lightbox") do
    images = lightbox_sample_images()
    lightbox_id = "docs-lightbox"
    lightbox_show = Map.get(socket.assigns, :"#{lightbox_id}_show", false)
    lightbox_current_index = Map.get(socket.assigns, :"#{lightbox_id}_current_index", 0)

    socket
    |> assign(:sample_images, images)
    |> assign(:lightbox_id, lightbox_id)
    |> assign(:lightbox_show, lightbox_show)
    |> assign(:lightbox_current_index, lightbox_current_index)
    |> assign(:"#{lightbox_id}_images", images)
  end

  defp maybe_assign_lightbox_samples(socket, _section), do: socket

  defp maybe_assign_file_upload_samples(socket, "file-upload") do
    socket =
      socket
      |> allow_upload(:docs_files,
        accept: ~w(.jpg .jpeg .png .pdf .txt),
        max_entries: 4,
        max_file_size: 10_485_760,
        auto_upload: true
      )
      |> assign_new(:docs_uploaded_files, fn -> [] end)

    socket
  end

  defp maybe_assign_file_upload_samples(socket, _section), do: socket

  defp maybe_cancel_docs_upload(socket, ref) do
    uploads = socket.assigns[:uploads] || %{}

    case uploads[:docs_files] do
      nil ->
        socket

      upload ->
        entry = Enum.find(upload.entries, &(&1.ref == ref))

        socket =
          if entry do
            update(socket, :docs_uploaded_files, fn files ->
              Enum.reject(files, &(&1.name == entry.client_name))
            end)
          else
            socket
          end

        cancel_upload(socket, :docs_files, ref)
    end
  end

  defp heatmap_sample_data do
    %{
      "2024-01-01" => 5,
      "2024-01-02" => 10,
      "2024-01-03" => 15,
      "2024-01-04" => 20,
      "2024-01-05" => 25,
      "2024-01-06" => 30,
      "2024-01-07" => 35
    }
  end

  defp animated_chart_sample_data do
    {
      [10, 25, 30, 45, 50, 35, 40],
      ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    }
  end

  defp autocomplete_sample_options do
    [
      "Apple",
      "Banana",
      "Cherry",
      "Date",
      "Elderberry",
      "Fig",
      "Grape",
      "Honeydew"
    ]
  end

  defp live_feed_sample_items do
    now = DateTime.utc_now()

    [
      %{
        id: 1,
        title: "New Order",
        content: "Order #1234 has been placed",
        timestamp: now,
        action: "view",
        action_label: "View Order"
      },
      %{
        id: 2,
        title: "Payment Received",
        content: "Payment of $99.99 received",
        timestamp: now
      },
      %{
        id: 3,
        title: "User Registration",
        content: "New user registered",
        timestamp: now,
        action: "view",
        action_label: "View User"
      }
    ]
  end

  defp timeline_sample_items do
    now = DateTime.utc_now()

    items = [
      %{
        title: "Project Started",
        date: DateTime.add(now, -30, :day),
        description: "Initial project setup and planning"
      },
      %{
        title: "First Release",
        date: DateTime.add(now, -15, :day),
        description: "Version 1.0 released to production"
      },
      %{
        title: "Major Update",
        date: DateTime.add(now, -7, :day),
        description: "Added new features and improvements"
      },
      %{title: "Current", date: now, description: "Working on next version"}
    ]

    nested_items = [
      %{
        title: "Project Started",
        date: DateTime.add(now, -30, :day),
        description: "Initial project setup",
        children: [
          %{
            title: "Repository Created",
            date: DateTime.add(now, -30, :day),
            description: "GitHub repo initialized"
          },
          %{
            title: "Team Onboarded",
            date: DateTime.add(now, -28, :day),
            description: "Team members added"
          }
        ]
      },
      %{
        title: "First Release",
        date: DateTime.add(now, -15, :day),
        description: "Version 1.0 launched"
      },
      %{
        title: "Major Update",
        date: DateTime.add(now, -7, :day),
        description: "Added new features",
        children: [
          %{
            title: "Feature A",
            date: DateTime.add(now, -7, :day),
            description: "Implemented"
          },
          %{
            title: "Feature B",
            date: DateTime.add(now, -6, :day),
            description: "In progress"
          }
        ]
      }
    ]

    {items, nested_items}
  end

  defp masonry_grid_sample_items do
    [
      %{id: 1, title: "Item 1", height: "h-48"},
      %{id: 2, title: "Item 2", height: "h-64"},
      %{id: 3, title: "Item 3", height: "h-32"},
      %{id: 4, title: "Item 4", height: "h-56"},
      %{id: 5, title: "Item 5", height: "h-40"},
      %{id: 6, title: "Item 6", height: "h-72"}
    ]
  end

  defp user_profile_card_sample_actions do
    [
      %{label: "Message", variant: :primary, on_click: "message-user"},
      %{label: "Follow", variant: :outline, on_click: "follow-user"}
    ]
  end

  defp badge_card_demo_badges do
    [
      %{
        title: "First Steps",
        description: "Complete your onboarding checklist",
        icon: "hero-flag",
        unlocked: true,
        progress: 100,
        rarity: :common,
        points: 50,
        unlocked_at: ~D[2024-01-12]
      },
      %{
        title: "Collaboration Pro",
        description: "Invite five teammates to your workspace",
        icon: "hero-users",
        unlocked: false,
        progress: 60,
        rarity: :rare,
        points: 120
      },
      %{
        title: "Ship It",
        description: "Launch your first project milestone",
        icon: "hero-rocket-launch",
        unlocked: false,
        progress: 25,
        rarity: :epic,
        points: 250
      }
    ]
  end

  defp connections_widget_demo_connections do
    %{
      followers: [
        %{
          id: 1,
          name: "Ava Johnson",
          username: "ava.designs",
          avatar: "https://i.pravatar.cc/80?img=12",
          is_connected: true,
          mutual_count: 12,
          online: true,
          headline: "Principal Product Designer · GlowUI"
        },
        %{
          id: 2,
          name: "Mateo García",
          username: "mateo.codes",
          avatar: "https://i.pravatar.cc/80?img=32",
          is_connected: false,
          mutual_count: 6,
          online: false,
          headline: "Lead Frontend Engineer · Astrolytics"
        },
        %{
          id: 3,
          name: "Priya Patel",
          username: "priya.product",
          avatar: "https://i.pravatar.cc/80?img=45",
          is_connected: true,
          mutual_count: 18,
          online: true,
          headline: "Director of Product · Nimbus Labs"
        },
        %{
          id: 4,
          name: "Noah Williams",
          username: "noah.analytics",
          avatar: "https://i.pravatar.cc/80?img=57",
          is_connected: false,
          mutual_count: 3,
          online: true,
          headline: "Head of Data · Lunar Ops"
        }
      ],
      suggestions: [
        %{
          id: 11,
          name: "Aya Tanaka",
          username: "aya.motion",
          avatar: "https://i.pravatar.cc/80?img=64",
          is_connected: false,
          mutual_count: 22,
          online: true,
          headline: "Staff Motion Designer · Gravity",
          location: "Tokyo, JP"
        },
        %{
          id: 12,
          name: "Lucas Mendes",
          username: "lucas.ai",
          avatar: "https://i.pravatar.cc/80?img=70",
          is_connected: false,
          mutual_count: 15,
          online: false,
          headline: "ML Researcher · Synapse",
          location: "Lisbon, PT"
        },
        %{
          id: 13,
          name: "Zara Mehta",
          username: "zaramehta",
          avatar: "https://i.pravatar.cc/80?img=68",
          is_connected: true,
          mutual_count: 9,
          online: true,
          headline: "Growth Strategist · Bloomline",
          location: "Mumbai, IN"
        },
        %{
          id: 14,
          name: "Jonah Fields",
          username: "jonah.ops",
          avatar: "https://i.pravatar.cc/80?img=18",
          is_connected: false,
          mutual_count: 4,
          online: true,
          headline: "Site Reliability Lead · Horizon",
          location: "Seattle, US"
        },
        %{
          id: 15,
          name: "Riley Chen",
          username: "riley.ux",
          avatar: "https://i.pravatar.cc/80?img=51",
          is_connected: false,
          mutual_count: 7,
          online: false,
          headline: "UX Researcher · Coral"
        }
      ],
      team: [
        %{
          id: 21,
          name: "Lena Park",
          username: "lena.ops",
          avatar: "https://i.pravatar.cc/80?img=27",
          is_connected: true,
          mutual_count: 32,
          online: true,
          headline: "Operations Lead · Internal",
          role: "Program Operations"
        },
        %{
          id: 22,
          name: "Quinn Harper",
          username: "quinn.research",
          avatar: "https://i.pravatar.cc/80?img=74",
          is_connected: true,
          mutual_count: 21,
          online: true,
          headline: "Research Scientist · Internal",
          role: "AI Research"
        },
        %{
          id: 23,
          name: "Jude Ortega",
          username: "jude.platform",
          avatar: "https://i.pravatar.cc/80?img=14",
          is_connected: true,
          mutual_count: 17,
          online: true,
          headline: "Staff Platform Engineer · Internal",
          role: "Platform"
        },
        %{
          id: 24,
          name: "Mila Novak",
          username: "mila.brand",
          avatar: "https://i.pravatar.cc/80?img=30",
          is_connected: true,
          mutual_count: 11,
          online: false,
          headline: "Brand Producer · Internal",
          role: "Brand & Story"
        },
        %{
          id: 25,
          name: "Theo Laurent",
          username: "theo.finance",
          avatar: "https://i.pravatar.cc/80?img=36",
          is_connected: true,
          mutual_count: 8,
          online: false,
          headline: "Finance Partner · Internal",
          role: "Finance"
        },
        %{
          id: 26,
          name: "Sasha Okafor",
          username: "sasha.people",
          avatar: "https://i.pravatar.cc/80?img=41",
          is_connected: true,
          mutual_count: 20,
          online: true,
          headline: "People Ops · Internal",
          role: "People"
        }
      ]
    }
  end

defp gantt_demo_data do
  tasks = [
    %{
      id: "gantt-task-1",
      name: "Strategy & Discovery",
      start_date: ~D[2024-01-02],
      end_date: ~D[2024-01-08],
      progress: 100,
      color: "indigo"
    },
    %{
      id: "gantt-task-2",
      name: "Experience Design",
      start_date: ~D[2024-01-09],
      end_date: ~D[2024-01-15],
      progress: 65,
      color: "purple",
      dependencies: ["gantt-task-1"]
    },
    %{
      id: "gantt-task-3",
      name: "Implementation Sprint",
      start_date: ~D[2024-01-16],
      end_date: ~D[2024-01-28],
      progress: 40,
      color: "emerald",
      dependencies: ["gantt-task-2"]
    },
    %{
      id: "gantt-task-4",
      name: "QA & Launch Prep",
      start_date: ~D[2024-01-29],
      end_date: ~D[2024-02-05],
      progress: 15,
      color: "amber",
      dependencies: ["gantt-task-3"]
    }
  ]

  start_date = ~D[2024-01-01]
  end_date = ~D[2024-02-09]

  {tasks, start_date, end_date}
end

defp kanban_demo_data do
  columns = [
    %{
      id: "backlog",
      title: "Backlog",
      badge: %{label: "6", variant: :neutral},
      cards: [
        %{
          id: "card-101",
          title: "Research design system usage",
          description: "Interview 8 designers and audit current UI library.",
          assignees: demo_user_refs([12, 18]),
          tags: [%{label: "Research", color: "purple"}],
          due_date: ~D[2024-01-22],
          comments_count: 4,
          attachments_count: 2,
          progress: 40
        },
        %{
          id: "card-102",
          title: "Outline migration strategy",
          description: "Define phased rollout and communication plan.",
          assignees: demo_user_refs([9]),
          tags: [%{label: "Planning", color: "blue"}],
          due_date: ~D[2024-01-25],
          comments_count: 2,
          attachments_count: 0
        }
      ]
    },
    %{
      id: "in-progress",
      title: "In Progress",
      badge: %{label: "4", variant: :primary},
      cards: [
        %{
          id: "card-201",
          title: "Implement navigation updates",
          description: "Refine responsive behavior and micro-interactions.",
          assignees: demo_user_refs([3, 6]),
          tags: [
            %{label: "Frontend", color: "emerald"},
            %{label: "UX", color: "indigo"}
          ],
          due_date: ~D[2024-01-18],
          comments_count: 6,
          attachments_count: 3,
          progress: 65
        },
        %{
          id: "card-202",
          title: "Polish dark theme states",
          description: "Adjust contrast and state transitions for dark mode.",
          assignees: demo_user_refs([6]),
          tags: [%{label: "Design", color: "pink"}],
          due_date: ~D[2024-01-20],
          comments_count: 3,
          attachments_count: 1,
          progress: 20
        }
      ]
    },
    %{
      id: "review",
      title: "Review",
      badge: %{label: "2", variant: :warning},
      cards: [
        %{
          id: "card-301",
          title: "Accessibility audit",
          description: "Validate focus states, contrast, and semantics.",
          assignees: demo_user_refs([2, 19]),
          tags: [
            %{label: "QA", color: "amber"},
            %{label: "Accessibility", color: "emerald"}
          ],
          due_date: ~D[2024-01-17],
          comments_count: 8,
          attachments_count: 4,
          progress: 80
        }
      ]
    },
    %{
      id: "done",
      title: "Done",
      badge: %{label: "9", variant: :success},
      cards: [
        %{
          id: "card-401",
          title: "Launch design tokens v2",
          description: "Ship core palette and spacing refresh.",
          assignees: demo_user_refs([1, 7]),
          tags: [
            %{label: "Launch", color: "emerald"},
            %{label: "Design", color: "purple"}
          ],
          completed_at: ~N[2024-01-12 15:30:00],
          comments_count: 5,
          attachments_count: 2,
          progress: 100
        }
      ]
    }
  ]

  metadata = %{
    users: kanban_demo_users(),
    tags: [
      %{label: "Research", color: "purple"},
      %{label: "Planning", color: "blue"},
      %{label: "Frontend", color: "emerald"},
      %{label: "UX", color: "indigo"},
      %{label: "Design", color: "pink"},
      %{label: "QA", color: "amber"},
      %{label: "Accessibility", color: "emerald"},
      %{label: "Launch", color: "emerald"}
    ]
  }

  {columns, metadata}
end

defp demo_user_refs(ids) do
  Enum.map(ids, fn id ->
    %{id: id, avatar: "https://i.pravatar.cc/60?img=#{id}"}
  end)
end

defp kanban_demo_users do
  Enum.map(1..20, fn id ->
    %{
      id: id,
      name: "Member #{id}",
      avatar: "https://i.pravatar.cc/80?img=#{id}"
    }
  end)
end

defp list_demo_profiles do
  [
    %{
      name: "Ava Stone",
      title: "Product Design Lead",
      team: "Design Systems",
      location: "San Francisco, USA",
      avatar: "https://i.pravatar.cc/96?img=32",
      availability: "In Focus",
      focus: "Heads down until 2 PM",
      tags: ["Design Systems", "Figma Libraries"]
    },
    %{
      name: "Mateo García",
      title: "Senior Frontend Engineer",
      team: "Experience Platform",
      location: "Barcelona, Spain",
      avatar: "https://i.pravatar.cc/96?img=58",
      availability: "Reviewing PRs",
      focus: "Responding within 10 min",
      tags: ["Phoenix LiveView", "Accessibility"]
    },
    %{
      name: "Priya Patel",
      title: "Product Manager",
      team: "Growth Experiments",
      location: "Toronto, Canada",
      avatar: "https://i.pravatar.cc/96?img=47",
      availability: "Available",
      focus: "Open for syncs this afternoon",
      tags: ["Roadmapping", "Cross-functional"]
    }
  ]
end

defp live_data_table_columns do
  [
    %{id: :id, label: "ID", width: "w-20", sortable: true},
    %{id: :company, label: "Company", sortable: true, grow: true},
    %{id: :owner, label: "Owner", sortable: true},
    %{id: :status, label: "Status"},
    %{id: :progress, label: "Progress"},
    %{id: :updated_at, label: "Last Updated", sortable: true}
  ]
end

defp live_data_table_rows do
  [
    %{
      id: "row-1001",
      company: %{name: "Astral Systems", industry: "Aerospace"},
      owner: %{name: "Ava Stone", avatar: "https://i.pravatar.cc/64?img=21"},
      status: :in_progress,
      progress: 72,
      updated_at: "15 min ago",
      tags: ["Mission Control", "Gov"],
      score: 82
    },
    %{
      id: "row-1002",
      company: %{name: "Nimbus Labs", industry: "Climate Tech"},
      owner: %{name: "Mateo García", avatar: "https://i.pravatar.cc/64?img=36"},
      status: :at_risk,
      progress: 38,
      updated_at: "42 min ago",
      tags: ["Energy", "Expansion"],
      score: 64
    },
    %{
      id: "row-1003",
      company: %{name: "Lumen AI", industry: "ML Ops"},
      owner: %{name: "Priya Patel", avatar: "https://i.pravatar.cc/64?img=48"},
      status: :won,
      progress: 100,
      updated_at: "Today, 9:05 AM",
      tags: ["Enterprise", "AI"],
      score: 95
    },
    %{
      id: "row-1004",
      company: %{name: "Harborwave", industry: "Logistics"},
      owner: %{name: "Noah Hill", avatar: "https://i.pravatar.cc/64?img=14"},
      status: :contracting,
      progress: 58,
      updated_at: "Yesterday",
      tags: ["Supply Chain"],
      score: 71
    }
  ]
end

defp live_data_table_filters do
  %{
    status: [
      %{label: "In Progress", id: :in_progress},
      %{label: "Contracting", id: :contracting},
      %{label: "At Risk", id: :at_risk},
      %{label: "Won", id: :won}
    ],
    industries: ~w(Aerospace Climate Tech ML Ops Logistics Energy Enterprise Supply Chain)
  }
end

defp list_demo_activity do
  [
    %{
      id: "activity-1",
      label: "Design Review",
      description: "Navigation polish shipped to staging",
      timestamp: "6 minutes ago",
      status: :in_progress,
      icon: "hero-sparkles"
    },
    %{
      id: "activity-2",
      label: "Content Strategy",
      description: "Long-form onboarding draft ready for feedback",
      timestamp: "42 minutes ago",
      status: :review,
      icon: "hero-document-text"
    },
    %{
      id: "activity-3",
      label: "Dependencies",
      description: "Payments integration cleared for launch",
      timestamp: "Today, 9:15 AM",
      status: :done,
      icon: "hero-check-badge"
    }
  ]
end

defp select_status_options do
  [
    %{value: "active", label: "Active"},
    %{value: "paused", label: "Paused"},
    %{value: "at-risk", label: "At Risk"},
    %{value: "completed", label: "Completed"}
  ]
end

defp select_team_members do
  [
    %{value: "ava-stone", label: "Ava Stone"},
    %{value: "mateo-garcia", label: "Mateo García"},
    %{value: "priya-patel", label: "Priya Patel"},
    %{value: "noah-hill", label: "Noah Hill"}
  ]
end

defp select_timezone_groups do
  [
    %{
      label: "Americas",
      options: [
        %{value: "utc-8", label: "Pacific (UTC−08:00)"},
        %{value: "utc-7", label: "Mountain (UTC−07:00)"},
        %{value: "utc-5", label: "Eastern (UTC−05:00)"}
      ]
    },
    %{
      label: "Europe",
      options: [
        %{value: "utc+0", label: "Greenwich Mean Time (UTC±00:00)"},
        %{value: "utc+1", label: "Central European (UTC+01:00)"},
        %{value: "utc+2", label: "Eastern European (UTC+02:00)"}
      ]
    },
    %{
      label: "Asia-Pacific",
      options: [
        %{value: "utc+5_5", label: "India (UTC+05:30)"},
        %{value: "utc+8", label: "Singapore (UTC+08:00)"},
        %{value: "utc+10", label: "Sydney (UTC+10:00)"}
      ]
    }
  ]
end

  defp countdown_future_date do
    DateTime.utc_now()
    |> DateTime.add(86_400, :second)
    |> DateTime.truncate(:second)
  end

  defp lightbox_sample_images do
    [
      %{src: "/images/placeholder-1.jpg", alt: "Image 1"},
      %{src: "/images/placeholder-2.jpg", alt: "Image 2"},
      %{src: "/images/placeholder-3.jpg", alt: "Image 3"}
    ]
  end

  defp render_section(assigns) do
    case assigns.section do
      "getting-started" -> GettingStartedDocs.render(assigns)
      "installation" -> InstallationDocs.render(assigns)
      "usage" -> UsageDocs.render(assigns)
      "button" -> ButtonDocs.render(assigns)
      "input" -> InputDocs.render(assigns)
      "card" -> CardDocs.render(assigns)
      "alert" -> AlertDocs.render(assigns)
      "select" -> SelectDocs.render(assigns)
      "textarea" -> TextareaDocs.render(assigns)
      "checkbox" -> CheckboxDocs.render(assigns)
      "progress" -> ProgressDocs.render(assigns)
      "navbar" -> NavbarDocs.render(assigns)
      "tabs" -> TabsDocs.render(assigns)
      "badge" -> BadgeDocs.render(assigns)
      "modal" -> ModalDocs.render(assigns)
      "table" -> TableDocs.render(assigns)
      "accordion" -> AccordionDocs.render(assigns)
      "breadcrumbs" -> BreadcrumbsDocs.render(assigns)
      "grid" -> GridDocs.render(assigns)
      "list" -> ListDocs.render(assigns)
      "stats" -> StatsDocs.render(assigns)
      "avatar" -> AvatarDocs.render(assigns)
      "datepicker" -> DatepickerDocs.render(assigns)
      "slider" -> SliderDocs.render(assigns)
      "toast" -> ToastDocs.render(assigns)
      "stepper" -> StepperDocs.render(assigns)
      "chart" -> ChartDocs.render(assigns)
      "gauge" -> GaugeDocs.render(assigns)
      "heatmap" -> HeatmapDocs.render(assigns)
      "map" -> MapDocs.render(assigns)
      "file-upload" -> FileUploadDocs.render(assigns)
      "rich-text-editor" -> RichTextEditorDocs.render(assigns)
      "multi-select" -> MultiSelectDocs.render(assigns)
      "rating" -> RatingDocs.render(assigns)
      "password-strength-meter" -> PasswordStrengthMeterDocs.render(assigns)
      "tag-input" -> TagInputDocs.render(assigns)
      "signature-pad" -> SignaturePadDocs.render(assigns)
      "color-picker" -> ColorPickerDocs.render(assigns)
      "conditional-form" -> ConditionalFormDocs.render(assigns)
      "carousel" -> CarouselDocs.render(assigns)
      "wizard" -> WizardDocs.render(assigns)
      "resizable-panels" -> ResizablePanelsDocs.render(assigns)
      "filter-panel" -> FilterPanelDocs.render(assigns)
      "skeleton" -> SkeletonDocs.render(assigns)
      "autocomplete" -> AutocompleteDocs.render(assigns)
      "sortable-list" -> SortableListDocs.render(assigns)
      "live-chat" -> LiveChatDocs.render(assigns)
      "live-feed" -> LiveFeedDocs.render(assigns)
      "countdown" -> CountdownDocs.render(assigns)
      "kanban" -> KanbanDocs.render(assigns)
      "gantt" -> GanttDocs.render(assigns)
      "live-data-table" -> LiveDataTableDocs.render(assigns)
      "user-profile-card" -> UserProfileCardDocs.render(assigns)
      "avatar-group" -> AvatarGroupDocs.render(assigns)
      "connections-widget" -> ConnectionsWidgetDocs.render(assigns)
      "badge-card" -> BadgeCardDocs.render(assigns)
      "theme-switch" -> ThemeSwitchDocs.render(assigns)
      "theme-config" -> ThemeConfigDocs.render(assigns)
      "diff" -> DiffDocs.render(assigns)
      "kbd" -> KbdDocs.render(assigns)
      "link" -> LinkDocs.render(assigns)
      "hero" -> HeroDocs.render(assigns)
      "swap" -> SwapDocs.render(assigns)
      "dock" -> DockDocs.render(assigns)
      "drawer" -> DrawerDocs.render(assigns)
      "mockup" -> MockupDocs.render(assigns)
      "timeline" -> TimelineDocs.render(assigns)
      "lightbox" -> LightboxDocs.render(assigns)
      "video-player" -> VideoPlayerDocs.render(assigns)
      "animated-chart" -> AnimatedChartDocs.render(assigns)
      "skeleton-layout" -> SkeletonLayoutDocs.render(assigns)
      "masonry-grid" -> MasonryGridDocs.render(assigns)
      _ -> ComingSoonDocs.render(assigns)
    end
  end

  defp content_wrapper_classes(section)
       when section in ["alert", "theme-config", "accordion"] do
    "w-full px-4 sm:px-8 md:px-12 lg:px-16 xl:px-20 2xl:px-24 py-12"
  end

  defp content_wrapper_classes("datepicker") do
    "w-full px-4 sm:px-8 lg:px-12 xl:px-16 2xl:px-24 py-12"
  end

  defp content_wrapper_classes("avatar") do
    "w-full px-4 sm:px-8 lg:px-12 xl:px-16 2xl:px-24 py-12"
  end

  defp content_wrapper_classes("chart") do
    "w-full px-4 sm:px-8 lg:px-12 xl:px-16 2xl:px-24 py-12"
  end

  defp content_wrapper_classes(_section) do
    "max-w-4xl mx-auto px-8 py-12 text-gray-900"
  end

  defp main_wrapper_classes(section)
       when section in ["alert", "theme-config", "accordion"] do
    "flex-1 overflow-y-auto bg-slate-950"
  end

  defp main_wrapper_classes(_section) do
    "flex-1 overflow-y-auto bg-white"
  end

  defp live_chat_default_messages do
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

  defp append_live_chat_message(socket, id, attrs) do
    text = attrs |> Map.get(:text, "") |> to_string()
    timestamp = Map.get(attrs, :timestamp, DateTime.utc_now())

    message =
      attrs
      |> Map.put(:text, text)
      |> Map.put(:timestamp, timestamp)

    messages = Map.get(socket.assigns, :"#{id}_messages", live_chat_default_messages())
    assign(socket, :"#{id}_messages", messages ++ [message])
  end

  defp demo_chat_replies do
    [
      "Here’s a gradient-ready header you can drop into the chat shell ✨",
      "Pair glass surfaces with a subtle slate border for premium depth.",
      "Streaming the message list keeps transitions butter-smooth on mobile.",
      "Use the toolbar slot for quick macros—perfect for handoff flows.",
      "Toggle dark mode by flipping the gradient to indigo-950 with frosted overlay.",
      "I can also share a Tailwind token set if you want to reuse this palette."
    ]
  end

  defp sortable_list_default_items do
    [
      %{
        id: "priority-roadmap",
        title: "Prioritized roadmap",
        description: "Reorder launch milestones and share with leadership."
      },
      %{
        id: "segment-handoff",
        title: "Segment handoff",
        description: "Drag customers into success pods for automated rituals."
      },
      %{
        id: "design-review",
        title: "Design QA checklist",
        description: "Guarantee every ship hits the visual + UX spec."
      },
      %{
        id: "founder-updates",
        title: "Founder update queue",
        description: "Keep exec updates crisp with drag-and-drop talking points."
      }
    ]
  end

  defp normalize_sort_order(order) when is_list(order) do
    order
    |> Enum.map(&to_string/1)
    |> Enum.reject(&(&1 == ""))
  end

  defp normalize_sort_order(order) when is_binary(order) do
    order
    |> String.split([",", " "], trim: true)
    |> Enum.reject(&(&1 == ""))
  end

  defp normalize_sort_order(_), do: []

  defp reorder_sortable_items(items, order_ids) do
    id_map =
      Enum.reduce(items, %{}, fn item, acc ->
        id =
          item
          |> Map.get(:id) ||
            Map.get(item, "id")
            |> to_string()

        Map.put(acc, id, item)
      end)

    ordered =
      order_ids
      |> Enum.map(&Map.get(id_map, to_string(&1)))
      |> Enum.reject(&is_nil/1)

    leftovers = items -- ordered
    ordered ++ leftovers
  end
end
