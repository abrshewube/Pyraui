defmodule Ashui.Components.Slider do
  @moduledoc """
  Slider component for selecting a value within a range.

  ## Examples

      <.slider label="Volume" value={50} min={0} max={100} />
      <.slider label="Price Range" value={75} step={5} />
  """

  use Phoenix.Component

  attr :field, Phoenix.HTML.FormField, doc: "a form field struct retrieved from the form"
  attr :label, :string, default: nil
  attr :value, :integer, default: 50
  attr :min, :integer, default: 0
  attr :max, :integer, default: 100
  attr :step, :integer, default: 1
  attr :error, :string, default: nil
  attr :helper, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :show_value, :boolean, default: true, doc: "Show current value next to slider"
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(autocomplete name id)

  def slider(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "slider-#{System.unique_integer([:positive])}"
        end
      end)
      |> assign_new(:name, fn ->
        if has_field do
          field.name
        else
          Map.get(assigns, :name) || Map.get(assigns.rest || %{}, :name)
        end
      end)
      |> assign_new(:value, fn ->
        if has_field do
          field.value || assigns.value
        else
          assigns.value
        end
      end)
      |> assign_new(:error, fn ->
        if has_field do
          translate_error(field)
        else
          assigns.error
        end
      end)
      |> assign(:percentage, calculate_percentage(assigns.value, assigns.min, assigns.max))

    ~H"""
    <div class={["mb-4", @class]} {@rest}>
      <div class="flex items-center justify-between mb-2">
        <%= if @label do %>
          <label for={@id} class="block text-sm font-medium text-gray-700">{@label}</label>
        <% end %>

        <%= if @show_value do %>
          <span class="text-sm font-medium text-gray-700">{@value}</span>
        <% end %>
      </div>

      <div class="relative">
        <input
          type="range"
          id={@id}
          name={if @name, do: @name}
          value={@value}
          min={@min}
          max={@max}
          step={@step}
          disabled={@disabled}
          class={[
            "w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer",
            "disabled:opacity-50 disabled:cursor-not-allowed",
            @error && "border-red-300",
            !@error && "border-gray-300",
            @class
          ]}
          style={"background: linear-gradient(to right, #3b82f6 0%, #3b82f6 #{@percentage}%, #e5e7eb #{@percentage}%, #e5e7eb 100%)"}
        />
      </div>

      <%= if @error do %>
        <p class="mt-1 text-sm text-red-600">{@error}</p>
      <% end %>

      <%= if @helper && !@error do %>
        <p class="mt-1 text-sm text-gray-500">{@helper}</p>
      <% end %>
    </div>
    """
  end

  defp calculate_percentage(value, min, max) do
    if max == min do
      0
    else
      ((value - min) / (max - min) * 100)
      |> Float.round(2)
      |> max(0)
      |> min(100)
    end
  end

  defp translate_error({_field, {msg, opts}}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translate_error(_), do: nil
end
