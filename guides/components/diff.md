# Diff Viewer

> Live demo: [`/docs/diff`](https://pyraui.onrender.com/docs/diff)

The diff component compares text, JSON payloads, or configuration files with color-backed highlights. Use it for changelog review, audit trails, or collaborative editing.

## Highlights

- Inline and split view layouts available via assigns.
- Syntax-aware styling that keeps context readable in dark themes.
- Scroll-synced panes ensure sections stay aligned.

## Quick usage

```heex
<.diff
  id="release-notes"
  mode={:split}
  left={@previous_yaml}
  right={@current_yaml}
  language="yaml"
/>
```

## Tips

- Keep diff inputs trimmed to avoid highlight noise from trailing whitespace.
- Set `language` to trigger syntax tokens for JSON, YAML, and other formats.
- Pair with `<.modal>` to show diffs inside confirmation flows or approvals.

