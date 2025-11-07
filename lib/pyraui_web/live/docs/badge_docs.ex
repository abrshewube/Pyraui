defmodule PyrauiWeb.DocsLive.BadgeDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-purple-200 bg-purple-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-purple-600">
            Badge <span class="h-1 w-1 rounded-full bg-purple-500"></span> Status Tags
          </span>
          <h1 class="text-4xl font-semibold tracking-tight">Badge</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Polished tags for status chips, feature flags, or inline metadata. Choose from semantic variants, tone styles, pill toggles, and optional icons to match your interface vocabulary.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Core Variants</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Semantic presets cover common states like primary, success, warning, error, info, plus a neutral and highlight gradient.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Impactful chips
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-6">
            <div class="flex flex-wrap items-center gap-4">
              <Pyraui.Components.Badge.badge>Neutral</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:primary}>
                Primary
              </Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:success}>
                Success
              </Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:warning}>
                Warning
              </Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:error}>Error</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:info}>Info</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge variant={:highlight}>
                Highlight
              </Pyraui.Components.Badge.badge>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Tone &amp; Icon Mix</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Swap between <code class="rounded bg-slate-100 px-1 text-xs">:solid</code>, <code class="rounded bg-slate-100 px-1 text-xs">:soft</code>, or
                <code class="rounded bg-slate-100 px-1 text-xs">:outline</code>
                tones and add icons for richer semantics.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Flexible system
            </div>
          </div>

          <div class="mt-8 grid gap-6 lg:grid-cols-2">
            <div class="space-y-4 rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Soft tone with icons</h3>
              <div class="flex flex-wrap items-center gap-4">
                <Pyraui.Components.Badge.badge tone={:soft} icon="hero-check-circle">
                  Published
                </Pyraui.Components.Badge.badge>
                <Pyraui.Components.Badge.badge
                  tone={:soft}
                  variant={:warning}
                  icon="hero-exclamation-triangle"
                >
                  Attention
                </Pyraui.Components.Badge.badge>
                <Pyraui.Components.Badge.badge tone={:soft} variant={:success} icon="hero-sparkles">
                  Shipped
                </Pyraui.Components.Badge.badge>
              </div>
            </div>

            <div class="space-y-4 rounded-2xl border border-slate-200 bg-slate-50 p-6">
              <h3 class="text-sm font-semibold text-slate-800">Outline + gradient highlight</h3>
              <div class="flex flex-wrap items-center gap-4">
                <Pyraui.Components.Badge.badge tone={:outline} icon="hero-clock">
                  Scheduled
                </Pyraui.Components.Badge.badge>
                <Pyraui.Components.Badge.badge tone={:outline} variant={:error} icon="hero-fire">
                  Hotfix
                </Pyraui.Components.Badge.badge>
                <Pyraui.Components.Badge.badge tone={:solid} variant={:highlight} icon="hero-star">
                  Featured
                </Pyraui.Components.Badge.badge>
              </div>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)]">
          <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold">Sizes &amp; Shape</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Three size presets and a <code class="rounded bg-slate-100 px-1 text-xs">pill</code>
                toggle for squared corners.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Responsive chips
            </div>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-6">
            <div class="flex flex-wrap items-center gap-4">
              <Pyraui.Components.Badge.badge size={:sm}>Small</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge size={:md}>Medium</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge size={:lg}>Large</Pyraui.Components.Badge.badge>
              <Pyraui.Components.Badge.badge pill={false} icon="hero-adjustments-horizontal">
                Square corners
              </Pyraui.Components.Badge.badge>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Badges stay simple to wire while offering the controls designers need: semantics, tone, iconography, and layout toggles.
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
                  <td class="px-6 py-4">atom</td>
                  <td class="px-6 py-4 text-purple-500">:neutral</td>
                  <td class="px-6 py-4">
                    Semantic palette (:primary, :success, :warning, :error, :info, :highlight).
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">tone</td>
                  <td class="px-6 py-4">:solid | :soft | :outline</td>
                  <td class="px-6 py-4 text-purple-500">:solid</td>
                  <td class="px-6 py-4">Controls fill style and border treatment.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">size</td>
                  <td class="px-6 py-4">:sm | :md | :lg</td>
                  <td class="px-6 py-4 text-purple-500">:md</td>
                  <td class="px-6 py-4">Pad and scale typography + icon sizing.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">pill</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-purple-500">true</td>
                  <td class="px-6 py-4">Toggle full-rounded corners for pill silhouette.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">icon</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-purple-500">nil</td>
                  <td class="px-6 py-4">Optional icon rendered before the label.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-purple-500">""</td>
                  <td class="px-6 py-4">Extra classes for layout adjustments.</td>
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
