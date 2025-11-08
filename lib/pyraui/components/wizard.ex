defmodule Pyraui.Components.Wizard do
  @moduledoc """
  Wizard component for multi-step forms or flows with navigation and validation.

  ## Examples

      <.wizard id="signup-wizard">
        <:step id="step1" title="Personal Info" active={true}>
          <p>Step 1 content</p>
        </:step>
        <:step id="step2" title="Account Details">
          <p>Step 2 content</p>
        </:step>
      </.wizard>
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the wizard"

  attr :tone, :atom,
    default: :blue,
    values: [:blue, :indigo, :violet, :emerald, :teal, :rose, :orange, :slate],
    doc: "Color tone used for active/completed/progress and primary button"

  attr :compact, :boolean, default: false, doc: "Use compact spacing"
  attr :show_progress, :boolean, default: true, doc: "Show the top progress indicator"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :step, required: true do
    attr :id, :string, required: true
    attr :title, :string, required: true
    attr :active, :boolean
    attr :completed, :boolean
    attr :disabled, :boolean
  end

  def wizard(assigns) do
    active_index = find_active_index(assigns.step)
    total_steps = length(assigns.step)

    tone_classes = %{
      blue: %{bg: "bg-blue-600", text: "text-blue-600", hover: "hover:bg-blue-700"},
      indigo: %{bg: "bg-indigo-600", text: "text-indigo-600", hover: "hover:bg-indigo-700"},
      violet: %{bg: "bg-violet-600", text: "text-violet-600", hover: "hover:bg-violet-700"},
      emerald: %{bg: "bg-emerald-600", text: "text-emerald-600", hover: "hover:bg-emerald-700"},
      teal: %{bg: "bg-teal-600", text: "text-teal-600", hover: "hover:bg-teal-700"},
      rose: %{bg: "bg-rose-600", text: "text-rose-600", hover: "hover:bg-rose-700"},
      orange: %{bg: "bg-orange-600", text: "text-orange-600", hover: "hover:bg-orange-700"},
      slate: %{bg: "bg-slate-700", text: "text-slate-700", hover: "hover:bg-slate-800"}
    }

    tone = Map.get(tone_classes, assigns.tone, tone_classes.blue)

    assigns =
      assigns
      |> assign(:active_index, active_index)
      |> assign(:total_steps, total_steps)
      |> assign(:tone, tone)

    ~H"""
    <div id={@id} class={["wizard-container", @class]} {@rest}>
      <!-- Progress Bar -->
      <%= if @show_progress do %>
        <div class={[@compact && "mb-4", !@compact && "mb-8"]}>
          <div class="flex items-center justify-between mb-2">
            <%= for {step, index} <- Enum.with_index(@step) do %>
              <div class="flex flex-col items-center flex-1">
                <div class={[
                  "w-10 h-10 rounded-full flex items-center justify-center text-sm font-semibold transition-colors",
                  (Map.get(step, :active, false) || Map.get(step, :completed, false)) && "text-white",
                  if(Map.get(step, :active, false) || Map.get(step, :completed, false),
                    do: @tone.bg,
                    else: "bg-gray-200 text-gray-600"
                  )
                ]}>
                  <%= if Map.get(step, :completed, false) do %>
                    <.icon name="hero-check" class="w-6 h-6" />
                  <% else %>
                    {index + 1}
                  <% end %>
                </div>

                <span class={[
                  "mt-2 text-sm font-medium",
                  (Map.get(step, :active, false) && @tone.text) || "text-gray-500"
                ]}>
                  {step.title}
                </span>
              </div>

              <%= if index < @total_steps - 1 do %>
                <div class={[
                  "flex-1 h-0.5 mx-2",
                  (Map.get(step, :completed, false) && @tone.bg) || "bg-gray-200"
                ]}>
                </div>
              <% end %>
            <% end %>
          </div>
        </div>
      <% end %>
      <!-- Step Content -->
      <div class="wizard-content">
        <%= for step <- @step do %>
          <div
            id={"#{@id}-#{step.id}"}
            class={[
              "wizard-step",
              if(Map.get(step, :active, false), do: "", else: "hidden")
            ]}
          >
            {render_slot(step)}
          </div>
        <% end %>
      </div>
      <!-- Navigation -->
      <div class={"flex justify-between " <> if(@compact, do: "mt-4", else: "mt-8") }>
        <button
          type="button"
          class={[
            "px-4 py-2 rounded-lg font-medium transition-colors",
            if(@active_index > 0,
              do: "bg-gray-200 hover:bg-gray-300 text-gray-800",
              else: "bg-gray-100 text-gray-400 cursor-not-allowed"
            )
          ]}
          phx-click="wizard-prev"
          phx-value-id={@id}
          disabled={@active_index == 0}
        >
          Previous
        </button>
        <button
          type="button"
          class={[
            "px-4 py-2 text-white rounded-lg font-medium transition-colors",
            @tone.bg,
            @tone.hover
          ]}
          phx-click="wizard-next"
          phx-value-id={@id}
        >
          <%= if @active_index == @total_steps - 1 do %>
            Finish
          <% else %>
            Next
          <% end %>
        </button>
      </div>
    </div>
    """
  end

  defp find_active_index(steps) do
    Enum.find_index(steps, fn step -> Map.get(step, :active, false) end) || 0
  end
end
