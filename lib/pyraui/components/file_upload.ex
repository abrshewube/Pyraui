defmodule Pyraui.Components.FileUpload do
  @moduledoc """
  File upload component with drag & drop support and live progress tracking.

  Uses Phoenix LiveView's built-in file upload functionality.

  ## Examples

      <.file_upload uploads={@uploads.avatar} label="Upload Avatar" />
      <.file_upload uploads={@uploads.documents} accept=".pdf,.doc" max_entries={5} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents
  alias Phoenix.LiveView.JS

  attr :uploads, :map, required: true, doc: "Uploads map from socket"
  attr :accept, :string, default: "*/*", doc: "Accepted file types (e.g., 'image/*', '.pdf,.doc')"
  attr :max_entries, :integer, default: 1, doc: "Maximum number of files"

  attr :max_file_size, :integer,
    default: 10_485_760,
    doc: "Maximum file size in bytes (default: 10MB)"

  attr :label, :string, default: "Choose files"
  attr :drag_label, :string, default: "Drag and drop files here or click to browse"
  attr :class, :string, default: ""
  attr :rest, :global

  def file_upload(assigns) do
    ~H"""
    <div class={["file-upload-container", @class]} {@rest}>
      <div
        phx-drop-target={@uploads.ref}
        class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:border-blue-400 transition-colors cursor-pointer bg-gray-50 hover:bg-gray-100"
        phx-click={JS.dispatch("click", to: "##{@uploads.ref}-input")}
      >
        <input
          type="file"
          id={"#{@uploads.ref}-input"}
          class="hidden"
          phx-hook="FileUploadHook"
          data-upload-ref={@uploads.ref}
          accept={@accept}
          multiple={@max_entries > 1}
        />
        <div class="space-y-4">
          <svg
            class="mx-auto h-12 w-12 text-gray-400"
            stroke="currentColor"
            fill="none"
            viewBox="0 0 48 48"
            aria-hidden="true"
          >
            <path
              d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
          <div>
            <p class="text-sm text-gray-600">{@drag_label}</p>

            <p class="text-xs text-gray-500 mt-1">
              <%= if @max_entries > 1 do %>
                Up to {@max_entries} files, max {format_file_size(@max_file_size)} each
              <% else %>
                Max {format_file_size(@max_file_size)}
              <% end %>
            </p>
          </div>
        </div>
      </div>

      <%= if @uploads.entries != [] do %>
        <div class="mt-4 space-y-2">
          <%= for entry <- @uploads.entries do %>
            <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg border border-gray-200">
              <div class="flex items-center space-x-3 flex-1 min-w-0">
                <div class="flex-shrink-0">
                  <.icon name="hero-document" class="w-5 h-5 text-gray-400" />
                </div>

                <div class="flex-1 min-w-0">
                  <p class="text-sm font-medium text-gray-900 truncate">{entry.client_name}</p>

                  <p class="text-xs text-gray-500">
                    {format_file_size(entry.client_size)}
                    <%= if entry.progress < 100 do %>
                      · {entry.progress}% uploaded
                    <% end %>
                  </p>
                </div>
              </div>

              <%= if entry.progress < 100 do %>
                <div class="flex items-center space-x-2 ml-4">
                  <div class="w-24 bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-blue-600 h-2 rounded-full transition-all duration-300"
                      style={"width: #{entry.progress}%"}
                    >
                    </div>
                  </div>

                  <button
                    type="button"
                    phx-click="cancel-upload"
                    phx-value-ref={entry.ref}
                    class="text-red-600 hover:text-red-800"
                    aria-label="cancel"
                  >
                    <.icon name="hero-x-mark" class="w-4 h-4" />
                  </button>
                </div>
              <% else %>
                <div class="flex items-center space-x-2 ml-4">
                  <.icon name="hero-check-circle" class="w-5 h-5 text-green-500" />
                  <button
                    type="button"
                    phx-click="remove-upload"
                    phx-value-ref={entry.ref}
                    class="text-red-600 hover:text-red-800"
                    aria-label="remove"
                  >
                    <.icon name="hero-x-mark" class="w-4 h-4" />
                  </button>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      <% end %>

      <%= for err <- get_upload_errors(@uploads) do %>
        <p class="mt-2 text-sm text-red-600">{error_to_string(err)}</p>
      <% end %>
    </div>
    """
  end

  defp format_file_size(bytes) when bytes < 1024, do: "#{bytes} B"
  defp format_file_size(bytes) when bytes < 1_048_576, do: "#{Float.round(bytes / 1024, 1)} KB"

  defp format_file_size(bytes) when bytes < 1_073_741_824,
    do: "#{Float.round(bytes / 1_048_576, 1)} MB"

  defp format_file_size(bytes), do: "#{Float.round(bytes / 1_073_741_824, 1)} GB"

  defp get_upload_errors(%{errors: errors}), do: errors
  defp get_upload_errors(_), do: []

  defp error_to_string({:too_large, _}), do: "File is too large"
  defp error_to_string({:too_many_files, _}), do: "Too many files"
  defp error_to_string({:not_accepted, _}), do: "File type not accepted"
  defp error_to_string({:external_client_failure, _}), do: "Upload failed"
  defp error_to_string(_), do: "Upload error"
end
