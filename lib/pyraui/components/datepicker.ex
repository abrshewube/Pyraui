defmodule Pyraui.Components.DatePicker do
  @moduledoc """
  DatePicker component for selecting dates and times.

  ## Examples

      <.datepicker label="Birth Date" field={@form[:birth_date]} />
      <.datepicker label="Appointment" type="datetime-local" field={@form[:appointment]} />
      <.datepicker label="Start Date" value="2024-01-15" />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents, only: [icon: 1]

  attr :type, :atom,
    default: :date,
    values: [:date, :datetime_local, :time, :month, :week],
    doc: "Input type"

  attr :field, Phoenix.HTML.FormField, doc: "a form field struct retrieved from the form"
  attr :label, :string, default: nil
  attr :helper, :string, default: nil
  attr :error, :string, default: nil
  attr :value, :string, default: nil
  attr :min, :string, default: nil, doc: "Minimum date/time value"
  attr :max, :string, default: nil, doc: "Maximum date/time value"
  attr :disabled, :boolean, default: false
  attr :required, :boolean, default: false
  attr :variant, :atom, default: :soft, values: [:soft, :outline]
  attr :size, :atom, default: :md, values: [:sm, :md, :lg]
  attr :icon, :boolean, default: true
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(autocomplete name id)

  def datepicker(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    input_type =
      case assigns.type do
        :date -> "date"
        :datetime_local -> "datetime-local"
        :time -> "time"
        :month -> "month"
        :week -> "week"
        _ -> "date"
      end

    size_tokens = %{
      sm: %{pad: "ps-9 pe-3 py-2", text: "text-sm", icon: "w-4 h-4 left-3"},
      md: %{pad: "ps-10 pe-3 py-2.5", text: "text-sm", icon: "w-5 h-5 left-3.5"},
      lg: %{pad: "ps-11 pe-3 py-3", text: "text-base", icon: "w-5 h-5 left-3.5"}
    }

    variant_classes = %{
      soft:
        "bg-white border-slate-200 focus:ring-sky-400/50 focus:border-sky-400 placeholder-slate-400",
      outline:
        "bg-transparent border-slate-300 focus:ring-sky-500/60 focus:border-sky-500 placeholder-slate-400"
    }

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "datepicker-#{System.unique_integer([:positive])}"
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
      |> assign(:input_type, input_type)
      |> assign(:size_data, size_tokens[assigns.size])
      |> assign(:variant_class, variant_classes[assigns.variant])

    ~H"""
    <div class="mb-4">
      <%= if @label do %>
        <label for={@id} class="mb-1 block text-sm font-medium text-slate-700">
          {@label}
          <%= if @required do %>
            <span class="text-rose-500">*</span>
          <% end %>
        </label>
      <% end %>

      <div class="relative">
        <%= if @icon do %>
          <% icon_class =
            [
              "pointer-events-none absolute top-1/2 -translate-y-1/2 text-slate-400",
              @size_data.icon
            ]
            |> Enum.reject(&(&1 in [nil, ""]))
            |> Enum.join(" ") %>

          <.icon
            name="hero-calendar-days"
            class={icon_class}
          />
        <% end %>
        <input
          type={@input_type}
          id={@id}
          name={if @name, do: @name}
          value={@value}
          min={@min}
          max={@max}
          disabled={@disabled}
          required={@required}
          class={[
            "block w-full rounded-xl border shadow-sm outline-none transition",
            @size_data.pad,
            @size_data.text,
            @error &&
              "border-rose-300 text-rose-900 placeholder-rose-300 focus:border-rose-500 focus:ring-2 focus:ring-rose-500/40",
            !@error && @variant_class,
            "focus:ring-2",
            "disabled:bg-slate-100 disabled:cursor-not-allowed",
            @class
          ]}
          {@rest}
        />
      </div>

      <%= if @error do %>
        <p class="mt-1 text-sm text-rose-600">{@error}</p>
      <% end %>

      <%= if @helper && !@error do %>
        <p class="mt-1 text-sm text-slate-500">{@helper}</p>
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
