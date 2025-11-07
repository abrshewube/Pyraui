defmodule Pyraui.Components.Input do
  @moduledoc """
  Input field component with validation states and helper text.

  ## Examples

      <.input type="text" label="Name" field={@form[:name]} />
      <.input type="email" label="Email" field={@form[:email]} error="Invalid email" />
      <.input type="password" label="Password" helper="Must be at least 8 characters" />
  """

  use Phoenix.Component

  attr :type, :string, default: "text"
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct retrieved from the form"
  attr :label, :string, default: nil
  attr :helper, :string, default: nil
  attr :error, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :value, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(autocomplete name id maxlength minlength pattern readonly size)

  def input(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "input-#{System.unique_integer([:positive])}"
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
          field.value
        else
          assigns.value || ""
        end
      end)
      |> assign_new(:error, fn ->
        if has_field do
          translate_error(field)
        else
          assigns.error
        end
      end)

    ~H"""
    <div class="mb-4">
      <%= if @label do %>
        <label for={@id} class="block text-sm font-medium text-gray-700 mb-1">
          {@label}
          <%= if @required do %>
            <span class="text-red-500">*</span>
          <% end %>
        </label>
      <% end %>

      <input
        type={@type}
        id={@id}
        name={if @name, do: @name}
        value={@value}
        placeholder={@placeholder}
        disabled={@disabled}
        required={@required}
        class={[
          "block w-full rounded-lg border px-3 py-2 shadow-sm",
          "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500",
          "disabled:bg-gray-100 disabled:cursor-not-allowed",
          @error &&
            "border-red-300 text-red-900 placeholder-red-300 focus:border-red-500 focus:ring-red-500",
          !@error && "border-gray-300 text-gray-900 placeholder-gray-400 focus:border-blue-500",
          @class
        ]}
        {@rest}
      />
      <%= if @error do %>
        <p class="mt-1 text-sm text-red-600">{@error}</p>
      <% end %>

      <%= if @helper && !@error do %>
        <p class="mt-1 text-sm text-gray-500">{@helper}</p>
      <% end %>
    </div>
    """
  end

  defp translate_error({_field, {msg, opts}}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translate_error(_), do: nil
end
