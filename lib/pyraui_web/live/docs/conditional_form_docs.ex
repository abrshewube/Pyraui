defmodule PyrauiWeb.DocsLive.ConditionalFormDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Conditional Form</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Conditional / dynamic form component where fields appear/disappear based on user input.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.ConditionalForm.conditional_form id="conditional-form-demo">
                <:field name="user_type" type="select" options={["individual", "business"]} />
                <:conditional_field show_if={%{"user_type" => "business"}}>
                  <div class="mb-4">
                    <label
                      for="company_name-input"
                      class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                    >
                      Company Name
                    </label>
                    <input
                      type="text"
                      id="company_name-input"
                      name="company_name"
                      class="block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100"
                    />
                  </div>
                </:conditional_field>
              </Pyraui.Components.ConditionalForm.conditional_form>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.conditional_form id="dynamic-form"&gt;
      &lt;:field name="user_type" type="select" options={["individual", "business"]} /&gt;
      &lt;:conditional_field show_if={%{"user_type" => "business"}}&gt;
        &lt;div class="mb-4"&gt;
          &lt;label for="company_name-input"&gt;Company Name&lt;/label&gt;
          &lt;input type="text" id="company_name-input" name="company_name" /&gt;
        &lt;/div&gt;
      &lt;/:conditional_field&gt;
    &lt;/.conditional_form&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Subscription Upgrades</h2>

          <div class="grid gap-6 lg:grid-cols-[1fr_1.2fr]">
            <div class="rounded-2xl border border-indigo-100 bg-indigo-50/60 p-6 shadow-sm">
              <div class="space-y-2">
                <span class="inline-flex items-center gap-2 rounded-full border border-indigo-100 bg-white/80 px-3 py-1 text-xs font-semibold uppercase tracking-[0.25em] text-indigo-500">
                  Guided Upsell
                </span>
                <p class="text-sm text-indigo-900/80">
                  Unlock tailored add-ons once a plan tier is selected. Annual billing surfaces an incentive banner automatically.
                </p>
                <p class="text-xs text-indigo-900/70">
                  Perfect for pricing pages, upgrade modals, and checkout flows with progressive disclosure.
                </p>
              </div>
            </div>

            <div class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm">
              <Pyraui.Components.ConditionalForm.conditional_form
                id="conditional-form-subscription"
                class="space-y-4"
              >
                <:field
                  name="plan"
                  type="select"
                  label="Plan tier"
                  options={["Starter", "Growth", "Enterprise"]}
                />

                <:conditional_field show_if={%{"plan" => "Growth"}}>
                  <div class="rounded-xl border border-emerald-100 bg-emerald-50/70 p-4">
                    <p class="text-sm font-semibold text-emerald-900">Growth perks</p>
                    <p class="text-xs text-emerald-900/80">
                      Enable collaboration seats and workflow automation once you graduate past Starter.
                    </p>
                    <div class="mt-4 grid gap-4 sm:grid-cols-2">
                      <div>
                        <label
                          for="automation_limit-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-emerald-900/80"
                        >
                          Automation limit
                        </label>
                        <select
                          id="automation_limit-input"
                          name="automation_limit"
                          class="w-full rounded-lg border border-emerald-200 bg-white px-3 py-2 text-sm text-emerald-900 focus:border-emerald-400 focus:ring-emerald-400"
                        >
                          <option value="">Choose</option>
                          <option value="100">100 runs</option>
                          <option value="250">250 runs</option>
                          <option value="500">500 runs</option>
                        </select>
                      </div>
                      <div>
                        <label
                          for="collaboration_seats-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-emerald-900/80"
                        >
                          Collaboration seats
                        </label>
                        <input
                          type="number"
                          min="1"
                          id="collaboration_seats-input"
                          name="collaboration_seats"
                          class="w-full rounded-lg border border-emerald-200 bg-white px-3 py-2 text-sm text-emerald-900 focus:border-emerald-400 focus:ring-emerald-400"
                        />
                      </div>
                    </div>
                  </div>
                </:conditional_field>

                <:conditional_field show_if={%{"plan" => "Enterprise"}}>
                  <div class="space-y-4 rounded-xl border border-purple-200 bg-purple-50/70 p-4">
                    <p class="text-sm font-semibold text-purple-900">Enterprise onboarding</p>
                    <div class="grid gap-4 sm:grid-cols-2">
                      <div>
                        <label
                          for="account_manager-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-purple-900/80"
                        >
                          Dedicated account manager
                        </label>
                        <select
                          id="account_manager-input"
                          name="account_manager"
                          class="w-full rounded-lg border border-purple-200 bg-white px-3 py-2 text-sm text-purple-900 focus:border-purple-400 focus:ring-purple-400"
                        >
                          <option value="">Assign later</option>
                          <option value="atlas">Atlas Cooper</option>
                          <option value="reign">Reign Patel</option>
                          <option value="sloane">Sloane Vega</option>
                        </select>
                      </div>
                      <div>
                        <label
                          for="compliance_pack-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-purple-900/80"
                        >
                          Compliance pack
                        </label>
                        <select
                          id="compliance_pack-input"
                          name="compliance_pack"
                          class="w-full rounded-lg border border-purple-200 bg-white px-3 py-2 text-sm text-purple-900 focus:border-purple-400 focus:ring-purple-400"
                        >
                          <option value="">Select</option>
                          <option value="soc2">SOC 2 Type II</option>
                          <option value="hipaa">HIPAA BAA</option>
                          <option value="iso">ISO 27001</option>
                        </select>
                      </div>
                    </div>
                    <div>
                      <label
                        for="enterprise_notes-input"
                        class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-purple-900/80"
                      >
                        Enterprise notes
                      </label>
                      <textarea
                        id="enterprise_notes-input"
                        name="enterprise_notes"
                        rows="3"
                        class="w-full rounded-lg border border-purple-200 bg-white px-3 py-2 text-sm text-purple-900 focus:border-purple-400 focus:ring-purple-400"
                        placeholder="Capture procurement requirements, SSO, SLAs…"
                      >
                      </textarea>
                    </div>
                  </div>
                </:conditional_field>

                <:field
                  name="billing_cycle"
                  type="select"
                  label="Billing cadence"
                  options={["Monthly", "Quarterly", "Annual"]}
                />

                <:conditional_field show_if={%{"billing_cycle" => "Annual"}}>
                  <div class="rounded-xl border border-amber-200 bg-amber-50/70 p-4 text-sm text-amber-900">
                    <p class="font-semibold">Annual bonus</p>
                    <p class="mt-1 text-xs text-amber-900/70">
                      Annual customers capture a 15% discount and concierge migration support.
                    </p>
                    <div class="mt-4 grid gap-3 sm:grid-cols-2">
                      <div>
                        <label
                          for="invoice_language-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-amber-900/80"
                        >
                          Invoice language
                        </label>
                        <select
                          id="invoice_language-input"
                          name="invoice_language"
                          class="w-full rounded-lg border border-amber-200 bg-white px-3 py-2 text-sm text-amber-900 focus:border-amber-400 focus:ring-amber-400"
                        >
                          <option value="">Choose</option>
                          <option value="english">English</option>
                          <option value="german">German</option>
                          <option value="japanese">Japanese</option>
                        </select>
                      </div>
                      <div>
                        <label
                          for="discount_code-input"
                          class="mb-2 block text-xs font-semibold uppercase tracking-[0.2em] text-amber-900/80"
                        >
                          Discount code
                        </label>
                        <input
                          type="text"
                          id="discount_code-input"
                          name="discount_code"
                          class="w-full rounded-lg border border-amber-200 bg-white px-3 py-2 text-sm text-amber-900 focus:border-amber-400 focus:ring-amber-400"
                          placeholder="LOYALTY15"
                        />
                      </div>
                    </div>
                  </div>
                </:conditional_field>
              </Pyraui.Components.ConditionalForm.conditional_form>
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Notification Preferences</h2>

          <div class="grid gap-6 lg:grid-cols-2">
            <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
              <Pyraui.Components.ConditionalForm.conditional_form
                id="conditional-form-notifications"
                class="space-y-4"
              >
                <:field
                  name="send_updates"
                  type="checkbox"
                  label="Send product updates"
                />

                <:conditional_field show_if={%{"send_updates" => true}}>
                  <div class="rounded-lg border border-blue-100 bg-blue-50/70 p-4">
                    <p class="text-xs font-semibold uppercase tracking-[0.2em] text-blue-700/80">
                      Update cadence
                    </p>
                    <div class="mt-3 grid gap-3 sm:grid-cols-2">
                      <div>
                        <label
                          for="update_frequency-input"
                          class="mb-2 block text-sm font-medium text-blue-900/80"
                        >
                          Frequency
                        </label>
                        <select
                          id="update_frequency-input"
                          name="update_frequency"
                          class="w-full rounded-lg border border-blue-200 bg-white px-3 py-2 text-sm text-blue-900 focus:border-blue-400 focus:ring-blue-400"
                        >
                          <option value="">Choose</option>
                          <option value="weekly">Weekly digest</option>
                          <option value="monthly">Monthly wrap</option>
                          <option value="quarterly">Quarterly roadmap</option>
                        </select>
                      </div>
                      <div>
                        <label
                          for="update_channel-input"
                          class="mb-2 block text-sm font-medium text-blue-900/80"
                        >
                          Channel
                        </label>
                        <select
                          id="update_channel-input"
                          name="update_channel"
                          class="w-full rounded-lg border border-blue-200 bg-white px-3 py-2 text-sm text-blue-900 focus:border-blue-400 focus:ring-blue-400"
                        >
                          <option value="">Select</option>
                          <option value="email">Email</option>
                          <option value="sms">SMS</option>
                          <option value="push">Push notification</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </:conditional_field>

                <:field
                  name="preferred_channel"
                  type="select"
                  label="Priority channel"
                  options={["Email", "SMS", "Push", "Slack"]}
                />

                <:conditional_field show_if={%{"preferred_channel" => ["SMS", "Push"]}}>
                  <div class="rounded-lg border border-slate-200 bg-slate-50/70 p-4">
                    <label
                      for="device_confirm-input"
                      class="mb-2 block text-sm font-medium text-slate-700"
                    >
                      Device confirmation
                    </label>
                    <input
                      type="text"
                      id="device_confirm-input"
                      name="device_confirm"
                      class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:border-slate-500 focus:ring-slate-500"
                      placeholder="Enter phone or device ID"
                    />
                    <p class="mt-2 text-xs text-slate-500">
                      We'll send a one-time verification code to confirm delivery.
                    </p>
                  </div>
                </:conditional_field>
              </Pyraui.Components.ConditionalForm.conditional_form>
            </div>

            <div class="rounded-2xl border border-slate-200 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-6 text-slate-200 shadow-lg">
              <div class="space-y-4">
                <p class="text-xs font-semibold uppercase tracking-[0.25em] text-slate-400">
                  Why it works
                </p>
                <div class="space-y-3 text-sm">
                  <p>
                    Checkbox toggles persist values as booleans, so
                    <code
                      phx-no-curly-interpolation
                      class="rounded bg-slate-800 px-1 py-0.5 text-xs text-emerald-300"
                    >
                      show_if: %{"send_updates" =&gt; true}
                    </code>
                    unlocks cadence controls instantly.
                  </p>
                  <p>
                    Passing a list into
                    <code
                      phx-no-curly-interpolation
                      class="rounded bg-slate-800 px-1 py-0.5 text-xs text-emerald-300"
                    >
                      show_if
                    </code>
                    supports multi-value branches without extra hooks. Here, both
                    SMS and Push reveal device verification.
                  </p>
                  <p>
                    The hook listens to the entire form, so you can mix and match select,
                    checkbox, and text inputs for progressive guidance.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
