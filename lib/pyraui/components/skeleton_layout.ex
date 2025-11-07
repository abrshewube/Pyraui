defmodule Pyraui.Components.SkeletonLayout do
  @moduledoc """
  Skeleton Layout component for full page loading placeholders.

  ## Examples

      <.skeleton_layout variant={:dashboard} />
      <.skeleton_layout variant={:article} />
  """

  use Phoenix.Component

  attr :variant, :atom,
    default: :default,
    values: [:default, :dashboard, :article, :profile],
    doc: "Layout variant"

  attr :class, :string, default: ""
  attr :rest, :global

  def skeleton_layout(assigns) do
    ~H"""
    <div class={["skeleton-layout", @class]} {@rest}>
      <%= cond do %>
        <% @variant == :dashboard -> %>
          <div class="space-y-6 p-6">
            <!-- Header -->
            <div class="flex items-center justify-between">
              <div class="h-8 w-48 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>

              <div class="h-10 w-32 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>
            </div>
            <!-- Stats Grid -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
              <%= for _i <- 1..4 do %>
                <div class="h-24 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
              <% end %>
            </div>
            <!-- Content Area -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
              <div class="lg:col-span-2 space-y-4">
                <div class="h-64 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>

                <div class="h-32 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
              </div>

              <div class="space-y-4">
                <div class="h-48 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>

                <div class="h-32 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
              </div>
            </div>
          </div>
        <% @variant == :article -> %>
          <div class="max-w-4xl mx-auto p-6 space-y-6">
            <!-- Title -->
            <div class="h-10 w-3/4 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>
            <!-- Meta -->
            <div class="flex items-center space-x-4">
              <div class="h-6 w-24 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>

              <div class="h-6 w-32 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>
            </div>
            <!-- Image -->
            <div class="h-64 w-full bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
            <!-- Content Lines -->
            <%= for _i <- 1..8 do %>
              <% width_percent = :rand.uniform(100) %>
              <div
                class="h-4 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"
                style={"width: #{width_percent}%"}
              >
              </div>
            <% end %>
          </div>
        <% @variant == :profile -> %>
          <div class="max-w-4xl mx-auto p-6 space-y-6">
            <!-- Profile Header -->
            <div class="flex items-center space-x-6">
              <div class="h-24 w-24 bg-gray-200 dark:bg-gray-700 rounded-full animate-pulse"></div>

              <div class="flex-1 space-y-3">
                <div class="h-8 w-48 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>

                <div class="h-4 w-64 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>

                <div class="h-10 w-32 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>
              </div>
            </div>
            <!-- Tabs -->
            <div class="flex space-x-4 border-b border-gray-200 dark:border-gray-700">
              <%= for _i <- 1..3 do %>
                <div class="h-10 w-24 bg-gray-200 dark:bg-gray-700 rounded-t animate-pulse"></div>
              <% end %>
            </div>
            <!-- Content Grid -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
              <%= for _i <- 1..6 do %>
                <div class="h-48 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
              <% end %>
            </div>
          </div>
        <% true -> %>
          <!-- Default Layout -->
          <div class="p-6 space-y-4">
            <div class="h-8 w-64 bg-gray-200 dark:bg-gray-700 rounded animate-pulse"></div>

            <%= for _i <- 1..5 do %>
              <div class="h-20 bg-gray-200 dark:bg-gray-700 rounded-lg animate-pulse"></div>
            <% end %>
          </div>
      <% end %>
    </div>
    """
  end
end
