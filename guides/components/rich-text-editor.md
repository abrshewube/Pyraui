# Rich Text Editor

> Live demo: [`/docs/rich-text-editor`](https://pyraui.onrender.com/docs/rich-text-editor)

The rich text editor delivers collaborative, markdown-friendly editing with polished toolbars and live previewing.

## Highlights

- Toolbar with headings, lists, callouts, and code blocks.
- Slash commands and keyboard shortcuts for power users.
- LiveView-compatible payloads with HTML or Markdown output.

## Quick usage

```heex
<.rich_text_editor
  id="release-notes-editor"
  value={@form[:release_notes].value}
  on_change="update_notes"
  toolbar={[:bold, :italic, :link, :code_block]}
/>
```

## Tips

- Sanitize HTML server-side when persisting user-generated content.
- Provide placeholders explaining expected content style.
- Pair with `<.preview>` or `<.diff>` to show before/after comparisons.

