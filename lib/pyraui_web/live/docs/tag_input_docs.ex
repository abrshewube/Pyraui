defmodule PyrauiWeb.DocsLive.TagInputDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Tag Input</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Tag / Chips input component for adding and removing multiple tags dynamically.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.TagInput.tag_input
                id="tags-demo"
                tags={["react", "elixir", "phoenix"]}
              />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.tag_input id="tags-input" tags={@tags} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Max Tags</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.tag_input id="skills-input" tags={@skills} placeholder="Add skills..." max_tags={5} /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
