defmodule Ashui.Components.MultiSelect do
  @moduledoc """
  Multi-select component with chips/tags display for selecting multiple items.

  ## Examples

      <.multi_select field={@form[:tags]} options={["Option 1", "Option 2", "Option 3"]} />
      <.multi_select field={@form[:categories]} options={categories} label="Categories" />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents
  alias Phoenix.LiveView.JS

  attr :field, Phoenix.HTML.FormField,
    required: true,
    doc: "a form field struct retrieved from the form"

  attr :options, :list, required: true, doc: "List of options (strings or {label, value} tuples)"
  attr :label, :string, default: nil
  attr :placeholder, :string, default: "Select options..."
  attr :error, :string, default: nil
  attr :helper, :string, default: nil
  attr :required, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(name id)

  def multi_select(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    normalized_options = normalize_options(assigns.options)
    selected_values = get_selected_values(field)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "multiselect-#{System.unique_integer([:positive])}"
        end
      end)
      |> assign_new(:name, fn ->
        if has_field do
          field.name
        else
          Map.get(assigns, :name) || Map.get(assigns.rest || %{}, :name)
        end
      end)
      |> assign_new(:error, fn ->
        if has_field do
          translate_field_error(field)
        else
          assigns.error
        end
      end)
      |> assign(:normalized_options, normalized_options)
      |> assign(:selected_values, selected_values)
      |> assign(:is_open, false)

    ~H"""
    <div class={["multi-select-container mb-4", @class]} {@rest}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-medium text-gray-700 mb-2">
          {@label}
          <%= if @required do %>
            <span class="text-red-500">*</span>
          <% end %>
        </label>
      <% end %>

      <div class="relative" phx-hook="MultiSelectHook" id={@id} data-id={@id}>
        <!-- Selected chips -->
        <div
          class={[
            "min-h-[42px] p-2 border border-gray-300 rounded-lg bg-white flex flex-wrap gap-2 items-center cursor-pointer",
            "focus-within:ring-2 focus-within:ring-blue-500 focus-within:border-blue-500",
            @error && "border-red-300",
            @disabled && "bg-gray-100 cursor-not-allowed"
          ]}
          phx-click={if !@disabled, do: JS.toggle(to: "##{@id}-dropdown")}
        >
          <%= if @selected_values == [] do %>
            <span class="text-gray-400 text-sm">{@placeholder}</span>
          <% else %>
            <%= for value <- @selected_values do %>
              <% option = Enum.find(@normalized_options, fn {_, v} -> v == value end) %> <% {label, _} =
                option || {value, value} %>
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                {label}
                <%= if !@disabled do %>
                  <button
                    type="button"
                    phx-click="remove-selection"
                    phx-value-id={@id}
                    phx-value-value={value}
                    class="ml-2 inline-flex items-center justify-center w-4 h-4 rounded-full hover:bg-blue-200"
                    aria-label="Remove"
                  >
                    <.icon name="hero-x-mark" class="w-3 h-3" />
                  </button>
                <% end %>
              </span>
            <% end %>
          <% end %>

          <div class="ml-auto"><.icon name="hero-chevron-down" class="w-5 h-5 text-gray-400" /></div>
        </div>
        <!-- Dropdown -->
        <div
          id={"#{@id}-dropdown"}
          class="hidden absolute z-10 w-full mt-1 bg-white border border-gray-300 rounded-lg shadow-lg max-h-60 overflow-auto"
        >
          <%= for {label, value} <- @normalized_options do %>
            <% is_selected = value in @selected_values %>
            <button
              type="button"
              phx-click="toggle-selection"
              phx-value-id={@id}
              phx-value-value={value}
              class={[
                "w-full text-left px-4 py-2 hover:bg-gray-100 flex items-center justify-between",
                is_selected && "bg-blue-50"
              ]}
            >
              <span>{label}</span>
              <%= if is_selected do %>
                <.icon name="hero-check" class="w-5 h-5 text-blue-600" />
              <% end %>
            </button>
          <% end %>
        </div>
        <!-- Hidden inputs for form submission -->
        <%= for value <- @selected_values do %>
          <input type="hidden" name={"#{@name}[]"} value={value} />
        <% end %>
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

  defp normalize_options(options) when is_list(options) do
    Enum.map(options, fn
      {label, value} -> {label, to_string(value)}
      value when is_binary(value) -> {value, value}
      value -> {to_string(value), to_string(value)}
    end)
  end

  defp get_selected_values(nil), do: []

  defp get_selected_values(field) do
    values =
      case field.value do
        nil -> []
        value when is_list(value) -> value
        value -> [value]
      end

    Enum.map(values, &to_string/1)
  end

  defp translate_field_error({_field, {msg, opts}}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translate_field_error(_), do: nil
end
