# Textarea

> Live demo: [`/docs/textarea`](https://pyraui.onrender.com/docs/textarea)

Textareas capture longer messages, feedback, and notes with luxurious padding and live character counts.

## Highlights

- Auto-grow and fixed-height modes.
- Supports helper text, validation states, and soft focus glows.
- Optional footer slot for word counts or keyboard shortcut hints.

## Quick usage

```heex
<.textarea
  field={@form[:summary]}
  label="Project summary"
  placeholder="Describe what you shipped..."
  character_limit={280}
/>
```

## Tips

- Enable `character_limit` to prevent overly long submissions.
- Pair with `<.badge>` or `<.toast>` to celebrate successful submissions.
- Use `auto_grow` for messaging experiences so the field expands naturally.

