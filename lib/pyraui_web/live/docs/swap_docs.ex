defmodule PyrauiWeb.DocsLive.SwapDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Swap</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Toggle between two states using animated swap transitions.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Mode Toggle</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm flex items-center gap-6">
            <Pyraui.Components.Swap.swap
              id="swap-theme"
              active={true}
              class="text-blue-600 text-sm font-semibold"
            >
              <:on>
                <span class="flex items-center gap-2">
                  <.icon name="hero-moon" class="w-4 h-4" /> Dark Mode
                </span>
              </:on>
              <:off>
                <span class="flex items-center gap-2">
                  <.icon name="hero-sun" class="w-4 h-4" /> Light Mode
                </span>
              </:off>
            </Pyraui.Components.Swap.swap>

            <Pyraui.Components.Swap.swap id="swap-sound" active={false}>
              <:on>
                <span class="px-3 py-1 rounded-full bg-green-100 text-green-700 text-xs font-semibold">
                  Sound On
                </span>
              </:on>
              <:off>
                <span class="px-3 py-1 rounded-full bg-gray-200 text-gray-600 text-xs font-semibold">
                  Sound Off
                </span>
              </:off>
            </Pyraui.Components.Swap.swap>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
    &lt;.swap id="theme-swap" active={@dark_mode}&gt;
      &lt;:on&gt;Dark&lt;/:on&gt;
      &lt;:off&gt;Light&lt;/:off&gt;
    &lt;/.swap&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
