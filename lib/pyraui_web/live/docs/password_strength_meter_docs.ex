defmodule PyrauiWeb.DocsLive.PasswordStrengthMeterDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-slate-500">
            Password <span class="h-1 w-1 rounded-full bg-slate-400"></span> Strength
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Password Strength Meter</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Live strength feedback with suggestions. Attach the meter to your password field—no extra wiring needed.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <h2 class="text-2xl font-semibold">Basic Usage</h2>
          <div class="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-6 max-w-md">
            <Pyraui.Components.PasswordStrengthMeter.password_strength_meter id="password-demo" />
          </div>
          <div class="mt-6 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.password_strength_meter id="password-input" field={@form[:password]} /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <h2 class="text-2xl font-semibold">With Suggestions</h2>
          <div class="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-6 max-w-md">
            <Pyraui.Components.PasswordStrengthMeter.password_strength_meter
              id="password-suggestions"
              show_suggestions={true}
            />
          </div>
          <div class="mt-6 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.password_strength_meter id="signup-password" field={@form[:password]} show_suggestions={true} /&gt;
    </code>
            </pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
