defmodule Pyraui.Theme do
  @moduledoc """
  Theme management and configuration for PyraUI components.

  Supports light and dark mode with customizable color schemes, fonts, and spacing tokens.
  """

  @default_theme :light

  # Color tokens
  @colors %{
    primary: "oklch(70% 0.213 47.604)",
    secondary: "oklch(55% 0.027 264.364)",
    accent: "oklch(0% 0 0)",
    success: "oklch(70% 0.14 182.503)",
    warning: "oklch(66% 0.179 58.318)",
    error: "oklch(58% 0.253 17.585)",
    info: "oklch(62% 0.214 259.815)"
  }

  # Spacing tokens (in rem)
  @spacing %{
    xs: "0.25rem",
    sm: "0.5rem",
    md: "1rem",
    lg: "1.5rem",
    xl: "2rem",
    "2xl": "3rem",
    "3xl": "4rem"
  }

  # Font tokens
  @fonts %{
    sans: ["ui-sans-serif", "system-ui", "sans-serif"],
    serif: ["ui-serif", "Georgia", "serif"],
    mono: ["ui-monospace", "Courier New", "monospace"]
  }

  def current_theme(assigns) do
    Map.get(assigns, :theme, @default_theme) || @default_theme
  end

  def theme_classes(theme) do
    case theme do
      :dark -> "dark"
      :light -> ""
      _ -> ""
    end
  end

  def color_scheme(theme) do
    case theme do
      :dark -> "dark"
      :light -> "light"
      _ -> "light"
    end
  end

  @doc """
  Get color token value.
  """
  def color(name), do: Map.get(@colors, name)

  @doc """
  Get spacing token value.
  """
  def spacing(name), do: Map.get(@spacing, name)

  @doc """
  Get font family token value.
  """
  def font(name), do: Map.get(@fonts, name)

  @doc """
  Get all available color tokens.
  """
  def colors, do: @colors

  @doc """
  Get all available spacing tokens.
  """
  def spacing_tokens, do: @spacing

  @doc """
  Get all available font tokens.
  """
  def fonts, do: @fonts
end
