defmodule Pyraui.Components.Checkbox do
  @moduledoc """
  Checkbox component with label and validation.

  ## Examples

      <.checkbox label="Accept terms" field={@form[:terms]} />
      <.checkbox label="Subscribe to newsletter" checked={true} />
  """

  use Phoenix.Component

  attr :field, Phoenix.HTML.FormField, doc: "a form field struct retrieved from the form"
  attr :label, :string, default: nil
  attr :value, :string, default: "true"
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(name id)

  def checkbox(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "checkbox-#{System.unique_integer([:positive])}"
        end
      end)
      |> assign_new(:name, fn ->
        if has_field do
          field.name
        else
          Map.get(assigns, :name)
        end
      end)
      |> assign_new(:checked, fn ->
        if has_field do
          field.value
        else
          assigns.checked
        end
      end)

    ~H"""
    <div class="mb-4 flex items-start">
      <div class="flex items-center h-5">
        <input
          type="checkbox"
          id={@id}
          name={@name}
          value={@value}
          checked={@checked}
          disabled={@disabled}
          required={@required}
          class={[
            "h-4 w-4 rounded border-gray-300 text-blue-600",
            "focus:ring-2 focus:ring-blue-500",
            "disabled:opacity-50 disabled:cursor-not-allowed",
            @class
          ]}
          {@rest}
        />
      </div>

      <%= if @label do %>
        <label for={@id} class="ml-2 block text-sm text-gray-700">
          {@label}
          <%= if @required do %>
            <span class="text-red-500">*</span>
          <% end %>
        </label>
      <% end %>
    </div>
    """
  end
end
