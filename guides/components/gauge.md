# Gauges

> Live demo: [`/docs/gauge`](https://pyraui.onrender.com/docs/gauge)

Gauges celebrate metrics like NPS, uptime, or resource utilization with radial motion and high-contrast labels.

## Highlights

- Supports arcs, needles, and donut styles.
- Customizable ranges, thresholds, and icon accents.
- LiveView-friendly updates keep the needle smooth during spikes.

## Quick usage

```heex
<.gauge id="nps" value={@nps_score} min={0} max={100} label="Net Promoter Score" />
```

## Tips

- Color-code thresholds (e.g., red/amber/emerald) to signal health instantly.
- Pair with `<.toast>` when the metric crosses key milestones.
- Use alongside `<.stats>` to provide textual context beside the gauge.

