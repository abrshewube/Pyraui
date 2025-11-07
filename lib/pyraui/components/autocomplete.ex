defmodule Pyraui.Components.Autocomplete do
  @moduledoc """
  Autocomplete component with live search and suggestion list while typing.

  ## Examples

      <.autocomplete id="search-users" field={@form[:user]} options={users} />
      <.autocomplete id="search-products" field={@form[:product]} options={products} min_chars={2} />
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the autocomplete"
  attr :field, Phoenix.HTML.FormField, doc: "Form field struct"
  attr :options, :list, required: true, doc: "List of options (strings or {label, value} tuples)"
  attr :label, :string, default: nil
  attr :placeholder, :string, default: "Start typing..."
  attr :min_chars, :integer, default: 1, doc: "Minimum characters before showing suggestions"
  attr :max_results, :integer, default: 10, doc: "Maximum number of suggestions to show"
  attr :error, :string, default: nil
  attr :helper, :string, default: nil
  attr :required, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global

  def autocomplete(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)
    normalized_options = normalize_options(assigns.options)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "autocomplete-#{System.unique_integer([:positive])}"
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
          field.value || ""
        else
          Map.get(assigns, :value) || ""
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
      |> assign(:is_open, false)
      |> assign(:filtered_options, [])

    ~H"""
    <div class={["autocomplete-container mb-4", @class]} {@rest}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-medium text-gray-700 mb-2">
          {@label}
          <%= if @required do %>
            <span class="text-red-500">*</span>
          <% end %>
        </label>
      <% end %>

      <div
        class="relative"
        phx-hook="AutocompleteHook"
        id={@id}
        data-id={@id}
        data-min-chars={@min_chars}
        data-max-results={@max_results}
        data-options={Jason.encode!(@normalized_options)}
      >
        <input
          type="text"
          id={@id}
          name={@name}
          value={@value}
          placeholder={@placeholder}
          class={[
            "w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500",
            @error && "border-red-300 focus:ring-red-500 focus:border-red-500",
            @disabled && "bg-gray-100 cursor-not-allowed"
          ]}
          phx-change="autocomplete-search"
          phx-value-id={@id}
          phx-debounce="300"
          disabled={@disabled}
          autocomplete="off"
        /> <input type="hidden" name={"#{@name}_value"} id={"#{@id}-hidden"} value={@value} />
        <!-- Suggestions dropdown -->
        <div
          id={"#{@id}-dropdown"}
          class="hidden absolute z-10 w-full mt-1 bg-white border border-gray-300 rounded-lg shadow-lg max-h-60 overflow-auto"
        >
          <div id={"#{@id}-suggestions"} class="py-1">
            <!-- Suggestions will be populated by JavaScript -->
          </div>
        </div>
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
      {label, value} -> %{label: label, value: to_string(value)}
      value when is_binary(value) -> %{label: value, value: value}
      value -> %{label: to_string(value), value: to_string(value)}
    end)
  end

  defp translate_field_error({_field, {msg, opts}}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translate_field_error(_), do: nil
end
