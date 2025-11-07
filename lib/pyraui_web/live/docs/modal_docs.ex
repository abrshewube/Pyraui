defmodule PyrauiWeb.DocsLive.ModalDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    assigns =
      assigns
      |> assign_new(:docs_modal_confirm_open, fn -> false end)
      |> assign_new(:docs_modal_glass_open, fn -> false end)
      |> assign_new(:docs_modal_large_open, fn -> false end)

    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-slate-500">
            Modal <span class="h-1 w-1 rounded-full bg-slate-400"></span> Overlays
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Modal</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Accessible dialogs with variants, subtle motion, and thoughtful defaults.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Classic Confirmation</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Use for destructive or high-signal actions.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: classic
            </div>
          </div>

          <div class="mt-6">
            <Pyraui.Components.Button.button
              variant={:primary}
              phx-click="open-modal"
              phx-value-id="docs_modal_confirm"
            >
              Open confirm
            </Pyraui.Components.Button.button>
          </div>

          <Pyraui.Components.Modal.modal
            id="docs_modal_confirm"
            show={@docs_modal_confirm_open}
            variant={:classic}
          >
            <:title>Delete project</:title>
            <p>Deleting will remove all data. This action cannot be undone.</p>
            <:footer>
              <Pyraui.Components.Button.button
                variant={:ghost}
                phx-click="close-modal"
                phx-value-id="docs_modal_confirm"
              >
                Cancel
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:primary}>
                Delete
              </Pyraui.Components.Button.button>
            </:footer>
          </Pyraui.Components.Modal.modal>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Glass Info</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                A frosted panel for light, non-blocking content.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: glass
            </div>
          </div>

          <div class="mt-6">
            <Pyraui.Components.Button.button
              variant={:secondary}
              phx-click="open-modal"
              phx-value-id="docs_modal_glass"
            >
              Open glass modal
            </Pyraui.Components.Button.button>
          </div>

          <Pyraui.Components.Modal.modal
            id="docs_modal_glass"
            show={@docs_modal_glass_open}
            variant={:glass}
            size={:md}
          >
            <:title>What’s new</:title>
            <p>PyraUI 1.3 introduces tone-aware badges, tables, and chart upgrades.</p>
            <:footer>
              <Pyraui.Components.Button.button
                variant={:primary}
                phx-click="close-modal"
                phx-value-id="docs_modal_glass"
              >
                Got it
              </Pyraui.Components.Button.button>
            </:footer>
          </Pyraui.Components.Modal.modal>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Danger + Large</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Prominent header line signals a risky operation.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: danger · Size: lg
            </div>
          </div>

          <div class="mt-6">
            <Pyraui.Components.Button.button
              variant={:ghost}
              phx-click="open-modal"
              phx-value-id="docs_modal_large"
            >
              Open large modal
            </Pyraui.Components.Button.button>
          </div>

          <Pyraui.Components.Modal.modal
            id="docs_modal_large"
            show={@docs_modal_large_open}
            variant={:danger}
            size={:lg}
          >
            <:title>Rotate access tokens</:title>
            <p>We’ll generate new client secrets and disable the previous set after 24 hours.</p>
            <:footer>
              <Pyraui.Components.Button.button
                variant={:ghost}
                phx-click="close-modal"
                phx-value-id="docs_modal_large"
              >
                Cancel
              </Pyraui.Components.Button.button>
              <Pyraui.Components.Button.button variant={:primary}>
                Rotate now
              </Pyraui.Components.Button.button>
            </:footer>
          </Pyraui.Components.Modal.modal>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Control size, variant, and accessibility labels. Bind
            <code class="rounded bg-slate-100 px-1 text-xs">show</code>
            to LiveView state and use <code class="rounded bg-slate-100 px-1 text-xs">open-modal</code>/<code class="rounded bg-slate-100 px-1 text-xs">close-modal</code> events as shown.
          </p>

          <div class="mt-6 overflow-hidden rounded-2xl border border-slate-200">
            <table class="min-w-full divide-y divide-slate-100 text-sm">
              <thead class="bg-slate-50 text-xs uppercase tracking-[0.2em] text-slate-500">
                <tr>
                  <th class="px-6 py-4 text-left">Prop</th>
                  <th class="px-6 py-4 text-left">Type</th>
                  <th class="px-6 py-4 text-left">Default</th>
                  <th class="px-6 py-4 text-left">Description</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-slate-100 bg-white text-slate-700">
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">id</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-sky-500">—</td>
                  <td class="px-6 py-4">Unique id for dialog and accessibility hooks.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">show</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-sky-500">false</td>
                  <td class="px-6 py-4">Controls visibility; bind to LiveView assigns.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">size</td>
                  <td class="px-6 py-4">:sm | :md | :lg | :xl</td>
                  <td class="px-6 py-4 text-sky-500">:md</td>
                  <td class="px-6 py-4">Max width of the dialog frame.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">variant</td>
                  <td class="px-6 py-4">:classic | :glass | :danger</td>
                  <td class="px-6 py-4 text-sky-500">:classic</td>
                  <td class="px-6 py-4">Visual style for the frame and header.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">title (slot)</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-sky-500">—</td>
                  <td class="px-6 py-4">Dialog title area.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">footer (slot)</td>
                  <td class="px-6 py-4">slot</td>
                  <td class="px-6 py-4 text-sky-500">—</td>
                  <td class="px-6 py-4">Actions area; place primary action last.</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
