defmodule PyrauiWeb.DocsLive.ListDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">List</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Data list component for displaying structured information with titles and content.
        </p>
      </div>

      <div class="space-y-12">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item title="Name">John Doe</:item>

              <:item title="Email">john@example.com</:item>

              <:item title="Role">Administrator</:item>

              <:item title="Status">Active</:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item title="Name"&gt;John Doe&lt;/:item&gt;
      &lt;:item title="Email"&gt;john@example.com&lt;/:item&gt;
      &lt;:item title="Role"&gt;Administrator&lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Team Directory</h2>

          <div class="bg-white p-6 rounded-2xl border border-gray-200 shadow-sm">
            <div class="flex items-center justify-between mb-6">
              <div>
                <p class="text-sm uppercase tracking-wider text-gray-500">Studio</p>
                <h3 class="text-xl font-semibold text-gray-900">Design Systems Group</h3>
              </div>

              <span class="inline-flex items-center gap-2 text-sm text-gray-500">
                <span class="size-2 rounded-full bg-emerald-400 animate-pulse"></span>
                3 collaborators online
              </span>
            </div>

            <PyrauiWeb.CoreComponents.list>
              <:item :for={profile <- @list_profiles} title={profile.name}>
                <div class="flex items-start justify-between gap-6">
                  <div class="flex gap-4">
                    <img
                      src={profile.avatar}
                      alt={"#{profile.name} avatar"}
                      class="h-12 w-12 rounded-xl object-cover ring-4 ring-blue-50"
                    />

                    <div class="space-y-2">
                      <div>
                        <p class="text-sm font-medium text-gray-900">{profile.title}</p>
                        <p class="text-sm text-gray-500">
                          {profile.team} · {profile.location}
                        </p>
                      </div>

                      <div class="flex flex-wrap items-center gap-2">
                        <span class="inline-flex items-center gap-2 rounded-full bg-blue-50 px-3 py-1 text-xs font-medium text-blue-600">
                          <span class="size-1.5 rounded-full bg-blue-400 animate-pulse"></span>
                          {profile.availability}
                        </span>

                        <span class="text-xs text-gray-500">{profile.focus}</span>
                      </div>

                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={tag <- profile.tags}
                          class="inline-flex items-center rounded-full border border-gray-200 px-3 py-1 text-xs font-medium text-gray-600 hover:border-gray-300 hover:text-gray-900 transition-colors"
                        >
                          {tag}
                        </span>
                      </div>
                    </div>
                  </div>

                  <button
                    type="button"
                    class="inline-flex items-center gap-2 rounded-full border border-gray-200 bg-white px-4 py-2 text-sm font-medium text-gray-600 hover:border-blue-200 hover:bg-blue-50 hover:text-blue-600 transition-all"
                  >
                    <.icon name="hero-chat-bubble-left-right" class="size-4" />
                    Sync
                  </button>
                </div>
              </:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item :for={profile &lt;- @profiles} title={profile.name}&gt;
        &lt;div class="flex items-center justify-between"&gt;
          &lt;div&gt;
            &lt;p class="font-medium"&gt;{profile.title}&lt;/p&gt;
            &lt;p class="text-sm text-gray-500"&gt;{profile.team}&lt;/p&gt;
          &lt;/div&gt;
          &lt;.badge variant={:outline}&gt;{profile.availability}&lt;/.badge&gt;
        &lt;/div&gt;
      &lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Badges</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item title="Status">
                <Pyraui.Components.Badge.badge variant={:success}>
                  Active
                </Pyraui.Components.Badge.badge>
              </:item>

              <:item title="Priority">
                <Pyraui.Components.Badge.badge variant={:warning}>High</Pyraui.Components.Badge.badge>
              </:item>

              <:item title="Category">
                <Pyraui.Components.Badge.badge variant={:info}>Feature</Pyraui.Components.Badge.badge>
              </:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item title="Status"&gt;
        &lt;.badge variant={:success}&gt;Active&lt;/.badge&gt;
      &lt;/:item&gt;
      &lt;:item title="Priority"&gt;
        &lt;.badge variant={:warning}&gt;High&lt;/.badge&gt;
      &lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Activity Feed</h2>

          <div class="bg-white p-6 rounded-2xl border border-gray-200 shadow-sm">
            <PyrauiWeb.CoreComponents.list>
              <:item :for={activity <- @list_activity} title={activity.label}>
                <div class="flex items-start gap-4">
                  <span
                    class={[
                      "inline-flex items-center justify-center rounded-xl p-3",
                      activity_badge_class(activity.status)
                    ]}
                  >
                    <.icon name={activity.icon} class="size-5" />
                  </span>

                  <div class="flex-1 space-y-2">
                    <p class="text-sm text-gray-600">{activity.description}</p>

                    <div class="flex items-center gap-3 text-xs text-gray-400">
                      <div class="inline-flex items-center gap-1">
                        <span class="size-1.5 rounded-full bg-gray-300"></span>
                        {activity.timestamp}
                      </div>

                      <span class="inline-flex items-center gap-1 font-medium text-gray-500">
                        <.icon name="hero-arrow-top-right-on-square" class="size-3" />
                        View thread
                      </span>
                    </div>
                  </div>
                </div>
              </:item>
            </PyrauiWeb.CoreComponents.list>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.list&gt;
      &lt;:item :for={item &lt;- @activity} title={item.label}&gt;
        &lt;div class="flex gap-3"&gt;
          &lt;.icon name={item.icon} class="size-4 text-blue-500" /&gt;
          &lt;div&gt;
            &lt;p class="text-sm text-gray-600"&gt;{item.description}&lt;/p&gt;
            &lt;p class="text-xs text-gray-400"&gt;{item.timestamp}&lt;/p&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;/:item&gt;
    &lt;/.list&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props & Slots</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Prop
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Type
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Default
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Description
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    item (slot)
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">slot</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">required</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    List items. Each item accepts:
                    <ul class="list-disc list-inside mt-1 space-y-1">
                      <li>
                        <code class="bg-gray-100 px-1 rounded">title</code>
                        - Title/label for the item (required)
                      </li>
                    </ul>
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

  defp activity_badge_class(:in_progress),
    do: "bg-blue-50 text-blue-500 ring-1 ring-inset ring-blue-100"

  defp activity_badge_class(:review),
    do: "bg-amber-50 text-amber-600 ring-1 ring-inset ring-amber-100"

  defp activity_badge_class(:done),
    do: "bg-emerald-50 text-emerald-600 ring-1 ring-inset ring-emerald-100"

  defp activity_badge_class(_status),
    do: "bg-gray-100 text-gray-500 ring-1 ring-inset ring-gray-200"
end
