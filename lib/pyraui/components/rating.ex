defmodule Pyraui.Components.Rating do
  @moduledoc """
  Rating / Star input component for reviews and feedback.

  ## Examples

      <.rating field={@form[:rating]} />
      <.rating field={@form[:score]} max={5} size={:lg} />
      <.rating value={4} readonly={true} />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :field, Phoenix.HTML.FormField, doc: "a form field struct retrieved from the form"
  attr :value, :integer, default: 0, doc: "Current rating value"
  attr :max, :integer, default: 5, doc: "Maximum rating (number of stars)"
  attr :size, :atom, default: :md, values: [:sm, :md, :lg], doc: "Star size"
  attr :label, :string, default: nil
  attr :error, :string, default: nil
  attr :helper, :string, default: nil
  attr :readonly, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(name id)

  def rating(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    size_classes = %{
      sm: "w-4 h-4",
      md: "w-6 h-6",
      lg: "w-8 h-8"
    }

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "rating-#{System.unique_integer([:positive])}"
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
          translate_field_error(field)
        else
          assigns.error
        end
      end)
      |> assign(:size_class, size_classes[assigns.size])
      |> assign(:is_readonly, assigns.readonly || assigns.disabled)

    ~H"""
    <div class={["rating-container mb-4", @class]} {@rest}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-medium text-gray-700 mb-2">{@label}</label>
      <% end %>

      <div
        class="flex items-center space-x-1"
        phx-hook="RatingHook"
        id={@id}
        data-id={@id}
        data-readonly={@is_readonly}
      >
        <%= for i <- 1..@max do %>
          <button
            type="button"
            phx-click={if !@is_readonly, do: "set-rating"}
            phx-value-id={@id}
            phx-value-value={i}
            class={[
              "transition-colors",
              @is_readonly && "cursor-default",
              !@is_readonly && "cursor-pointer hover:scale-110",
              @disabled && "opacity-50 cursor-not-allowed"
            ]}
            disabled={@is_readonly}
          >
            <%= if i <= @value do %>
              <.icon name="hero-star" class={"#{@size_class} text-yellow-400 fill-yellow-400"} />
            <% else %>
              <.icon name="hero-star" class={"#{@size_class} text-gray-300"} />
            <% end %>
          </button>
        <% end %>

        <%= if @value > 0 do %>
          <span class="ml-2 text-sm text-gray-600">{@value}/{@max}</span>
        <% end %>
      </div>
      <!-- Hidden input for form submission -->
      <input type="hidden" name={@name} id={@id} value={@value} />
      <%= if @error do %>
        <p class="mt-1 text-sm text-red-600">{@error}</p>
      <% end %>

      <%= if @helper && !@error do %>
        <p class="mt-1 text-sm text-gray-500">{@helper}</p>
      <% end %>
    </div>
    """
  end

  defp translate_field_error({_field, {msg, opts}}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translate_field_error(_), do: nil
end
