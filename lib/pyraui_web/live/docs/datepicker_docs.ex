defmodule PyrauiWeb.DocsLive.DatepickerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-slate-500">
            Date Picker <span class="h-1 w-1 rounded-full bg-slate-400"></span> Inputs
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">DatePicker</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Polished date and time inputs with leading icons, sizes, and variants.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Basics</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Capture dates with helpful labels and defaults.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Variant: soft
            </div>
          </div>

          <div class="mt-6 grid gap-6 md:grid-cols-2 max-w-3xl">
            <Pyraui.Components.DatePicker.datepicker label="Birth Date" />
            <Pyraui.Components.DatePicker.datepicker label="Start Date" value="2025-01-15" />
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Time & Date-Time</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Use time-only or date-time inputs for scheduling.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Types: datetime, time
            </div>
          </div>

          <div class="mt-6 grid gap-6 md:grid-cols-2 max-w-3xl">
            <Pyraui.Components.DatePicker.datepicker label="Appointment" type={:datetime_local} />
            <Pyraui.Components.DatePicker.datepicker label="Event Time" type={:time} />
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Variants & Sizes</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Switch between soft and outline; choose a comfortable size.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Design tokens
            </div>
          </div>

          <div class="mt-6 grid gap-6 md:grid-cols-3 max-w-5xl">
            <div class="space-y-3">
              <div class="text-xs font-semibold uppercase tracking-wider text-slate-500">
                Soft · sm
              </div>
              <Pyraui.Components.DatePicker.datepicker label="Small" size={:sm} variant={:soft} />
            </div>
            <div class="space-y-3">
              <div class="text-xs font-semibold uppercase tracking-wider text-slate-500">
                Soft · md
              </div>
              <Pyraui.Components.DatePicker.datepicker label="Medium" size={:md} variant={:soft} />
            </div>
            <div class="space-y-3">
              <div class="text-xs font-semibold uppercase tracking-wider text-slate-500">
                Outline · lg
              </div>
              <Pyraui.Components.DatePicker.datepicker label="Large" size={:lg} variant={:outline} />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Constraints & States</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Guide users with min/max, helper text, and validation.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              UX helpers
            </div>
          </div>

          <div class="mt-6 grid gap-6 md:grid-cols-2 max-w-3xl">
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
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Variants control borders and focus rings; sizes adjust padding and typography.
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
                  <td class="px-6 py-4 font-medium text-slate-900">variant</td>
                  <td class="px-6 py-4">:soft | :outline</td>
                  <td class="px-6 py-4 text-sky-500">:soft</td>
                  <td class="px-6 py-4">Visual style for the input.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">size</td>
                  <td class="px-6 py-4">:sm | :md | :lg</td>
                  <td class="px-6 py-4 text-sky-500">:md</td>
                  <td class="px-6 py-4">Padding and font-size scale.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">icon</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-sky-500">true</td>
                  <td class="px-6 py-4">Toggle calendar leading icon.</td>
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
