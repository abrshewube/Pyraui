defmodule PyrauiWeb.DocsLive.HeroDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Hero</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Flexible hero banner with title, subtitle, CTA, and optional background image.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Product Launch Hero</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Hero.hero
              title="Ship Better Products"
              subtitle="Plan, collaborate, and deliver features with confidence."
              cta="Get Started"
              cta_href="#"
              background="https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1400&q=80"
              class="rounded-2xl overflow-hidden"
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.hero
      title="Ship Better Products"
      subtitle="Plan, collaborate, and deliver features."
      cta="Get Started"
      cta_href={~p"/signup"}
      background="https://example.com/hero.jpg"
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Custom Content</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.Hero.hero
              title="Developer Summit 2025"
              subtitle="Join thousands of engineers for three days of talks, workshops, and networking."
              centered={false}
            >
              <div class="flex flex-wrap gap-3">
                <Pyraui.Components.Link.link href="#" variant={:primary}>
                  Reserve Seat
                </Pyraui.Components.Link.link>
                <Pyraui.Components.Link.link href="#" variant={:secondary}>
                  Explore Agenda
                </Pyraui.Components.Link.link>
              </div>
            </Pyraui.Components.Hero.hero>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
