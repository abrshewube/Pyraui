defmodule PyrauiWeb.DocsLive.AlertDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="relative overflow-hidden rounded-3xl border border-slate-200 bg-gradient-to-br from-white via-white to-slate-50 px-6 py-10 text-slate-900 shadow-[0_60px_140px_-90px_rgba(15,23,42,0.35)]">
      <div class="pointer-events-none absolute -top-48 -right-36 h-80 w-80 rounded-full bg-sky-200/40 blur-3xl">
      </div>
      <div class="pointer-events-none absolute -bottom-52 -left-40 h-96 w-96 rounded-full bg-rose-200/30 blur-3xl">
      </div>
      <div class="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_top,_rgba(14,165,233,0.08),_transparent_70%)]">
      </div>

      <div class="relative z-10 space-y-12">
        <header class="space-y-4">
          <span class="inline-flex items-center gap-2 rounded-full border border-sky-200 bg-sky-50 px-4 py-1 text-xs font-semibold uppercase tracking-[0.35em] text-sky-600">
            Alert <span class="h-1 w-1 rounded-full bg-sky-500"></span> Showcase
          </span>
          <h1 class="text-4xl font-semibold tracking-tight text-slate-900">Alert</h1>
          <p class="max-w-3xl text-lg leading-relaxed text-slate-600">
            Delightfully polished alerts for high-signal messaging. PyraUI ships crisp visuals, badges, call-to-actions, and micro-interactions so your feedback moments feel intentional and premium.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(15,23,42,0.18)] transition-all duration-200 hover:-translate-y-1">
          <div class="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Quick Alerts</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Real-world, unobtrusive notifications optimised for status and inline messaging.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Compact by default
            </div>
          </div>

          <div class="mt-6 grid gap-3">
            <Pyraui.Components.Alert.alert
              variant={:info}
              title="Information"
              message="Analytics will refresh every 5 minutes while the rollout completes."
            />
            <Pyraui.Components.Alert.alert
              variant={:success}
              title="Saved"
              message="Workspace permissions were updated successfully."
            />
            <Pyraui.Components.Alert.alert
              variant={:warning}
              title="Action required"
              message="Add a secondary email before Friday to keep notifications enabled."
            />
            <Pyraui.Components.Alert.alert
              variant={:danger}
              title="Payment failed"
              message="We couldn’t process the last invoice. Retry within 24 hours to avoid suspension."
              dismissible={true}
            />
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.alert variant={:success} title="Saved" message="Preferences updated" /&gt;
    &lt;.alert variant={:warning} dismissible title="Heads up" message="Verify your billing email" /&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(59,130,246,0.22)] transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-6 lg:flex-row lg:items-start lg:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-slate-900">Enhanced Experiences</h2>
              <p class="mt-2 max-w-xl text-sm text-slate-600">
                Layer badges, richer copy, and inline CTAs when an alert should guide the next step.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-100 px-4 py-1 text-xs tracking-[0.3em] text-slate-500">
              Motion aware
            </div>
          </div>

          <div class="mt-10 grid gap-5 xl:grid-cols-2">
            <Pyraui.Components.Alert.alert
              variant={:info}
              badge="Heads up"
              title="System maintenance scheduled"
              message="We’ll apply performance upgrades this Saturday at 02:00 UTC. You’ll receive a follow-up when everything is live."
            />

            <Pyraui.Components.Alert.alert
              variant={:success}
              badge="Launch"
              title="Milestone unlocked"
              message="Revenue automation is now rolled out to all enterprise workspaces."
            >
              <p class="text-slate-700">
                The adoption squad will host a live AMA tomorrow so your teams can explore workflows in real time.
              </p>
              <:actions>
                <Pyraui.Components.Button.button
                  variant={:primary}
                  size={:sm}
                  class="shadow-[0_10px_25px_-12px_rgba(16,185,129,0.35)]"
                >
                  View dashboard
                </Pyraui.Components.Button.button>
                <Pyraui.Components.Button.button
                  variant={:ghost}
                  size={:sm}
                  class="border border-slate-200"
                >
                  Share update
                </Pyraui.Components.Button.button>
              </:actions>
            </Pyraui.Components.Alert.alert>

            <Pyraui.Components.Alert.alert
              variant={:warning}
              badge="Review"
              title="Billing attention needed"
            >
              <p class="text-slate-700">
                The payment method ending in 6728 requires verification. Update details within the next 48 hours to prevent service interruption.
              </p>
              <:actions>
                <Pyraui.Components.Button.button
                  variant={:secondary}
                  size={:sm}
                  class="border border-slate-200"
                >
                  Update billing
                </Pyraui.Components.Button.button>
              </:actions>
            </Pyraui.Components.Alert.alert>

            <Pyraui.Components.Alert.alert
              variant={:danger}
              badge="Critical"
              title="Incident response active"
              message="API latency is elevated for the EU region. Our reliability team is already applying mitigations."
              dismissible={true}
            />

            <Pyraui.Components.Alert.alert
              variant={:celebrate}
              badge="Celebration"
              title="4.9 satisfaction this quarter"
              message="Customers left 712 five-star reviews. This deserves a quick shout-out to the support and success crews!"
            >
              <:actions>
                <Pyraui.Components.Button.button
                  variant={:ghost}
                  size={:sm}
                  class="border border-slate-200"
                >
                  Compose thank you
                </Pyraui.Components.Button.button>
              </:actions>
            </Pyraui.Components.Alert.alert>

            <Pyraui.Components.Alert.alert
              variant={:neutral}
              badge="Digest"
              title="This week’s highlights"
            >
              <ul class="space-y-2 text-slate-700">
                <li>• 3 new integrations joined the marketplace</li>
                <li>• Team velocity improved by <span class="text-slate-900">12%</span></li>
                <li>• 2 accessibility upgrades shipped in Designer</li>
              </ul>
            </Pyraui.Components.Alert.alert>

            <Pyraui.Components.Alert.alert
              variant={:note}
              badge="Note"
              title="Remember to rotate secrets"
              message="Rotate environment secrets every 30 days to align with the security playbook."
            />
          </div>

          <div class="mt-10 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.alert
      variant={:celebrate}
      badge="Celebration"
      title="Product adoption is soaring"
    &gt;
      &lt;p&gt;Activations grew 34% this sprint. Give the GTM team a high five!&lt;/p&gt;
      &lt;:actions&gt;
        &lt;.button variant={:ghost} size={:sm}&gt;Share announcement&lt;/.button&gt;
      &lt;/:actions&gt;
    &lt;/.alert&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_24px_80px_-60px_rgba(147,197,253,0.25)] transition-all duration-300 hover:-translate-y-1">
          <div class="flex flex-col gap-2">
            <h2 class="text-2xl font-semibold text-slate-900">Dismissible + Actions</h2>
            <p class="text-sm text-slate-600">
              Alerts love progressive disclosure. Combine dismissal, custom copy, and inline CTAs for effortless follow-up.
            </p>
          </div>

          <div class="mt-6">
            <Pyraui.Components.Alert.alert
              variant={:info}
              badge="Auto-update"
              title="Version 1.18 is ready"
              dismissible={true}
            >
              <p class="text-slate-700">
                Restart before 09:00 to ensure production nodes receive the latest runtime patches and observability tweaks.
              </p>
              <:actions>
                <Pyraui.Components.Button.button
                  variant={:primary}
                  size={:sm}
                  class="shadow-[0_12px_35px_-20px_rgba(59,130,246,0.35)]"
                >
                  Apply update
                </Pyraui.Components.Button.button>
                <Pyraui.Components.Button.button
                  variant={:ghost}
                  size={:sm}
                  class="border border-slate-200"
                >
                  Remind me later
                </Pyraui.Components.Button.button>
              </:actions>
            </Pyraui.Components.Alert.alert>
          </div>

          <div class="mt-8 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <pre class="overflow-x-auto text-sm leading-6 text-slate-700">
    <code phx-no-curly-interpolation class="block whitespace-pre">
    &lt;.alert variant={:info} badge="Update" title="New release" dismissible&gt;
      &lt;p&gt;Your workspace can opt-in to the latest features right away.&lt;/p&gt;
      &lt;:actions&gt;
        &lt;.button variant={:primary} size={:sm}&gt;Enable now&lt;/.button&gt;
        &lt;.button variant={:ghost} size={:sm}&gt;Later&lt;/.button&gt;
      &lt;/:actions&gt;
    &lt;/.alert&gt;
    </code>
            </pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8">
          <h2 class="text-2xl font-semibold text-slate-900">Props</h2>
          <p class="mt-2 max-w-xl text-sm text-slate-600">
            Configure alerts with a small, expressive API. Defaults are optimised for accessibility, motion polish, and theming.
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
                  <td class="px-6 py-4 text-sky-600">:info</td>
                  <td class="px-6 py-4">
                    Choose the tone. Supports :info, :success, :warning, :danger, :celebrate, :neutral, :note.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">title</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-sky-600">nil</td>
                  <td class="px-6 py-4">Optional heading that anchors the message hierarchy.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">message</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-sky-600">nil</td>
                  <td class="px-6 py-4">
                    Plain string message. Compose markup inside the component for richer content.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">badge</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-sky-600">nil</td>
                  <td class="px-6 py-4">
                    Adds a high-contrast capsule label (e.g. “Launch”, “Critical”).
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">icon</td>
                  <td class="px-6 py-4">string | nil</td>
                  <td class="px-6 py-4 text-sky-600">auto</td>
                  <td class="px-6 py-4">Override the hero icon. Defaults to a tone-aware icon.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">dismissible</td>
                  <td class="px-6 py-4">boolean</td>
                  <td class="px-6 py-4 text-sky-600">false</td>
                  <td class="px-6 py-4">Allow users to close the alert once acknowledged.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">class</td>
                  <td class="px-6 py-4">string</td>
                  <td class="px-6 py-4 text-sky-600">""</td>
                  <td class="px-6 py-4">
                    Append classes to the outer container for bespoke layout tuning.
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-slate-900">slots</td>
                  <td class="px-6 py-4">actions</td>
                  <td class="px-6 py-4 text-sky-600">—</td>
                  <td class="px-6 py-4">
                    Use the <code class="rounded bg-slate-100 px-1">:actions</code>
                    slot for inline call-to-actions.
                  </td>
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
