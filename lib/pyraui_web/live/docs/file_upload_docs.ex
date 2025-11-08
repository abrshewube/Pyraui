defmodule PyrauiWeb.DocsLive.FileUploadDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">File Upload</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          File upload component with drag & drop support and live progress tracking. Uses Phoenix LiveView's built-in file upload functionality.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic File Upload</h2>

          <div class="space-y-6">
            <Pyraui.Components.FileUpload.file_upload
              uploads={@uploads.docs_files}
              label="Upload demo assets"
              drag_label="Drop files here or click to browse"
              max_entries={4}
              class="max-w-4xl rounded-3xl border border-slate-200 bg-white shadow-[0_45px_95px_-60px_rgba(59,130,246,0.25)]"
            />

            <%= if @docs_uploaded_files != [] do %>
              <div class="max-w-4xl rounded-2xl border border-slate-200 bg-slate-50 p-6">
                <h3 class="text-sm font-semibold uppercase tracking-[0.3em] text-slate-500">
                  Uploaded in this session
                </h3>
                <ul class="mt-4 space-y-2 text-sm text-slate-700">
                  <%= for file <- @docs_uploaded_files do %>
                    <li class="flex items-center justify-between rounded-xl bg-white px-4 py-3 shadow-sm">
                      <span class="font-medium truncate">{file.name}</span>
                      <span class="text-xs text-slate-500">
                        {Float.round(file.size / 1_048_576, 2)} MB
                      </span>
                    </li>
                  <% end %>
                </ul>
              </div>
            <% end %>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.file_upload uploads={@uploads.avatar} label="Upload Avatar" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Multiple Files</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.file_upload uploads={@uploads.documents} accept=".pdf,.doc" max_entries={5} /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">LiveView Setup</h2>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              def mount(_params, _session, socket) do
                {:ok,
                 socket
                 |> allow_upload(:avatar, accept: ~w(.jpg .jpeg .png), max_entries: 1, max_file_size: 10_000_000)}
              end

              def handle_event("validate", _params, socket) do
                {:noreply, socket}
              end

              def handle_event("cancel-upload", %{"ref" => ref}, socket) do
                {:noreply, cancel_upload(socket, :avatar, ref)}
              end
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props</h2>

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
                    uploads
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">map</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Uploads map from socket (e.g., @uploads.avatar)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    accept
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"*/*"</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Accepted file types (e.g., "image/*", ".pdf,.doc")
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    max_entries
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">1</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Maximum number of files</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    max_file_size
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">integer</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">10485760</td>

                  <td class="px-6 py-4 text-sm text-gray-700">
                    Maximum file size in bytes (default: 10MB)
                  </td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    drag_label
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    "Drag and drop files here..."
                  </td>

                  <td class="px-6 py-4 text-sm text-gray-700">Custom drag & drop label text</td>
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
