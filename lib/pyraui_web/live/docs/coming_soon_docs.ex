defmodule PyrauiWeb.DocsLive.ComingSoonDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-4xl font-bold mb-4">Coming Soon</h1>

      <p class="text-xl text-gray-600 mb-8">
        This component documentation is being built. Check back soon!
      </p>
    </div>
    """
  end
end
