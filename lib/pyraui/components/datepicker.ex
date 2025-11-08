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
      sm: %{
        container: "ps-3.5 pe-3 py-2",
        text: "text-sm",
        icon_box: "h-8 w-8 text-xs",
        icon: "h-4 w-4"
      },
      md: %{
        container: "ps-4 pe-4 py-2.5",
        text: "text-base",
        icon_box: "h-9 w-9 text-sm",
        icon: "h-5 w-5"
      },
      lg: %{
        container: "ps-5 pe-5 py-3",
        text: "text-base",
        icon_box: "h-10 w-10 text-base",
        icon: "h-5 w-5"
      }
    }

    variant_tokens = %{
      soft: %{
        surface:
          "border border-slate-200/70 bg-white/95 shadow-sm group-hover:border-slate-300 group-focus-within:border-sky-400 group-focus-within:shadow-[0_24px_60px_-40px_rgba(14,165,233,0.45)]",
        icon: "bg-sky-50 text-sky-500 group-hover:bg-sky-100 group-focus-within:bg-sky-100",
        glow: "from-sky-200/50 via-transparent to-indigo-200/50"
      },
      outline: %{
        surface:
          "border border-slate-300 bg-white/70 shadow-sm group-hover:border-slate-400 group-focus-within:border-sky-500 group-focus-within:shadow-[0_28px_65px_-45px_rgba(59,130,246,0.45)]",
        icon:
          "bg-white text-slate-500 group-hover:text-slate-700 group-focus-within:text-sky-500",
        glow: "from-slate-200/50 via-white/60 to-sky-200/45"
      }
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
      |> assign(:variant_data, variant_tokens[assigns.variant])
      |> assign(:calendar?, input_type in ["date", "datetime-local"])

    ~H"""
    <div class="space-y-2">
      <%= if @label do %>
        <label for={@id} class="block text-sm font-semibold text-slate-600">
          {@label}
          <%= if @required do %>
            <span class="text-rose-500"> *</span>
          <% end %>
        </label>
      <% end %>

      <div
        class={[
          @calendar? && "relative",
          "transition"
        ]}
        data-pyraui-datepicker-room={if @calendar?, do: "true"}
      >
        <div
          class={[
            "group relative transition duration-300",
            @disabled && "cursor-not-allowed opacity-70"
          ]}
          data-pyraui-datepicker-trigger={if @calendar?, do: "true"}
        >
          <div class={[
            "pointer-events-none absolute inset-0 rounded-3xl bg-gradient-to-r opacity-0 transition duration-500 group-hover:opacity-60 group-focus-within:opacity-100",
            @variant_data.glow
          ]}>
          </div>

          <div class={[
            "relative flex w-full items-center gap-3 rounded-3xl backdrop-blur-sm transition duration-300",
            @size_data.container,
            @variant_data.surface,
            @disabled && "border-slate-200 bg-slate-50 shadow-none",
            @error &&
              "border-rose-300 bg-rose-50/80 text-rose-700 shadow-none group-focus-within:border-rose-500 group-focus-within:shadow-[0_28px_65px_-45px_rgba(244,63,94,0.45)]",
            @class
          ]}>
            <%= if @icon do %>
              <span class={[
                "flex flex-shrink-0 items-center justify-center rounded-2xl transition duration-300",
                @size_data.icon_box,
                @variant_data.icon,
                @error && "bg-rose-100 text-rose-500",
                @disabled && "bg-slate-100 text-slate-400"
              ]}>
                <.icon
                  name="hero-calendar-days"
                  class={[
                    "transition duration-300",
                    @size_data.icon,
                    @error && "text-rose-500"
                  ]}
                />
              </span>
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
              data-pyraui-datepicker-input={if @calendar?, do: "true"}
              data-pyraui-input-type={if @calendar?, do: @input_type}
              class={[
                "min-w-0 flex-1 appearance-none bg-transparent placeholder-slate-400 outline-none transition duration-200",
                @size_data.text,
                @disabled && "cursor-not-allowed text-slate-500 placeholder-slate-300",
                @error && "text-rose-600 placeholder-rose-400 caret-rose-500",
                !@error && "caret-sky-500 text-slate-900"
              ]}
              {@rest}
            />
          </div>
        </div>

        <%= if @calendar? do %>
          <div
            data-pyraui-datepicker-overlay
            class="absolute left-0 top-[calc(100%+0.75rem)] z-50 hidden w-full rounded-3xl border border-slate-200/80 bg-white shadow-[0_35px_90px_-45px_rgba(37,99,235,0.35)]"
          >
          </div>
        <% end %>
      </div>

      <%= if @error do %>
        <p class="text-sm font-medium text-rose-600">{@error}</p>
      <% end %>

      <%= if @helper && !@error do %>
        <p class="text-sm text-slate-500">{@helper}</p>
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
