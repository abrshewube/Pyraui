# PyraUI – Phoenix LiveView UI Library

A modular, reusable UI library for Phoenix LiveView applications, enabling developers to rapidly build interactive, responsive, and consistent interfaces.

## Features

- ✅ **LiveView-first**: Components work natively in `.heex` templates
- ✅ **Composable & Modular**: Each component is independent and reusable
- ✅ **Minimal JavaScript**: Reactive behavior handled by Phoenix assigns
- ✅ **Theme-ready**: Light/dark mode support (coming soon)
- ✅ **Developer-friendly**: Semantic naming, minimal boilerplate

## Installation

Add to your `mix.exs`:

```elixir
def deps do
  [
    {:pyraui, path: "../pyraui"}  # or {:pyraui, git: "..."}
  ]
end
```

Then import in your `PyrauiWeb` module or use `use PyrauiWeb, :html` in your templates.

## Components

### Base Elements

- **Button**: Primary, secondary, ghost, danger, success variants with loading states
- **Input**: Text inputs with validation and helper text
- **Textarea**: Multi-line text inputs
- **Select**: Dropdown selects
- **Checkbox**: Checkbox inputs with labels
- **Radio**: Radio button inputs
- **Label**: Form labels

### Layout Components

- **Card**: Content containers with padding and shadows

### Feedback Components

- **Alert**: Info, success, warning, error notifications

## Usage Examples

### Button

```heex
<.button>Click me</.button>
<.button variant="primary" size="lg">Large Button</.button>
<.button disabled={true}>Disabled</.button>
<.button loading={true}>Loading...</.button>
```

### Input

```heex
<.input type="text" label="Name" field={@form[:name]} />
<.input type="email" label="Email" field={@form[:email]} error="Invalid email" />
```

### Alert

```heex
<.alert variant="success">Operation successful!</.alert>
<.alert variant="error">Something went wrong</.alert>
<.alert variant="info" dismissible={true}>Information message</.alert>
```

### Card

```heex
<.card>
  <h2>Card Title</h2>
  <p>Card content</p>
</.card>
```

## Development

This project also serves as a playground/demo application:

1. Clone the repository
2. Install dependencies: `mix deps.get`
3. Start the server: `mix phx.server`
4. Visit http://localhost:4000 to see the component playground

## Roadmap

- [ ] More layout components (Grid, Stack, Spacer)
- [ ] Modal/Dialog component
- [ ] Tooltip component
- [ ] Progress bars and spinners
- [ ] Navigation components (Tabs, Accordion, Dropdown)
- [ ] Data display components (Table, List, Badge, Avatar)
- [ ] Dark mode theme support
- [ ] JavaScript hooks for advanced interactions

## License

MIT
