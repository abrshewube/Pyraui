defmodule PyrauiWeb.DocsLive.AvatarDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Avatar</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Avatar component for displaying user profile pictures, initials, or custom content.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center gap-4">
              <Pyraui.Components.Avatar.avatar name="John Doe" />
              <Pyraui.Components.Avatar.avatar name="Jane Smith" />
              <Pyraui.Components.Avatar.avatar name="AB" />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.avatar name="John Doe" /&gt;
    &lt;.avatar name="Jane Smith" /&gt;
    &lt;.avatar name="AB" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Sizes</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center gap-4">
              <Pyraui.Components.Avatar.avatar name="XS" size={:xs} />
              <Pyraui.Components.Avatar.avatar name="SM" size={:sm} />
              <Pyraui.Components.Avatar.avatar name="MD" size={:md} />
              <Pyraui.Components.Avatar.avatar name="LG" size={:lg} />
              <Pyraui.Components.Avatar.avatar name="XL" size={:xl} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.avatar name="XS" size={:xs} /&gt;
    &lt;.avatar name="SM" size={:sm} /&gt;
    &lt;.avatar name="MD" size={:md} /&gt;
    &lt;.avatar name="LG" size={:lg} /&gt;
    &lt;.avatar name="XL" size={:xl} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Image</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center gap-4">
              <Pyraui.Components.Avatar.avatar src="/images/logo.svg" name="Logo" />
              <Pyraui.Components.Avatar.avatar src="/images/logo.svg" name="Logo" size={:lg} />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.avatar src="/images/user.jpg" name="User Name" /&gt;
    &lt;.avatar src="/images/user.jpg" name="User Name" size={:lg} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Online Status</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center gap-4">
              <Pyraui.Components.Avatar.avatar name="Online" online={true} />
              <Pyraui.Components.Avatar.avatar name="Offline" online={false} />
              <Pyraui.Components.Avatar.avatar name="No Status" />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.avatar name="User" online={true} /&gt;
    &lt;.avatar name="User" online={false} /&gt;
    &lt;.avatar name="User" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Content</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="flex items-center gap-4">
              <Pyraui.Components.Avatar.avatar>
                <PyrauiWeb.CoreComponents.icon name="hero-user" class="w-6 h-6" />
              </Pyraui.Components.Avatar.avatar>

              <Pyraui.Components.Avatar.avatar>
                <span class="text-xl">👤</span>
              </Pyraui.Components.Avatar.avatar>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.avatar&gt;
      &lt;.icon name="hero-user" class="w-6 h-6" /&gt;
    &lt;/.avatar&gt;
    &lt;.avatar&gt;
      &lt;span&gt;👤&lt;/span&gt;
    &lt;/.avatar&gt;
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
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">src</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Image source URL. If provided, displays image instead of initials
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">name</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Name for generating initials (first letter of each word, max 2 characters)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">size</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :xs | :sm | :md | :lg | :xl
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Avatar size</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    online
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">boolean</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Show online (true) or offline (false) status indicator. nil hides indicator
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">class</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">""</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Additional CSS classes</td>
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
