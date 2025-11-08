defmodule PyrauiWeb.DocsLive.ConnectionsWidgetDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Connections Widget</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Social-style connections list with avatars, status indicators, mutual counts, and custom actions.
        </p>
      </div>

      <div class="space-y-12">
        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-gray-900">Followers Snapshot</h2>
              <p class="text-sm text-gray-600">
                Showcase a curated set of followers with online presence, mutual connections, and a CTA slot.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-blue-50 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-blue-600">
              Realtime presence
            </div>
          </div>

          <div class="grid gap-6 lg:grid-cols-[1.2fr_1fr]">
            <div class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm">
              <Pyraui.Components.ConnectionsWidget.connections_widget
                connections={@demo_connections.followers}
                current_user={@demo_current_user}
                type={:followers}
                max_display={4}
              >
                <:action>
                  <button
                    type="button"
                    class="rounded-lg border border-blue-200 px-4 py-2 text-sm font-semibold text-blue-600 transition hover:border-blue-300 hover:bg-blue-50 hover:text-blue-700"
                  >
                    View All
                  </button>
                </:action>
              </Pyraui.Components.ConnectionsWidget.connections_widget>
            </div>

            <div class="space-y-4 rounded-2xl border border-gray-200 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-6 text-slate-200 shadow-lg">
              <h3 class="text-sm font-semibold uppercase tracking-[0.3em] text-slate-400">
                Tips
              </h3>
              <ul class="space-y-3 text-sm leading-relaxed">
                <li>
                  Use
                  <code class="rounded bg-slate-800 px-1 py-0.5 text-xs text-emerald-300">
                    type={:followers}
                  </code>
                  for inbound requests and
                  <code class="rounded bg-slate-800 px-1 py-0.5 text-xs text-emerald-300">
                    max_display
                  </code>
                  to limit avatar density.
                </li>
                <li>
                  Mixing online and offline states keeps the panel lively. The component applies the status badge automatically.
                </li>
                <li>
                  Slot an
                  <code class="rounded bg-slate-800 px-1 py-0.5 text-xs text-emerald-300">
                    :action
                  </code>
                  button to funnel users into dedicated follower dialogs or modals.
                </li>
              </ul>
            </div>
          </div>

          <div class="rounded-xl border border-gray-200 bg-gray-50 p-4">
            <pre class="text-sm text-gray-800"><code phx-no-curly-interpolation>
            &lt;.connections_widget connections={@followers} current_user={@user_id} type={:followers} max_display={4}&gt;
              &lt;:action&gt;
                &lt;button class="rounded-lg border border-blue-200 px-4 py-2 text-sm"&gt;View All&lt;/button&gt;
              &lt;/:action&gt;
            &lt;/.connections_widget&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-gray-900">People You May Know</h2>
              <p class="text-sm text-gray-600">
                Highlight mutual connections and quick actions to send invites or dismiss suggestions.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-emerald-600">
              Smart Suggestions
            </div>
          </div>

          <div class="grid gap-6 lg:grid-cols-[1.4fr_1fr]">
            <div class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm">
              <Pyraui.Components.ConnectionsWidget.connections_widget
                connections={@demo_connections.suggestions}
                current_user={@demo_current_user}
                type={:connections}
                max_display={5}
              >
                <:action>
                  <button
                    type="button"
                    class="rounded-lg border border-emerald-200 px-4 py-2 text-sm font-semibold text-emerald-600 transition hover:border-emerald-300 hover:bg-emerald-50 hover:text-emerald-700"
                  >
                    Refresh Suggestions
                  </button>
                </:action>
              </Pyraui.Components.ConnectionsWidget.connections_widget>
            </div>

            <div class="rounded-2xl border border-emerald-100 bg-emerald-50/70 p-6 text-emerald-900 shadow-sm">
              <h3 class="text-sm font-semibold uppercase tracking-[0.3em] text-emerald-600">
                Suggestion logic
              </h3>
              <p class="mt-4 text-sm leading-relaxed">
                Use the same component to showcase recommended experts or collaborators. Populate
                <code class="rounded bg-white px-1 py-0.5 text-xs text-emerald-700">
                  mutual_count
                </code>
                to boost social proof, and flip
                <code class="rounded bg-white px-1 py-0.5 text-xs text-emerald-700">
                  is_connected
                </code>
                to update button copy automatically.
              </p>
              <div class="mt-4 grid gap-3 text-xs text-emerald-700">
                <div class="flex items-center gap-2 rounded-lg border border-emerald-200 bg-white px-3 py-2">
                  <span class="h-2 w-2 rounded-full bg-emerald-500"></span>
                  <span>Online suggestions surface with a rich avatar ring.</span>
                </div>
                <div class="flex items-center gap-2 rounded-lg border border-emerald-200 bg-white px-3 py-2">
                  <span class="h-2 w-2 rounded-full bg-emerald-300"></span>
                  <span>Pending invites disable the CTA so states stay consistent.</span>
                </div>
              </div>
            </div>
          </div>

          <div class="rounded-xl border border-gray-200 bg-gray-50 p-4">
            <pre class="text-sm text-gray-800"><code phx-no-curly-interpolation>
            &lt;.connections_widget connections={@suggestions} current_user={@user_id} type={:connections} max_display={5}&gt;
              &lt;:action&gt;
                &lt;button class="rounded-lg border border-emerald-200 px-4 py-2 text-sm"&gt;Refresh Suggestions&lt;/button&gt;
              &lt;/:action&gt;
            &lt;/.connections_widget&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-6">
          <div class="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <h2 class="text-2xl font-semibold text-gray-900">Team Roster</h2>
              <p class="text-sm text-gray-600">
                Switch the widget to a
                <span class="rounded bg-gray-200 px-1 py-0.5 text-xs font-semibold">:following</span>
                context to spotlight internal teammates or cohort members.
              </p>
            </div>
            <div class="inline-flex items-center gap-2 rounded-full border border-purple-200 bg-purple-50 px-4 py-2 text-xs font-semibold uppercase tracking-[0.3em] text-purple-600">
              Team Ops
            </div>
          </div>

          <div class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm">
            <Pyraui.Components.ConnectionsWidget.connections_widget
              connections={@demo_connections.team}
              current_user={@demo_current_user}
              type={:following}
              max_display={6}
            >
              <:action>
                <button
                  type="button"
                  class="rounded-lg border border-purple-200 px-4 py-2 text-sm font-semibold text-purple-600 transition hover:border-purple-300 hover:bg-purple-50 hover:text-purple-700"
                >
                  Manage Roles
                </button>
              </:action>
            </Pyraui.Components.ConnectionsWidget.connections_widget>
          </div>

          <div class="rounded-xl border border-gray-200 bg-gray-50 p-4">
            <pre class="text-sm text-gray-800"><code phx-no-curly-interpolation>
            &lt;.connections_widget connections={@team} current_user={@user_id} type={:following} max_display={6}&gt;
      &lt;:action&gt;
                &lt;button class="rounded-lg border border-purple-200 px-4 py-2 text-sm"&gt;Manage Roles&lt;/button&gt;
      &lt;/:action&gt;
    &lt;/.connections_widget&gt;
            </code></pre>
          </div>
        </section>

        <section class="space-y-4 border-t border-gray-200 pt-8">
          <h2 class="text-2xl font-semibold text-gray-900">Props</h2>
          <p class="text-sm text-gray-600">
            Drive the widget with a simple list of maps. Each map supports <code class="rounded bg-gray-200 px-1 py-0.5 text-xs">:name</code>, <code class="rounded bg-gray-200 px-1 py-0.5 text-xs">:username</code>, <code class="rounded bg-gray-200 px-1 py-0.5 text-xs">:mutual_count</code>, <code class="rounded bg-gray-200 px-1 py-0.5 text-xs">:online</code>, and more.
          </p>
          <div class="overflow-hidden rounded-2xl border border-gray-200">
            <table class="min-w-full divide-y divide-gray-100 text-sm">
              <thead class="bg-gray-50 text-xs uppercase tracking-[0.3em] text-gray-500">
                <tr>
                  <th class="px-6 py-3 text-left">Prop</th>
                  <th class="px-6 py-3 text-left">Type</th>
                  <th class="px-6 py-3 text-left">Default</th>
                  <th class="px-6 py-3 text-left">Description</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-100 bg-white text-gray-700">
                <tr>
                  <td class="px-6 py-4 font-medium text-gray-900">connections</td>
                  <td class="px-6 py-4">list</td>
                  <td class="px-6 py-4 text-gray-400">[]</td>
                  <td class="px-6 py-4">
                    List of connection maps (name, avatar, mutual_count, etc.)
                  </td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-gray-900">current_user</td>
                  <td class="px-6 py-4">integer</td>
                  <td class="px-6 py-4 text-gray-400">nil</td>
                  <td class="px-6 py-4">Current user's id, used to highlight owned connections.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-gray-900">type</td>
                  <td class="px-6 py-4">:followers | :following | :connections</td>
                  <td class="px-6 py-4 text-gray-400">:followers</td>
                  <td class="px-6 py-4">Changes the copy and CTA defaults per use case.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-gray-900">max_display</td>
                  <td class="px-6 py-4">integer</td>
                  <td class="px-6 py-4 text-gray-400">5</td>
                  <td class="px-6 py-4">Control how many avatars render before truncation.</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 font-medium text-gray-900">size</td>
                  <td class="px-6 py-4">:sm | :md | :lg</td>
                  <td class="px-6 py-4 text-gray-400">:md</td>
                  <td class="px-6 py-4">
                    Adjust the avatar dimensions to match your layout density.
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
