# Tag Input

> Live demo: [`/docs/tag-input`](https://pyraui.onrender.com/docs/tag-input)

Tag inputs collect freeform tags with inline creation, autocomplete suggestions, and pill styling.

## Highlights

- Supports keyboard shortcuts for quick entry and deletion.
- Suggestion dropdown keeps users productive with curated lists.
- Validation hooks prevent duplicates or disallowed tokens.

## Quick usage

```heex
<.tag_input
  field={@form[:tags]}
  suggestions={@suggestions}
  placeholder="Add product tag"
/>
```

## Tips

- Normalize tags (lowercase, trimmed) before persisting to keep data tidy.
- Provide immediate feedback when tags are rejected (length, characters, etc.).
- Combine with `<.multi_select>` for scenarios mixing existing and new tokens.

