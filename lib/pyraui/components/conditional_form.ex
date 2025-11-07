defmodule Pyraui.Components.ConditionalForm do
  @moduledoc """
  Conditional / Dynamic Form component where fields appear/disappear based on user input.

  ## Examples

      <.conditional_form id="dynamic-form">
        <:field name="user_type" type="select" options={["individual", "business"]} />
        <:conditional_field show_if={%{"user_type" => "business"}}>
          <div class="mb-4">
            <label for="company_name-input">Company Name</label>
            <input type="text" id="company_name-input" name="company_name" />
          </div>
        </:conditional_field>
      </.conditional_form>
  """

  use Phoenix.Component

  attr :id, :string, required: true, doc: "Unique ID for the conditional form"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :field,
    doc: "Form fields" do
    attr :name, :string, required: true
    attr :type, :string
    attr :label, :string
    attr :options, :list
  end

  slot :conditional_field,
    doc: "Conditionally displayed fields" do
    attr :show_if, :map
  end

  def conditional_form(assigns) do
    ~H"""
    <div
      id={@id}
      class={["conditional-form", @class]}
      phx-hook="ConditionalFormHook"
      {@rest}
    >
      <%= for field <- @field do %>
        {render_field(assigns, field)}
      <% end %>

      <%= for conditional <- @conditional_field do %>
        <% show_conditions = Map.get(conditional, :show_if, %{}) %>
        <div
          class="conditional-field-group"
          data-show-if={Jason.encode!(show_conditions)}
          style="display: none;"
        >
          {render_slot(conditional)}
        </div>
      <% end %>
    </div>
    """
  end

  defp render_field(assigns, field) do
    field_type = Map.get(field, :type, "text")
    field_name = field |> Map.get(:name, "") |> to_string()

    field_label =
      Map.get(field, :label, field_name |> String.replace("_", " ") |> String.capitalize())

    field_options = Map.get(field, :options, [])

    assigns =
      assigns
      |> assign(:field_name, field_name)
      |> assign(:field_label, field_label)
      |> assign(:field_options, field_options)
      |> assign(:field_type_attr, field_type)

    case field_type do
      "select" ->
        ~H"""
        <div class="mb-4">
          <label
            for={"#{@field_name}-input"}
            class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
          >
            {@field_label}
          </label>
          <select
            id={"#{@field_name}-input"}
            name={@field_name}
            class="block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100"
            phx-change="conditional-form-change"
            phx-value-field={@field_name}
          >
            <option value="">Select...</option>

            <%= for option <- @field_options do %>
              <option value={option}>{option}</option>
            <% end %>
          </select>
        </div>
        """

      "checkbox" ->
        ~H"""
        <div class="mb-4">
          <label class="flex items-center gap-2">
            <input
              type="checkbox"
              id={"#{@field_name}-input"}
              name={@field_name}
              class="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
              phx-change="conditional-form-change"
              phx-value-field={@field_name}
            /> <span class="text-sm font-medium text-gray-700 dark:text-gray-300">{@field_label}</span>
          </label>
        </div>
        """

      _ ->
        ~H"""
        <div class="mb-4">
          <label
            for={"#{@field_name}-input"}
            class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
          >
            {@field_label}
          </label>
          <input
            type={@field_type_attr}
            id={"#{@field_name}-input"}
            name={@field_name}
            class="block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100"
            phx-change="conditional-form-change"
            phx-value-field={@field_name}
          />
        </div>
        """
    end
  end
end
