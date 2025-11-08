defmodule PyrauiWeb.DocsLive.SkeletonDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="rounded-none border-0 bg-white px-6 py-10 text-slate-900">
      <div class="space-y-12">
        <header class="space-y-4">
          <h1 class="text-4xl font-bold">Skeleton</h1>
          <p class="text-lg text-slate-600">
            Beautiful loading placeholders for content. Use to indicate progress while data fetches.
          </p>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Essentials</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div class="space-y-4">
              <h3 class="font-semibold">Text variants</h3>
              <Pyraui.Components.Skeleton.skeleton variant={:text} size={:sm} />
              <Pyraui.Components.Skeleton.skeleton variant={:text} size={:md} />
              <Pyraui.Components.Skeleton.skeleton variant={:text} size={:lg} />
              <Pyraui.Components.Skeleton.skeleton variant={:text} lines={3} />
            </div>
            <div class="space-y-4">
              <h3 class="font-semibold">Circle & Rect</h3>
              <div class="flex items-center gap-4">
                <Pyraui.Components.Skeleton.skeleton variant={:circle} size={:sm} />
                <Pyraui.Components.Skeleton.skeleton variant={:circle} size={:md} />
                <Pyraui.Components.Skeleton.skeleton variant={:circle} size={:lg} />
              </div>
              <Pyraui.Components.Skeleton.skeleton variant={:rect} width="200px" height="100px" />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Profile Card Placeholder</h2>
          <div class="rounded-xl border border-slate-200 bg-white p-6">
            <div class="flex items-start gap-4">
              <Pyraui.Components.Skeleton.skeleton variant={:circle} size={:lg} />
              <div class="flex-1 space-y-3">
                <Pyraui.Components.Skeleton.skeleton variant={:text} size={:lg} width="40%" />
                <Pyraui.Components.Skeleton.skeleton variant={:text} width="70%" />
                <Pyraui.Components.Skeleton.skeleton variant={:text} width="55%" />
              </div>
            </div>
            <div class="mt-6 flex gap-3">
              <Pyraui.Components.Skeleton.skeleton
                variant={:rect}
                width="96px"
                height="36px"
                class="rounded-full"
              />
              <Pyraui.Components.Skeleton.skeleton
                variant={:rect}
                width="96px"
                height="36px"
                class="rounded-full"
              />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">List Placeholder</h2>
          <div class="rounded-xl border border-slate-200 bg-white divide-y divide-slate-200">
            <%= for _i <- 1..5 do %>
              <div class="p-5 flex items-center gap-4">
                <Pyraui.Components.Skeleton.skeleton variant={:circle} size={:md} />
                <div class="flex-1 space-y-3">
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="40%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="70%" />
                </div>
                <Pyraui.Components.Skeleton.skeleton
                  variant={:rect}
                  width="72px"
                  height="28px"
                  class="rounded-full"
                />
              </div>
            <% end %>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Table Rows Placeholder</h2>
          <div class="rounded-xl border border-slate-200 bg-white p-6">
            <div class="grid grid-cols-12 gap-4 mb-4">
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="20%" />
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="15%" />
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="25%" />
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="10%" />
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="15%" />
              <Pyraui.Components.Skeleton.skeleton variant={:text} width="15%" />
            </div>
            <div class="space-y-3">
              <%= for _ <- 1..4 do %>
                <div class="grid grid-cols-12 gap-4">
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="60%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="50%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="70%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="40%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="55%" />
                  <Pyraui.Components.Skeleton.skeleton variant={:text} width="50%" />
                </div>
              <% end %>
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Article Placeholder</h2>
          <div class="rounded-xl border border-slate-200 bg-white p-6 space-y-4">
            <Pyraui.Components.Skeleton.skeleton variant={:text} size={:lg} width="65%" />
            <Pyraui.Components.Skeleton.skeleton variant={:text} width="90%" />
            <Pyraui.Components.Skeleton.skeleton variant={:text} width="85%" />
            <Pyraui.Components.Skeleton.skeleton variant={:text} width="80%" />
            <div class="grid grid-cols-3 gap-4 pt-2">
              <Pyraui.Components.Skeleton.skeleton variant={:rect} height="140px" />
              <Pyraui.Components.Skeleton.skeleton variant={:rect} height="140px" />
              <Pyraui.Components.Skeleton.skeleton variant={:rect} height="140px" />
            </div>
          </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-8 shadow-[0_20px_60px_-50px_rgba(15,23,42,0.35)] space-y-6">
          <h2 class="text-2xl font-semibold">Props</h2>
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Prop
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Type
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Default
                  </th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Description
                  </th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    variant
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    :text | :circle | :rect
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:text</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Skeleton shape variant</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">size</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:sm | :md | :lg</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">:md</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Size for text and circle variants</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">lines</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">1</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Number of lines for text variant</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">width</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Custom width (e.g., "200px")</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    height
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>
                  <td class="px-6 py-4 text-sm text-gray-700">Custom height (e.g., "100px")</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
