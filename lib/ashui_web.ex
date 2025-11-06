defmodule AshuiWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use AshuiWeb, :controller
      use AshuiWeb, :html

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
      import AshuiWeb.CoreComponents
      # AshUI components
      import Ashui.Components.Button
      import Ashui.Components.Input
      import Ashui.Components.Textarea
      import Ashui.Components.Select
      import Ashui.Components.Checkbox
      import Ashui.Components.Radio
      import Ashui.Components.Label
      import Ashui.Components.Card
      import Ashui.Components.Alert
      import Ashui.Components.Badge
      import Ashui.Components.Tabs
      import Ashui.Components.Accordion
      import Ashui.Components.Navbar
      import Ashui.Components.Breadcrumbs
      import Ashui.Components.Modal
      import Ashui.Components.Table
      import Ashui.Components.Progress
      import Ashui.Components.Grid
      import Ashui.Components.Stats
      import Ashui.Components.Avatar
      import Ashui.Components.DatePicker
      import Ashui.Components.Slider
      import Ashui.Components.Toast
      import Ashui.Components.Stepper
      import Ashui.Components.Chart
      import Ashui.Components.Gauge
      import Ashui.Components.Heatmap
      import Ashui.Components.Map
      import Ashui.Components.FileUpload
      import Ashui.Components.RichTextEditor
      import Ashui.Components.MultiSelect
      import Ashui.Components.Rating
      import Ashui.Components.Carousel
      import Ashui.Components.Wizard
      import Ashui.Components.ResizablePanels
      import Ashui.Components.FilterPanel
      import Ashui.Components.Skeleton
      import Ashui.Components.Autocomplete
      import Ashui.Components.SortableList
      import Ashui.Components.LiveChat
      import Ashui.Components.LiveFeed
      import Ashui.Components.Countdown
      import Ashui.Components.UserProfileCard
      import Ashui.Components.AvatarGroup
      import Ashui.Components.ConnectionsWidget
      import Ashui.Components.BadgeCard
      import Ashui.Components.ThemeSwitch
      import Ashui.Components.Alert
      import Ashui.Components.Diff
      import Ashui.Components.Kbd
      import Ashui.Components.Hero
      import Ashui.Components.Swap
      import Ashui.Components.Dock
      import Ashui.Components.Drawer
      import Ashui.Components.Mockup
      import Ashui.Components.Timeline
      import Ashui.Components.Lightbox
      import Ashui.Components.VideoPlayer
      import Ashui.Components.AnimatedChart
      import Ashui.Components.SkeletonLayout
      import Ashui.Components.MasonryGrid
      import Ashui.Components.Gantt
      import Ashui.Components.LiveDataTable

      # Common modules used in templates
      alias Phoenix.LiveView.JS
      alias AshuiWeb.Layouts

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: AshuiWeb.Endpoint,
        router: AshuiWeb.Router,
        statics: AshuiWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/live_view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
