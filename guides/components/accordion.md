# Accordion Panels

> Live demo: [`/docs/accordion`](https://pyraui.onrender.com/docs/accordion)

Accordion panels are perfect for FAQs, onboarding checklists, and dense settings pages. PyraUI ships accordions with elegant motion, keyboard support, and slots that keep content flexible.

## Highlights

- Smooth expand/collapse transitions with accessible focus states.
- Supports icons, badges, and status chips inside headers.
- Works with LiveView assigns so you can control open sections dynamically.

## Quick usage

```heex
<.accordion id="faq">
  <:item title="Is PyraUI production ready?" open>
    Absolutely—each component is crafted for SaaS-grade experiences.
  </:item>
  <:item title="Does it support dark mode?">
    Yes. Tailwind-first styling adapts to light and dark surfaces effortlessly.
  </:item>
</.accordion>
```

## Tips

- Set the `open` attribute on a slot to default the section to expanded.
- Drive multi-open behaviour by tracking a list of opened ids in the LiveView state.
- Pair with `<.badge>` to show status or counts inside accordion headers.

