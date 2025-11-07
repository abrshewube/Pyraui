defmodule PyrauiWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use PyrauiWeb, :controller
      use PyrauiWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, formats: [:html, :json]

      import Plug.Conn

      unquote(verified_routes())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # HTML escaping functionality
      import Phoenix.HTML
      # Core UI components
      import PyrauiWeb.CoreComponents
      # PyraUI components
      import Pyraui.Components.Button
      import Pyraui.Components.Input
      import Pyraui.Components.Textarea
      import Pyraui.Components.Select
      import Pyraui.Components.Checkbox
      import Pyraui.Components.Radio
      import Pyraui.Components.Label
      import Pyraui.Components.Card
      import Pyraui.Components.Alert
      import Pyraui.Components.Badge
      import Pyraui.Components.Tabs
      import Pyraui.Components.Accordion
      import Pyraui.Components.Navbar
      import Pyraui.Components.Breadcrumbs
      import Pyraui.Components.Modal
      import Pyraui.Components.Table
      import Pyraui.Components.Progress
      import Pyraui.Components.Grid
      import Pyraui.Components.Stats
      import Pyraui.Components.Avatar
      import Pyraui.Components.DatePicker
      import Pyraui.Components.Slider
      import Pyraui.Components.Toast
      import Pyraui.Components.Stepper
      import Pyraui.Components.Chart
      import Pyraui.Components.Gauge
      import Pyraui.Components.Heatmap
      import Pyraui.Components.Map
      import Pyraui.Components.FileUpload
      import Pyraui.Components.RichTextEditor
      import Pyraui.Components.MultiSelect
      import Pyraui.Components.Rating
      import Pyraui.Components.Carousel
      import Pyraui.Components.Wizard
      import Pyraui.Components.ResizablePanels
      import Pyraui.Components.FilterPanel
      import Pyraui.Components.Skeleton
      import Pyraui.Components.Autocomplete
      import Pyraui.Components.SortableList
      import Pyraui.Components.LiveChat
      import Pyraui.Components.LiveFeed
      import Pyraui.Components.Countdown
      import Pyraui.Components.UserProfileCard
      import Pyraui.Components.AvatarGroup
      import Pyraui.Components.ConnectionsWidget
      import Pyraui.Components.BadgeCard
      import Pyraui.Components.ThemeSwitch
      import Pyraui.Components.Alert
      import Pyraui.Components.Diff
      import Pyraui.Components.Kbd
      import Pyraui.Components.Hero
      import Pyraui.Components.Swap
      import Pyraui.Components.Dock
      import Pyraui.Components.Drawer
      import Pyraui.Components.Mockup
      import Pyraui.Components.Timeline
      import Pyraui.Components.Lightbox
      import Pyraui.Components.VideoPlayer
      import Pyraui.Components.AnimatedChart
      import Pyraui.Components.SkeletonLayout
      import Pyraui.Components.MasonryGrid
      import Pyraui.Components.Gantt
      import Pyraui.Components.LiveDataTable

      # Common modules used in templates
      alias Phoenix.LiveView.JS
      alias PyrauiWeb.Layouts

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: PyrauiWeb.Endpoint,
        router: PyrauiWeb.Router,
        statics: PyrauiWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/live_view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
