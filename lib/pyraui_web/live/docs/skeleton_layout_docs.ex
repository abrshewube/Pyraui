defmodule PyrauiWeb.DocsLive.SkeletonLayoutDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Skeleton Layout</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Full-page skeleton layouts for dashboard, article, and profile loading states.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Dashboard Skeleton</h2>
          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.SkeletonLayout.skeleton_layout variant={:dashboard} />
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Article &amp; Profile</h2>
          <div class="grid gap-6 lg:grid-cols-2">
            <div class="bg-white p-6 rounded-lg border border-gray-200 shadow-sm">
              <Pyraui.Components.SkeletonLayout.skeleton_layout variant={:article} />
            </div>
            <div class="bg-white p-6 rounded-lg border border-gray-200 shadow-sm">
              <Pyraui.Components.SkeletonLayout.skeleton_layout variant={:profile} />
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Usage</h2>
          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.skeleton_layout variant={:dashboard} /&gt;
    &lt;.skeleton_layout variant={:article} class="mt-6" /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
