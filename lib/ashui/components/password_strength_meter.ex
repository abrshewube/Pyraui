defmodule Ashui.Components.PasswordStrengthMeter do
  @moduledoc """
  Password Strength Meter component with live validation and suggestions.

  ## Examples

      <.password_strength_meter id="password-input" field={@form[:password]} />
      <.password_strength_meter id="signup-password" field={@form[:password]} show_suggestions={true} />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the password input"
  attr :field, Phoenix.HTML.FormField, doc: "Form field"
  attr :label, :string, default: "Password", doc: "Input label"
  attr :value, :string, default: "", doc: "Current password value"
  attr :show_suggestions, :boolean, default: true, doc: "Show password strength suggestions"
  attr :min_length, :integer, default: 8, doc: "Minimum password length"
  attr :class, :string, default: ""
  attr :rest, :global

  def password_strength_meter(assigns) do
    field = Map.get(assigns, :field)
    id = assigns.id

    assigns =
      assigns
      |> assign(:has_field, not is_nil(field))
      |> assign(:input_id, "#{id}-input")
      |> assign(:meter_id, "#{id}-meter")

    ~H"""
    <div
      id={@id}
      class={["password-strength-meter", @class]}
      phx-hook="PasswordStrengthMeterHook"
      data-min-length={@min_length}
      {@rest}
    >
      <%= if @has_field do %>
        <.input
          field={@field}
          type="password"
          id={@input_id}
          label={@label}
          phx-hook="PasswordStrengthMeterHook"
          phx-change="validate-password"
          phx-value-id={@id}
        />
      <% else %>
        <label for={@input_id} class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
          {@label}
        </label>
        <input
          type="password"
          id={@input_id}
          value={@value}
          class="block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100"
          phx-hook="PasswordStrengthMeterHook"
          phx-change="validate-password"
          phx-value-id={@id}
        />
      <% end %>

      <div id={@meter_id} class="mt-2">
        <div class="flex items-center gap-2 mb-1">
          <div class="flex-1 h-2 bg-gray-200 dark:bg-gray-700 rounded-full overflow-hidden">
            <div
              id={"#{@id}-strength-bar"}
              class="h-full transition-all duration-300 rounded-full"
              style="width: 0%; background-color: #ef4444;"
            >
            </div>
          </div>

          <span
            id={"#{@id}-strength-text"}
            class="text-xs font-medium text-gray-600 dark:text-gray-400"
          >
            Weak
          </span>
        </div>

        <%= if @show_suggestions do %>
          <ul
            id={"#{@id}-suggestions"}
            class="text-xs text-gray-600 dark:text-gray-400 space-y-1 mt-2"
          >
            <!-- Suggestions will be populated by JavaScript hook -->
          </ul>
        <% end %>
      </div>
    </div>
    """
  end
end
