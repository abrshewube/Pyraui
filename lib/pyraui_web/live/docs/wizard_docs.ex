defmodule PyrauiWeb.DocsLive.WizardDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <h1 class="text-4xl font-bold">Wizard</h1>
          <p class="text-lg text-slate-600">Multi-step flows with progress, tone colors, and compact spacing options.</p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Basic Wizard</h2>
          <div class="bg-white p-6 rounded-xl border border-slate-200">
            <Pyraui.Components.Wizard.wizard id="docs-wizard-basic" tone={:blue}>
              <:step id="step1" title="Personal Info" active={true}>
                <div class="p-6 bg-slate-50 rounded-lg">
                  <h3 class="text-lg font-semibold mb-2">Step 1: Personal Information</h3>
                  <p class="text-slate-600">Enter your personal details here.</p>
                </div>
              </:step>
              <:step id="step2" title="Account Details">
                <div class="p-6 bg-slate-50 rounded-lg">
                  <h3 class="text-lg font-semibold mb-2">Step 2: Account Details</h3>
                  <p class="text-slate-600">Set up your account information.</p>
                </div>
              </:step>
              <:step id="step3" title="Review">
                <div class="p-6 bg-slate-50 rounded-lg">
                  <h3 class="text-lg font-semibold mb-2">Step 3: Review</h3>
                  <p class="text-slate-600">Review and confirm your information.</p>
                </div>
              </:step>
            </Pyraui.Components.Wizard.wizard>
          </div>
          <div class="bg-slate-50 p-4 rounded-lg overflow-x-auto border border-slate-200">
            <pre class="text-slate-800 text-sm"><code phx-no-curly-interpolation>
              &lt;.wizard id="signup-wizard" tone={:blue}&gt;
                &lt;:step id="step1" title="Personal Info" active={true}&gt;
                  &lt;p&gt;Step 1 content&lt;/p&gt;
                &lt;/:step&gt;
                &lt;:step id="step2" title="Account Details"&gt;
                  &lt;p&gt;Step 2 content&lt;/p&gt;
                &lt;/:step&gt;
                &lt;:step id="step3" title="Review"&gt;
                  &lt;p&gt;Step 3 content&lt;/p&gt;
                &lt;/:step&gt;
              &lt;/.wizard&gt;
            </code></pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Tones</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Indigo</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-indigo" tone={:indigo} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Violet</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-violet" tone={:violet} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Emerald</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-emerald" tone={:emerald} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Teal</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-teal" tone={:teal} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Rose</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-rose" tone={:rose} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
            <div class="rounded-xl border border-slate-200 p-6">
              <h3 class="font-semibold mb-4">Orange</h3>
              <Pyraui.Components.Wizard.wizard id="docs-wizard-orange" tone={:orange} compact={true}>
                <:step id="s1" title="Info" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s2" title="Details"><div class="h-24 bg-slate-50 rounded"></div></:step>
                <:step id="s3" title="Review"><div class="h-24 bg-slate-50 rounded"></div></:step>
              </Pyraui.Components.Wizard.wizard>
            </div>
          </div>
          <div class="bg-slate-50 p-4 rounded-lg overflow-x-auto border border-slate-200">
            <pre class="text-slate-800 text-sm"><code phx-no-curly-interpolation>
              &lt;.wizard id="flow" tone={:indigo} compact={true}&gt;
                &lt;:step id="s1" title="Info" active={true}&gt;&lt;div class="h-24"&gt;&lt;/div&gt;&lt;/:step&gt;
                &lt;:step id="s2" title="Details"&gt;&lt;div class="h-24"&gt;&lt;/div&gt;&lt;/:step&gt;
                &lt;:step id="s3" title="Review"&gt;&lt;div class="h-24"&gt;&lt;/div&gt;&lt;/:step&gt;
              &lt;/.wizard&gt;
            </code></pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Options</h2>
          <div class="bg-white p-6 rounded-xl border border-slate-200 space-y-4">
            <div class="flex items-center justify-between">
              <span class="font-medium">Compact spacing</span>
              <span class="text-slate-500">compact={true}</span>
            </div>
            <Pyraui.Components.Wizard.wizard id="docs-wizard-compact" tone={:slate} compact={true}>
              <:step id="a" title="Start" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
              <:step id="b" title="Middle"><div class="h-24 bg-slate-50 rounded"></div></:step>
              <:step id="c" title="End"><div class="h-24 bg-slate-50 rounded"></div></:step>
            </Pyraui.Components.Wizard.wizard>
            <div class="flex items-center justify-between pt-4">
              <span class="font-medium">Hide progress</span>
              <span class="text-slate-500">show_progress={false}</span>
            </div>
            <Pyraui.Components.Wizard.wizard id="docs-wizard-noprogress" tone={:violet} show_progress={false}>
              <:step id="one" title="One" active={true}><div class="h-24 bg-slate-50 rounded"></div></:step>
              <:step id="two" title="Two"><div class="h-24 bg-slate-50 rounded"></div></:step>
            </Pyraui.Components.Wizard.wizard>
          </div>
          <div class="bg-slate-50 p-4 rounded-lg overflow-x-auto border border-slate-200">
            <pre class="text-slate-800 text-sm"><code phx-no-curly-interpolation>
              &lt;.wizard id="flow" tone={:slate} compact={true}&gt;...&lt;/.wizard&gt;
              &lt;.wizard id="flow2" tone={:violet} show_progress={false}&gt;...&lt;/.wizard&gt;
            </code></pre>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Props</h2>
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Prop</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Type</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Default</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Description</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">id</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for the wizard</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">tone</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:blue | :indigo | :violet | :emerald | :teal | :rose | :orange | :slate</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:blue</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Color tone used for active/completed/progress and primary button</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">compact</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Use compact spacing</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">show_progress</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">true</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Show the top progress indicator</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">step.id</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Unique ID for each step</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">step.title</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Step title</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">step.active</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Whether the step is currently active</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">step.completed</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Whether the step is completed</td>
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
