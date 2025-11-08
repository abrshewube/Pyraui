# Signature Pad

> Live demo: [`/docs/signature-pad`](https://pyraui.onrender.com/docs/signature-pad)

Signature pads capture legally binding signatures with smooth ink simulation and responsive canvas sizing.

## Highlights

- Touch and mouse support with pressure-sensitive styling.
- Clear, undo, and download actions built into the toolbar slot.
- Emits PNG or SVG payloads ready for storage.

## Quick usage

```heex
<.signature_pad
  id="contract-signature"
  value={@signature}
  on_change="update_signature"
  on_clear="clear_signature"
/>
```

## Tips

- Persist signature data after every stroke to prevent loss on disconnect.
- Offer guidance text so users know if initials or full name are required.
- Combine with `<.modal>` or `<.drawer>` for compact contract review experiences.

