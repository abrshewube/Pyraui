defmodule PyrauiWeb.DocsLive.TextareaDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Textarea</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Textarea component for multi-line text input with validation.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Examples</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md space-y-4">
              <Pyraui.Components.Textarea.textarea
                label="Message"
                placeholder="Enter your message"
                rows={4}
              />
              <Pyraui.Components.Textarea.textarea
                label="Description"
                helper="Maximum 500 characters"
                rows={6}
              />
              <Pyraui.Components.Textarea.textarea
                label="Comments"
                error="This field is required"
                rows={3}
              />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.textarea label="Message" placeholder="Enter your message" rows={4} /&gt;
    &lt;.textarea label="Description" helper="Maximum 500 characters" rows={6} /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
