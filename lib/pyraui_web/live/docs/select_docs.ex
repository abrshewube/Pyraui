defmodule PyrauiWeb.DocsLive.SelectDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Select</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Select dropdown component with options and validation states.
        </p>
      </div>

      <div class="space-y-12">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Essentials</h2>

          <div class="bg-white p-6 md:p-8 rounded-2xl border border-gray-200 shadow-sm max-w-3xl">
            <.form for={@select_profile_form} id="select-profile" class="grid gap-6 sm:grid-cols-2">
              <Pyraui.Components.Select.select
                field={@select_profile_form[:country]}
                label="Primary Market"
                helper="Select where the initiative will launch first."
              >
                <option value="">Select a country</option>

                <option value="us">United States</option>

                <option value="ca">Canada</option>

                <option value="uk">United Kingdom</option>

                <option value="de">Germany</option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                field={@select_profile_form[:region]}
                label="Regional Hub"
              >
                <option value="">Choose a hub</option>

                <option value="north_america">North America</option>

                <option value="emea">EMEA</option>

                <option value="apac">Asia-Pacific</option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                field={@select_profile_form[:timezone]}
                label="Operating Timezone"
                helper="Used for scheduling cross-team rituals."
              >
                <option value="">Select a timezone</option>

                <optgroup :for={group <- @select_timezone_groups} label={group.label}>
                  <option
                    :for={option <- group.options}
                    value={option.value}
                  >
                    {option.label}
                  </option>
                </optgroup>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                label="Disabled state"
                helper="Great for showing blocked inputs"
                disabled
              >
                <option>Disabled option</option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                label="Error state"
                error="This selection is required"
              >
                <option value="">Select an option</option>
              </Pyraui.Components.Select.select>
            </.form>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.form for={@form}&gt;
      &lt;.select field={@form[:country]} label="Primary Market"&gt;
        &lt;option value=""&gt;Select a country&lt;/option&gt;
        &lt;option value="us"&gt;United States&lt;/option&gt;
      &lt;/.select&gt;
      &lt;.select field={@form[:timezone]} label="Operating Timezone"&gt;
        &lt;optgroup :for={group &lt;- @timezone_groups} label={group.label}&gt;
          &lt;option :for={option &lt;- group.options} value={option.value}&gt;
            {option.label}
          &lt;/option&gt;
        &lt;/optgroup&gt;
      &lt;/.select&gt;
    &lt;/.form&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Quick Filters</h2>

          <div class="bg-white p-6 md:p-8 rounded-2xl border border-gray-200 shadow-sm max-w-4xl">
            <div class="flex flex-wrap items-center justify-between gap-4 mb-6">
              <div>
                <p class="text-xs uppercase tracking-widest text-blue-500 font-semibold">Active Pipeline</p>
                <h3 class="text-xl font-semibold text-gray-900">17 opportunities this quarter</h3>
              </div>

              <div class="flex items-center gap-3 text-sm text-gray-500">
                <span class="inline-flex items-center gap-2 rounded-full bg-emerald-50 px-3 py-1 font-medium text-emerald-600">
                  <span class="size-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
                  Live
                </span>
                Updated moments ago
              </div>
            </div>

            <.form
              for={@select_filters_form}
              id="select-filters"
              class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4"
            >
              <Pyraui.Components.Select.select
                field={@select_filters_form[:status]}
                label="Status"
                helper="Focus the board by state."
              >
                <option value="">All statuses</option>

                <option
                  :for={status <- @select_status_options}
                  value={status.value}
                >
                  {status.label}
                </option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                field={@select_filters_form[:owner]}
                label="Owner"
              >
                <option value="">Anyone</option>

                <option
                  :for={member <- @select_team_members}
                  value={member.value}
                >
                  {member.label}
                </option>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                field={@select_filters_form[:timezone]}
                label="Timezone"
              >
                <option value="">All timezones</option>

                <optgroup :for={group <- @select_timezone_groups} label={group.label}>
                  <option
                    :for={option <- group.options}
                    value={option.value}
                  >
                    {option.label}
                  </option>
                </optgroup>
              </Pyraui.Components.Select.select>

              <Pyraui.Components.Select.select
                label="Multiple select"
                required
                helper="Hold Ctrl or ⌘ to select multiple teammates."
                multiple
                name="filters[members][]"
              >
                <option value="ava-stone">Ava Stone</option>
                <option value="mateo-garcia">Mateo García</option>
                <option value="priya-patel">Priya Patel</option>
                <option value="noah-hill">Noah Hill</option>
              </Pyraui.Components.Select.select>
            </.form>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.form for={@filters_form}&gt;
      &lt;.select field={@filters_form[:status]} label="Status"&gt;
        &lt;option value=""&gt;All statuses&lt;/option&gt;
        &lt;option :for={status &lt;- @status_options} value={status.value}&gt;
          {status.label}
        &lt;/option&gt;
      &lt;/.select&gt;
      &lt;.select multiple name="filters[members][]" label="Team"&gt;
        &lt;option value="ava-stone"&gt;Ava Stone&lt;/option&gt;
        &lt;option value="mateo-garcia"&gt;Mateo García&lt;/option&gt;
      &lt;/.select&gt;
    &lt;/.form&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Design Details</h2>

          <ul class="space-y-4 text-gray-700">
            <li>
              <span class="font-medium text-gray-900">Accessible defaults:</span>
              Associate selects with labels, add helpers for context, and rely on the browser’s dropdown for consistent keyboard support.
            </li>
            <li>
              <span class="font-medium text-gray-900">Group related choices:</span>
              Use <code class="px-1 rounded bg-gray-100">optgroup</code> for regions, teams, or contexts so long menus stay scannable.
            </li>
            <li>
              <span class="font-medium text-gray-900">Micro-interactions:</span>
              Subtle focus rings and helper text guide quick decisions without overwhelming the UI.
            </li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
