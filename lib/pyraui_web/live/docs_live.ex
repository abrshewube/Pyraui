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
      |> assign(sidebar_section_states: build_sidebar_section_states())
      |> assign(:github_star_count, "2.4k")

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

  @impl true
  def handle_params(params, _url, socket) do
    if Map.has_key?(params, "section") do
      section = Map.get(params, "section", "getting-started")
      component = Map.get(params, "component", nil)
      {:noreply, assign(socket, section: section, component: component)}
    else
      {:noreply,
       socket
       |> assign(section: "getting-started", component: nil)
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
  def handle_event("toggle-nav-section", %{"section" => section}, socket) do
    states = socket.assigns[:sidebar_section_states] || %{}
    updated_states = Map.update(states, section, true, &(!&1))

    {:noreply, assign(socket, sidebar_section_states: updated_states)}
  end

  @impl true
  def handle_event("expand-all-sections", _params, socket) do
    {:noreply, assign(socket, sidebar_section_states: build_sidebar_section_states(true))}
  end

  @impl true
  def handle_event("collapse-all-sections", _params, socket) do
    {:noreply, assign(socket, sidebar_section_states: build_sidebar_section_states(false))}
  end

  @impl true
  def handle_event("update-rich-text", %{"content" => content}, socket) do
    {:noreply, assign(socket, rich_text_content: content)}
  end

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
        <div class="absolute inset-0 -z-10">
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

        <div class="relative z-10 flex min-h-screen flex-col">
          <header class="sticky top-0 z-30 h-20 border-b border-white/10 bg-slate-950/80 backdrop-blur">
            <div class="mx-auto flex h-full w-full max-w-7xl items-center justify-between px-6 sm:px-8 lg:px-12">
              <div class="flex items-center gap-5">
                <button
                  type="button"
                  phx-click="toggle-sidebar"
                  class="flex h-12 w-12 items-center justify-center rounded-full border border-white/15 bg-white/10 text-white shadow-lg shadow-blue-500/20 transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/20 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-950"
                >
                  <.icon
                    name={if(@sidebar_open, do: "hero-x-mark", else: "hero-bars-3")}
                    class={
                      "h-5 w-5 transition-transform duration-200 " <>
                        if(@sidebar_open, do: "rotate-90", else: "")
                    }
                  /> <span class="sr-only">Toggle navigation</span>
                </button>
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

              <div class="hidden items-center gap-3 lg:flex">
                <span class="rounded-full border border-white/10 bg-white/5 px-3 py-1 text-xs font-semibold text-white/70">
                  {@github_star_count} GitHub stars
                </span>
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
                <span class="rounded-full border border-white/10 bg-white/5 px-3 py-1 text-xs font-semibold text-white/70">
                  {@github_star_count} ⭐
                </span>
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
              "docs-sidebar relative z-30 h-full overflow-hidden border-r border-white/10 bg-slate-950/90 backdrop-blur-xl transition-all duration-300 ease-out shadow-[0_0_160px_-40px_rgba(59,130,246,0.55)] md:translate-x-0 md:w-80",
              if(@sidebar_open,
                do: "w-72 translate-x-0 opacity-100 pointer-events-auto",
                else: "-translate-x-full opacity-0 pointer-events-none md:opacity-100"
              )
            ]}>
              <div class="flex h-full flex-col">
                <div class="absolute inset-0 -z-10 bg-gradient-to-b from-blue-600/20 via-slate-950/40 to-slate-950">
                </div>

                <div class="absolute -left-20 top-24 -z-10 h-60 w-60 rounded-full bg-cyan-500/10 blur-3xl">
                </div>

                <div class="absolute -right-16 top-40 -z-10 h-48 w-48 rounded-full bg-purple-500/15 blur-2xl">
                </div>

                <div class="px-6 pb-5 pt-6">
                  <div class="flex items-center gap-2 text-xs text-slate-200">
                    <button
                      type="button"
                      phx-click="expand-all-sections"
                      class="rounded-full border border-white/10 px-3 py-1 font-medium text-white/80 hover:border-white/20 hover:bg-white/10"
                    >
                      Expand all
                    </button>
                    <button
                      type="button"
                      phx-click="collapse-all-sections"
                      class="rounded-full border border-white/10 px-3 py-1 font-medium text-white/80 hover:border-white/20 hover:bg-white/10"
                    >
                      Collapse all
                    </button>
                  </div>
                </div>

                <nav class="flex-1 overflow-y-auto px-3 pb-10">
                  <%= for {title, items} <- navigation_sections() do %>
                    <% section_open? = Map.get(@sidebar_section_states, title, true) %>
                    <div class="mb-6">
                      <button
                        type="button"
                        phx-click="toggle-nav-section"
                        phx-value-section={title}
                        class="flex w-full items-center justify-between rounded-lg px-3 py-2 text-left text-xs font-semibold uppercase tracking-[0.25em] text-slate-300 hover:text-white"
                      >
                        <span>{title}</span>
                        <.icon
                          name={if(section_open?, do: "hero-chevron-up", else: "hero-chevron-down")}
                          class={
                            "h-4 w-4 text-slate-500 transition-transform duration-200 " <>
                              if(section_open?, do: "rotate-0", else: "rotate-180")
                          }
                        />
                      </button>
                      <div class={[
                        "mt-2 space-y-1 border-l border-white/5 pl-3 transition-all duration-200",
                        if(section_open?,
                          do: "opacity-100",
                          else: "pointer-events-none opacity-0 -translate-y-1"
                        )
                      ]}>
                        <%= for item <- items do %>
                          <.link
                            navigate={~p"/docs/#{item.path}"}
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
                      </div>
                    </div>
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

  defp navigation_sections do
    navigation_sections_raw()
    |> Enum.map(fn {title, items} ->
      {
        title,
        items
        |> Enum.sort_by(&String.downcase(&1.label))
      }
    end)
    |> Enum.sort_by(fn {title, _items} -> String.downcase(title) end)
  end

  defp build_sidebar_section_states(default \\ true) do
    navigation_sections()
    |> Enum.map(fn {title, _items} -> {title, default} end)
    |> Map.new()
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
