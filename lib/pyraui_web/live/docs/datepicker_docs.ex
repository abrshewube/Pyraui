defmodule PyrauiWeb.DocsLive.DatepickerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="space-y-16 px-4 py-12 text-slate-900 sm:px-8 lg:px-12 xl:px-16 2xl:px-24">
      <header class="space-y-4">
        <span class="inline-flex items-center gap-2 rounded-full border border-sky-200 bg-sky-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-sky-600">
          Date design <span class="h-1 w-1 rounded-full bg-sky-500"></span> Suite
        </span>
        <h1 class="text-4xl font-semibold tracking-tight text-slate-900 sm:text-5xl">DatePicker</h1>
        <p class="max-w-3xl text-base leading-relaxed text-slate-600 sm:text-lg">
          Luminous shells, inline helpers, and smooth focus cues transform native date inputs into premium scheduling controls.
        </p>
      </header>

      <section class="space-y-8">
        <div class="space-y-8">
          <div class="space-y-2">
            <h2 class="text-2xl font-semibold text-slate-900">Hero scheduling</h2>
            <p class="max-w-xl text-sm text-slate-600">
              Pair soft gradients with helper copy to guide customers through booking flows or onboarding journeys.
            </p>
          </div>

          <div class="grid gap-6 md:grid-cols-2">
            <Pyraui.Components.DatePicker.datepicker
              label="Check-in"
              value="2025-04-18"
              helper="Flexible up to 24 hours before"
            />
            <Pyraui.Components.DatePicker.datepicker
              label="Check-out"
              value="2025-04-22"
              helper="Late check-out available"
            />
            <Pyraui.Components.DatePicker.datepicker
              label="Meeting"
              type={:datetime_local}
              helper="Local timezone applied"
            />
            <Pyraui.Components.DatePicker.datepicker
              label="Focus timer"
              type={:time}
              variant={:outline}
              helper="Start anytime today"
            />
          </div>
        </div>

        <div class="space-y-5">
          <span class="text-xs uppercase tracking-[0.3em] text-slate-500">Snippet</span>
          <pre class="overflow-x-auto rounded-xl bg-slate-900/95 p-6 text-sm leading-6 text-slate-100 shadow-[0_35px_90px_-60px_rgba(15,23,42,0.35)]">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.datepicker label="Check-in" value="2025-04-18" helper="Flexible up to 24 hours before" /&gt;
    &lt;.datepicker label="Meeting" type={:datetime_local} helper="Local timezone applied" /&gt;
    </code>
          </pre>
        </div>
      </section>

      <section class="grid gap-10 lg:grid-cols-[1.1fr_1fr]">
        <div class="space-y-6">
          <div class="space-y-2">
            <h3 class="text-xl font-semibold text-slate-900">Size palette</h3>
            <p class="max-w-xl text-sm text-slate-600">
              Each size adjusts padding, typography, and icon treatments—perfect for responsive dashboards and mobile trays.
            </p>
          </div>

          <div class="grid gap-5 md:grid-cols-3">
            <div class="space-y-3">
              <span class="text-xs font-semibold uppercase tracking-[0.25em] text-slate-500">
                Soft · sm
              </span>
              <Pyraui.Components.DatePicker.datepicker label="Sprint start" size={:sm} />
            </div>
            <div class="space-y-3">
              <span class="text-xs font-semibold uppercase tracking-[0.25em] text-slate-500">
                Soft · md
              </span>
              <Pyraui.Components.DatePicker.datepicker label="Campaign launch" size={:md} />
            </div>
            <div class="space-y-3">
              <span class="text-xs font-semibold uppercase tracking-[0.25em] text-slate-500">
                Outline · lg
              </span>
              <Pyraui.Components.DatePicker.datepicker
                label="Executive review"
                size={:lg}
                variant={:outline}
              />
            </div>
          </div>
        </div>

        <div class="space-y-6">
          <div class="space-y-2">
            <h3 class="text-xl font-semibold text-slate-900">Micro UX</h3>
            <p class="text-sm text-slate-600">
              Validation and helper text stay polished, with animated focus states and graceful fallbacks.
            </p>
          </div>

          <div class="space-y-5">
            <Pyraui.Components.DatePicker.datepicker
              label="Window start"
              min="2025-01-01"
              max="2025-12-31"
              helper="Select within 2025"
            />

            <Pyraui.Components.DatePicker.datepicker
              label="Required"
              required={true}
              error="This field is required"
            />

            <Pyraui.Components.DatePicker.datepicker
              label="Without icon"
              icon={false}
              helper="Great for tight list rows"
            />
          </div>
        </div>
      </section>

      <section class="space-y-6">
        <div class="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
          <div class="max-w-2xl space-y-2">
            <h3 class="text-xl font-semibold text-slate-900">Temporal variety</h3>
            <p class="text-sm text-slate-600">
              Month and week pickers use the same shell, so alternative date granularities stay on-brand.
            </p>
          </div>
          <div class="inline-flex items-center gap-2 rounded-full border border-indigo-200 bg-indigo-50 px-4 py-1 text-xs tracking-[0.3em] text-indigo-600">
            Calendar masks
          </div>
        </div>

        <div class="grid gap-6 md:grid-cols-3">
          <Pyraui.Components.DatePicker.datepicker label="Month view" type={:month} />
          <Pyraui.Components.DatePicker.datepicker label="Week selection" type={:week} />
          <Pyraui.Components.DatePicker.datepicker
            label="Time blocker"
            type={:time}
            variant={:outline}
          />
        </div>
      </section>

      <section class="space-y-6">
        <h3 class="text-xl font-semibold text-slate-900">Props</h3>
        <p class="max-w-2xl text-sm text-slate-600">
          Variants tune the shell styling while sizes align with typography tokens. Toggle icons or inject helper copy to personalise flows.
        </p>

        <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-[0_30px_80px_-60px_rgba(15,23,42,0.25)]">
          <table class="min-w-full divide-y divide-slate-100 text-sm text-slate-700">
            <thead class="bg-slate-50 text-xs uppercase tracking-[0.25em] text-slate-500">
              <tr>
                <th class="px-6 py-4 text-left">Prop</th>
                <th class="px-6 py-4 text-left">Type</th>
                <th class="px-6 py-4 text-left">Default</th>
                <th class="px-6 py-4 text-left">Description</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-slate-100">
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">variant</td>
                <td class="px-6 py-4">:soft | :outline</td>
                <td class="px-6 py-4 text-sky-500">:soft</td>
                <td class="px-6 py-4">
                  Switch between glassy gradients or crisp outline styling.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">size</td>
                <td class="px-6 py-4">:sm | :md | :lg</td>
                <td class="px-6 py-4 text-sky-500">:md</td>
                <td class="px-6 py-4">
                  Controls padding, radius, and typography scale.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">icon</td>
                <td class="px-6 py-4">boolean</td>
                <td class="px-6 py-4 text-sky-500">true</td>
                <td class="px-6 py-4">
                  Toggle the calendar hero icon for ultra-compact layouts.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">helper</td>
                <td class="px-6 py-4">string | nil</td>
                <td class="px-6 py-4 text-sky-500">nil</td>
                <td class="px-6 py-4">
                  Optional supporting copy displayed below the control.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">error</td>
                <td class="px-6 py-4">string | nil</td>
                <td class="px-6 py-4 text-sky-500">nil</td>
                <td class="px-6 py-4">
                  Highlights validation state with rose accents and messaging.
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
    """
  end
end
