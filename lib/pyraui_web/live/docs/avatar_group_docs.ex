defmodule PyrauiWeb.DocsLive.AvatarGroupDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Avatar Group</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Avatar group component for displaying multiple users in a row with overlapping avatars. Supports online status indicators and overflow count.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Stacked Avatars</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.AvatarGroup.avatar_group users={@sample_users} max_visible={5} />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.avatar_group users={@users} max_visible={5} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Different Sizes</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm space-y-4">
            <div>
              <p class="text-sm text-gray-600 mb-2">Small</p>

              <Pyraui.Components.AvatarGroup.avatar_group
                users={Enum.take(@sample_users, 4)}
                size={:sm}
              />
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Medium</p>

              <Pyraui.Components.AvatarGroup.avatar_group
                users={Enum.take(@sample_users, 4)}
                size={:md}
              />
            </div>

            <div>
              <p class="text-sm text-gray-600 mb-2">Large</p>

              <Pyraui.Components.AvatarGroup.avatar_group
                users={Enum.take(@sample_users, 4)}
                size={:lg}
              />
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props</h2>

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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">users</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">list</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    List of user maps with :name, :avatar, :online
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    max_visible
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">5</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Maximum number of avatars to show</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">size</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">atom</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Avatar size (:sm, :md, :lg)</td>
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
