# File Upload

> Live demo: [`/docs/file-upload`](https://pyraui.onrender.com/docs/file-upload)

PyraUI's file upload experience handles drag-and-drop, upload progress, and validation with graceful fallbacks. It integrates tightly with Phoenix LiveView uploads while keeping the interface refined and approachable.

## Highlights

- Drag-and-drop surface with hover states and iconography.
- Progress bars, file type badges, and error messaging built in.
- Supports multi-file uploads and content previews.
- Works with LiveView's `allow_upload/3` API for back-pressure and chunking.

## Quick usage

```elixir
# live view mount
def mount(_params, _session, socket) do
  socket =
    allow_upload(socket, :assets,
      accept: ~w(.png .jpg .pdf),
      max_entries: 5,
      max_file_size: 10_000_000
    )

  {:ok, socket}
end
```

```heex
<.file_upload upload={@uploads.assets} id="brand-assets-upload">
  <:empty>
    <.icon name="hero-arrow-up-tray" class="h-8 w-8 text-sky-300" />
    <span class="text-white font-semibold">Drop assets or browse</span>
    <span class="text-sm text-slate-400">PNG, JPG, PDF up to 10MB each</span>
  </:empty>
</.file_upload>
```

## Tips

- Use `consume_uploaded_entries/3` in `handle_event/3` to process files after upload.
- Surface upload errors inline in the component by reading `@uploads.assets.errors`.
- Pair with `<.toast>` to notify users when asynchronous processing finishes.

