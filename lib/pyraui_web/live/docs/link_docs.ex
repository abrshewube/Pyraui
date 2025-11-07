defmodule PyrauiWeb.DocsLive.LinkDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Link</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Styled link component with support for external links and LiveView `navigate`/`patch`.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Variants</h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm space-y-4">
            <Pyraui.Components.Link.link href="#" variant={:default}>
              Default link
            </Pyraui.Components.Link.link>
            <Pyraui.Components.Link.link href="#" variant={:primary}>
              Primary link
            </Pyraui.Components.Link.link>
            <Pyraui.Components.Link.link href="#" variant={:secondary}>
              Secondary link
            </Pyraui.Components.Link.link>
            <Pyraui.Components.Link.link href="#" variant={:underline}>
              Underline link
            </Pyraui.Components.Link.link>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
    &lt;.link href="#"&gt;Default link&lt;/.link&gt;
    &lt;.link href="#" variant={:primary}&gt;Primary&lt;/.link&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">
            LiveView Navigation
          </h2>

          <div class="bg-white dark:bg-gray-800 p-6 rounded-lg border border-gray-200 dark:border-gray-700 mb-4 shadow-sm space-y-3">
            <Pyraui.Components.Link.link navigate={~p"/docs/getting-started"} class="font-semibold">
              Getting started
            </Pyraui.Components.Link.link>
            <Pyraui.Components.Link.link patch={~p"/docs?section=components"} variant={:secondary}>
              Stay on page (patch)
            </Pyraui.Components.Link.link>
            <Pyraui.Components.Link.link href="https://ashui.dev" external={true} variant={:primary}>
              External link
            </Pyraui.Components.Link.link>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
    &lt;.link navigate={~p"/dashboard"}&gt;Dashboard&lt;/.link&gt;
    &lt;.link patch={~p"/docs?section=components"}&gt;Components&lt;/.link&gt;
    &lt;.link href="https://ashui.dev" external={true}&gt;PyraUI&lt;/.link&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
