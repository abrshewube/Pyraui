# Select

> Live demo: [`/docs/select`](https://pyraui.onrender.com/docs/select)

Select menus are optimized for clarity and accessibility with search, grouped options, and keyboard navigation.

## Highlights

- Supports native `<select>` fallback and custom dropdown.
- Group labels and dividers help organize large option sets.
- Works with LiveView validations and default values seamlessly.

## Quick usage

```heex
<.select
  field={@form[:plan]}
  label="Choose a plan"
  options={[
    {"Starter", "starter"},
    {"Growth", "growth"},
    {"Scale", "scale"}
  ]}
/>
```

## Tips

- Use grouped options for categories to keep long lists navigable.
- Provide descriptive labels rather than abbreviations when possible.
- Pair with `<.conditional_form>` to reveal follow-up fields based on selection.

