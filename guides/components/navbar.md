# Navbar

> Live demo: [`/docs/navbar`](https://pyraui.onrender.com/docs/navbar)

Navbars anchor your application with glassmorphism surfaces, animated highlights, and responsive toggles. PyraUI’s navbar makes global navigation effortless.

## Highlights

- Sticky and translucent modes for immersive layouts.
- Built-in hamburger menu and drawer for mobile screens.
- Supports logo slot, primary links, secondary buttons, and profile menus.

## Quick usage

```heex
<.navbar id="app-nav" links={@primary_links}>
  <:logo>
    <.icon name="hero-fire" class="h-6 w-6 text-sky-400" />
    <span class="font-semibold tracking-tight">PyraUI</span>
  </:logo>
  <:cta>
    <.button variant={:primary} size={:sm}>Launch sandbox</.button>
  </:cta>
</.navbar>
```

## Tips

- Keep primary links under six to avoid overwhelming horizontal space.
- Offer a prominent CTA on the right for your highest-value action.
- Pair with `<.drawer>` for additional navigation layers or documentation indexes.

