defmodule PyrauiWeb.DocsLive.UserProfileCardDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">User Profile Card</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          User profile card component with online/offline status, avatar, and user information. Perfect for displaying user details in a card format.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Profile Card</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.UserProfileCard.user_profile_card
              name="John Doe"
              email="john@example.com"
              role="Software Engineer"
              bio="Passionate developer building amazing products"
              online={true}
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.user_profile_card
                name="John Doe"
                email="john@example.com"
                avatar="/images/avatar.jpg"
                online={true}
              /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Actions</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.UserProfileCard.user_profile_card
              name="Jane Smith"
              email="jane@example.com"
              role="Product Designer"
              online={false}
              actions={@sample_actions}
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.user_profile_card
                name="Jane Smith"
                actions={[
                  %{label: "Message", variant: :primary, on_click: "message-user"},
                  %{label: "Follow", variant: :outline, on_click: "follow-user"}
                ]}
              /&gt;
            </code></pre>
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">name</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">User's full name</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    online
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">false</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Online status indicator</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    avatar
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">URL to user's avatar image</td>
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
