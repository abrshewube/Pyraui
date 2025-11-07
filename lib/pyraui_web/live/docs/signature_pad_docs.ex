defmodule PyrauiWeb.DocsLive.SignaturePadDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Signature Pad</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Signature pad / drawing canvas component for approvals or annotations.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.SignaturePad.signature_pad
                id="signature-demo"
                width={400}
                height={200}
              />
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.signature_pad id="signature-pad" width={400} height={200} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Size</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.signature_pad id="approval-signature" width={600} height={300} clear_label="Clear" /&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
