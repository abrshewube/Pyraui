defmodule PyrauiWeb.DocsLive.BadgeCardDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Badge Card</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Gamified badge card for achievements, loyalty programs, and progress tracking.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Badge Showcase</h2>

          <div class="grid gap-6 md:grid-cols-3">
            <%= for badge <- @demo_badges do %>
              <Pyraui.Components.BadgeCard.badge_card {badge} />
            <% end %>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200 mt-6">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.badge_card
      title="Collaboration Pro"
      description="Invite five teammates"
      icon="hero-users"
      rarity={:rare}
      progress={60}
      points={120}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Tips</h2>
          <ul class="space-y-2 text-gray-700 list-disc list-inside">
            <li>
              Use the <code class="px-1 py-0.5 bg-gray-200 rounded text-xs">rarity</code>
              attr to theme border and icon colors.
            </li>
            <li>
              Show progress bar for locked achievements with <code class="px-1 py-0.5 bg-gray-200 rounded text-xs">progress</code>.
            </li>
            <li>
              Include <code class="px-1 py-0.5 bg-gray-200 rounded text-xs">points</code>
              and <code class="px-1 py-0.5 bg-gray-200 rounded text-xs">unlocked_at</code>
              for richer context.
            </li>
          </ul>
        </section>
      </div>
    </div>
    """
  end
end
