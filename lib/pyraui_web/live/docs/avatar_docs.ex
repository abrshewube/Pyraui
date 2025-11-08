defmodule PyrauiWeb.DocsLive.AvatarDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="space-y-16 px-4 py-12 text-slate-900 sm:px-8 lg:px-12 xl:px-16 2xl:px-24">
      <header class="space-y-4">
        <span class="inline-flex items-center gap-2 rounded-full border border-indigo-200 bg-indigo-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-indigo-600">
          Avatar <span class="h-1 w-1 rounded-full bg-indigo-500"></span> Gallery
        </span>
        <h1 class="text-4xl font-semibold tracking-tight text-slate-900 sm:text-5xl">
          Polished profile energy
        </h1>
        <p class="max-w-3xl text-base leading-relaxed text-slate-600 sm:text-lg">
          The avatar component wraps profile photos, initials, or custom content inside luminous gradient rims and animated presence pips. Drop them into dashboards, rosters, or messaging interfaces for instant polish.
        </p>
      </header>

      <section class="grid gap-12 xl:grid-cols-[1.35fr_1fr]">
        <div class="space-y-8">
          <div class="space-y-3">
            <h2 class="text-2xl font-semibold text-slate-900">Luminous line-up</h2>
            <p class="max-w-xl text-sm text-slate-600">
              Each avatar chooses a gradient halo based on the user identity and adds subtle hover lift. Presence pulses animate in place without feeling noisy.
            </p>
          </div>

          <div class="flex flex-wrap items-center gap-6">
            <Pyraui.Components.Avatar.avatar
              src="https://i.pravatar.cc/240?img=12"
              name="Ava Stone"
              size={:lg}
              online={true}
            />
            <Pyraui.Components.Avatar.avatar
              src="https://i.pravatar.cc/240?img=49"
              name="Kai Morgan"
              size={:md}
              online={true}
            />
            <Pyraui.Components.Avatar.avatar
              src="https://i.pravatar.cc/240?img=33"
              name="Noah Hill"
              size={:md}
              online={false}
            />
            <Pyraui.Components.Avatar.avatar name="Evelyn Wu" size={:md} />
            <Pyraui.Components.Avatar.avatar name="Jo" size={:sm} />
          </div>
        </div>

        <div class="space-y-5 rounded-3xl border border-slate-200/70 bg-white p-6 shadow-[0_35px_80px_-60px_rgba(79,70,229,0.25)]">
          <span class="text-xs uppercase tracking-[0.3em] text-slate-500">Snippet</span>
          <pre class="overflow-x-auto text-sm leading-6 text-slate-800">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.avatar src="https://..." name="Ava Stone" size={:lg} online={true} /&gt;
    &lt;.avatar name="Evelyn Wu" /&gt;
    &lt;.avatar name="Jo" size={:sm} /&gt;
    </code>
            </pre>
        </div>
      </section>

      <section class="grid gap-12 lg:grid-cols-[1fr_1fr]">
        <div class="space-y-6 rounded-3xl border border-slate-200/70 bg-gradient-to-br from-slate-50 via-white to-indigo-50/40 p-8 shadow-[0_35px_85px_-60px_rgba(129,140,248,0.25)]">
          <h3 class="text-xl font-semibold text-slate-900">Size typography</h3>
          <p class="text-sm text-slate-600">
            Five sizes cover everything from condensed list rows to hero headers. Initials inherit perfect type scale per size.
          </p>
          <div class="flex flex-wrap items-end gap-6">
            <Pyraui.Components.Avatar.avatar name="XS" size={:xs} />
            <Pyraui.Components.Avatar.avatar name="SM" size={:sm} />
            <Pyraui.Components.Avatar.avatar name="MD" size={:md} />
            <Pyraui.Components.Avatar.avatar name="LG" size={:lg} />
            <Pyraui.Components.Avatar.avatar name="XL" size={:xl} />
          </div>
        </div>

        <div class="space-y-6 rounded-3xl border border-slate-200/70 bg-gradient-to-br from-white via-slate-50 to-amber-50/60 p-8 shadow-[0_35px_85px_-60px_rgba(249,115,22,0.18)]">
          <h3 class="text-xl font-semibold text-slate-900">Presence states</h3>
          <p class="text-sm text-slate-600">
            Online and offline chips glow with a soft pulse and sit flush at any size. Skip the indicator with <code class="rounded bg-white px-1.5 py-0.5 text-xs text-slate-600 shadow-sm">online={nil}</code>.
          </p>
          <div class="flex flex-wrap items-center gap-6">
            <Pyraui.Components.Avatar.avatar name="Active" size={:lg} online={true} />
            <Pyraui.Components.Avatar.avatar name="Focus" size={:lg} online={false} />
            <Pyraui.Components.Avatar.avatar name="Stealth" size={:lg} />
          </div>
        </div>
      </section>

      <section class="grid gap-12 lg:grid-cols-[1.2fr_1fr]">
        <div class="space-y-6">
          <h3 class="text-xl font-semibold text-slate-900">Custom content & fallback</h3>
          <p class="max-w-xl text-sm text-slate-600">
            Pipe any LiveView content into the slot. Emoji, icons, or counters inherit the glass shell and gradient frame instantly.
          </p>
          <div class="flex flex-wrap items-center gap-6">
            <Pyraui.Components.Avatar.avatar size={:lg}>
              <PyrauiWeb.CoreComponents.icon name="hero-sparkles" class="h-8 w-8 text-white/90" />
            </Pyraui.Components.Avatar.avatar>
            <Pyraui.Components.Avatar.avatar size={:lg}>
              <span class="text-3xl">🚀</span>
            </Pyraui.Components.Avatar.avatar>
            <Pyraui.Components.Avatar.avatar size={:lg}>
              <span class="text-xl font-semibold tracking-wide text-white/90">UX</span>
            </Pyraui.Components.Avatar.avatar>
            <Pyraui.Components.Avatar.avatar size={:lg} />
          </div>
        </div>

        <div class="space-y-4 rounded-3xl border border-slate-200/70 bg-white p-6 shadow-[0_35px_85px_-60px_rgba(59,130,246,0.2)]">
          <span class="text-xs uppercase tracking-[0.3em] text-slate-500">Slot usage</span>
          <pre class="overflow-x-auto text-sm leading-6 text-slate-800">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.avatar size={:lg}&gt;
    &lt;.icon name="hero-sparkles" class="h-8 w-8 text-white/90" /&gt;
    &lt;/.avatar&gt;
    </code>
            </pre>
        </div>
      </section>

      <section class="space-y-6 border-t border-white/10 pt-12">
        <h3 class="text-xl font-semibold text-slate-900">Props</h3>
        <p class="max-w-2xl text-sm text-slate-600">
          Avatars are pure components—no extra CSS required. Bring your own classes to override padding, add tooltips, or wire into menus.
        </p>

        <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-[0_35px_85px_-60px_rgba(15,23,42,0.25)]">
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
                <td class="px-6 py-4 font-medium text-slate-900">src</td>
                <td class="px-6 py-4">string | nil</td>
                <td class="px-6 py-4 text-indigo-500">nil</td>
                <td class="px-6 py-4">
                  Photo URL. When present, renders an image with soft hover zoom.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">name</td>
                <td class="px-6 py-4">string | nil</td>
                <td class="px-6 py-4 text-indigo-500">nil</td>
                <td class="px-6 py-4">
                  Used to compute initials and gradient palette.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">size</td>
                <td class="px-6 py-4">:xs | :sm | :md | :lg | :xl</td>
                <td class="px-6 py-4 text-indigo-500">:md</td>
                <td class="px-6 py-4">
                  Controls shell diameter and typography scale.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">online</td>
                <td class="px-6 py-4">boolean | nil</td>
                <td class="px-6 py-4 text-indigo-500">nil</td>
                <td class="px-6 py-4">
                  <code>true</code>
                  shows a green pulse, <code>false</code>
                  shows a rose tone, <code>nil</code>
                  hides the indicator.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">class</td>
                <td class="px-6 py-4">string</td>
                <td class="px-6 py-4 text-indigo-500">""</td>
                <td class="px-6 py-4">
                  Extend with inline flexbox tweaks, tooltips, or data attributes.
                </td>
              </tr>
              <tr>
                <td class="px-6 py-4 font-medium text-slate-900">inner_block</td>
                <td class="px-6 py-4">slot</td>
                <td class="px-6 py-4 text-indigo-500">—</td>
                <td class="px-6 py-4">
                  Optional custom content. Ideal for icons, emojis, or dynamic counters.
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
