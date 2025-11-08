# Gantt Charts

> Live demo: [`/docs/gantt`](https://pyraui.onrender.com/docs/gantt)

Gantt charts track projects, sprints, and operations timelines with resizable bars, milestones, and dependencies. PyraUI frames them in rich gradients for premium planning.

## Highlights

- Zoom controls and date snapping for precise scheduling.
- Task slots support avatars, tags, and progress indicators.
- LiveView streams update bars as team members collaborate.

## Quick usage

```heex
<Pyraui.Components.Gantt.gantt
  id="roadmap"
  tasks={@tasks}
  start_date={~D[2025-01-01]}
  end_date={~D[2025-03-31]}
/>
```

## Tips

- Group tasks by category or team to improve scanability.
- Use color tokens to signify status—e.g., green for on track, amber for at risk.
- Pair with `<.kanban>` to offer both macro and micro planning perspectives.

