defmodule PyrauiWeb.DocsLive.VideoPlayerDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900 dark:text-gray-100">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-gray-100">Video Player</h1>

      <div class="mb-8">
        <p class="text-gray-700 dark:text-gray-300 text-lg">
          Video Player component with custom controls for embedded videos.
        </p>
      </div>

      <div class="space-y-12">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Essentials</h2>

          <div class="grid gap-6 lg:grid-cols-2">
            <div class="bg-white dark:bg-gray-900 p-6 md:p-8 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm">
              <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4">Standard player</h3>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-6">
                A responsive 16:9 player with poster art and native controls.
              </p>

              <div class="aspect-video overflow-hidden rounded-xl ring-1 ring-gray-200 dark:ring-gray-800 shadow-lg">
                <Pyraui.Components.VideoPlayer.video_player
                  src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
                  poster="https://images.pexels.com/photos/713047/pexels-photo-713047.jpeg?auto=compress&cs=tinysrgb&w=1600"
                  controls={true}
                  class="h-full w-full object-cover"
                />
              </div>
            </div>

            <div class="bg-white dark:bg-gray-900 p-6 md:p-8 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm">
              <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4">Autoplay teaser</h3>
              <p class="text-sm text-gray-600 dark:text-gray-400 mb-6">
                Autoplays silently, loops in the background, and shows inline metadata.
              </p>

              <div class="space-y-4">
                <div class="overflow-hidden rounded-xl bg-gray-900/90">
                  <Pyraui.Components.VideoPlayer.video_player
                    src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
                    autoplay={true}
                    muted={true}
                    loop={true}
                    controls={false}
                    class="h-full w-full object-cover opacity-90 hover:opacity-100 transition-opacity"
                  />
                </div>

                <div class="flex items-start justify-between gap-4">
                  <div>
                    <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Inside the Studio</p>
                    <p class="text-xs text-gray-500 dark:text-gray-400">2 min · Behind the scenes</p>
                  </div>
                  <span class="inline-flex items-center gap-2 rounded-full bg-blue-50 dark:bg-blue-900/30 px-3 py-1 text-xs font-semibold text-blue-600 dark:text-blue-300">
                    <span class="size-2 rounded-full bg-blue-400 animate-pulse"></span>
                    Auto preview
                  </span>
                </div>
              </div>
            </div>
          </div>

          <div class="bg-gray-100 dark:bg-gray-900 p-4 rounded-lg overflow-x-auto border border-gray-200 dark:border-gray-700">
            <pre class="text-gray-800 dark:text-gray-200"><code phx-no-curly-interpolation>
    &lt;.video_player
      src="https://.../BigBuckBunny.mp4"
      poster="https://.../poster.jpeg"
      controls
    /&gt;

    &lt;.video_player
      src="https://.../ElephantsDream.mp4"
      autoplay
      muted
      loop
      controls={false}
    /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">
            Immersive Hero
          </h2>

          <div class="relative overflow-hidden rounded-3xl border border-gray-200 dark:border-gray-800 bg-gray-950 text-white">
            <Pyraui.Components.VideoPlayer.video_player
              src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
              autoplay={true}
              loop={true}
              muted={true}
              controls={false}
              class="h-full w-full object-cover opacity-70"
            />

            <div class="absolute inset-0 bg-gradient-to-tr from-gray-900 via-transparent to-gray-900/40"></div>

            <div class="relative z-10 px-6 md:px-12 py-16 md:py-24 max-w-3xl space-y-6">
              <span class="inline-flex items-center gap-2 rounded-full bg-white/10 px-4 py-1 text-xs font-semibold uppercase tracking-widest">
                <span class="size-2 rounded-full bg-emerald-400 animate-pulse"></span>
                Featured Story
              </span>
              <h3 class="text-3xl md:text-4xl font-semibold leading-tight">
                Orbital Prototype: How the crew iterates at escape velocity
              </h3>
              <p class="text-base md:text-lg text-gray-100/80">
                Blend motion, narrative, and performance. Autoplay backgrounds are muted by default and keep page interaction buttery-smooth.
              </p>
              <div class="flex flex-wrap items-center gap-4 text-sm text-gray-200/80">
                <span class="inline-flex items-center gap-2">
                  <.icon name="hero-clock" class="size-4" />
                  08:24 runtime
                </span>
                <span class="inline-flex items-center gap-2">
                  <.icon name="hero-user-group" class="size-4" />
                  Directed by The Atlas Team
                </span>
              </div>
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">
            Playlist Grid
          </h2>

          <div class="bg-white dark:bg-gray-900 p-6 md:p-8 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm">
            <div class="grid gap-6 lg:grid-cols-3">
              <article class="lg:col-span-2 space-y-4">
                <p class="text-sm uppercase tracking-widest text-blue-500 font-semibold">
                  Product Walkthroughs
                </p>
                <h3 class="text-2xl font-semibold text-gray-900 dark:text-gray-100">
                  See how teams orchestrate launches with mission control
                </h3>
                <div class="aspect-video overflow-hidden rounded-xl ring-1 ring-gray-200 dark:ring-gray-800 shadow-xl">
                  <Pyraui.Components.VideoPlayer.video_player
                    src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
                    poster="https://images.pexels.com/photos/572897/pexels-photo-572897.jpeg?auto=compress&cs=tinysrgb&w=1600"
                    controls={true}
                    class="h-full w-full object-cover"
                  />
                </div>
              </article>

              <div class="space-y-4">
                <div class="rounded-xl border border-gray-200 dark:border-gray-800 bg-gray-50 dark:bg-gray-900/40 p-4 space-y-3">
                  <h4 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Upcoming drops</h4>

                  <div class="space-y-3">
                    <button
                      type="button"
                      class="w-full rounded-lg bg-white dark:bg-gray-900 px-3 py-2 text-left text-sm text-gray-600 dark:text-gray-300 hover:bg-blue-50 hover:text-blue-600 dark:hover:bg-blue-900/40 transition-colors"
                    >
                      <span class="font-medium">Adaptive Workflows</span>
                      <p class="text-xs text-gray-400">3 mins · Ships next week</p>
                    </button>

                    <button
                      type="button"
                      class="w-full rounded-lg bg-white dark:bg-gray-900 px-3 py-2 text-left text-sm text-gray-600 dark:text-gray-300 hover:bg-blue-50 hover:text-blue-600 dark:hover:bg-blue-900/40 transition-colors"
                    >
                      <span class="font-medium">Analytics for Signals</span>
                      <p class="text-xs text-gray-400">5 mins · Deep dive</p>
                    </button>
                  </div>
                </div>

                <div class="rounded-xl border border-gray-200 dark:border-gray-800 bg-white dark:bg-gray-900 p-4">
                  <h4 class="text-sm font-semibold text-gray-900 dark:text-gray-100 mb-2">Download assets</h4>
                  <ul class="space-y-2 text-xs text-gray-500 dark:text-gray-400">
                    <li class="flex items-center justify-between rounded-lg border border-dashed border-gray-200 dark:border-gray-800 px-3 py-2">
                      Storyboard.pdf
                      <span class="text-blue-600 dark:text-blue-300 font-medium">10 MB</span>
                    </li>
                    <li class="flex items-center justify-between rounded-lg border border-dashed border-gray-200 dark:border-gray-800 px-3 py-2">
                      Product-demo.mov
                      <span class="text-blue-600 dark:text-blue-300 font-medium">220 MB</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900 dark:text-gray-100">Props</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 border border-gray-200 dark:border-gray-700">
              <thead class="bg-gray-50 dark:bg-gray-800">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Prop
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Type
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Default
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 dark:text-gray-300 uppercase">
                    Description
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    src
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    string
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    -
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Video source URL</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                    autoplay
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    boolean
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">
                    false
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Autoplay video</td>
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
