defmodule Pyraui.Components.Accordion do
  @moduledoc """
  Accordion component for collapsible content sections.

  ## Examples

      <.accordion>
        <.accordion_item id="item-1" title="Section 1" open={true}>
          Content for section 1
        </.accordion_item>
        <.accordion_item id="item-2" title="Section 2">
          Content for section 2
        </.accordion_item>
      </.accordion>
  """

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :rest, :global

  slot :item,
    required: true,
    doc: "Accordion sections" do
    attr :id, :string, required: true
    attr :title, :string, required: true
    attr :open, :boolean
  end

  def accordion(assigns) do
    ~H"""
    <div class={["space-y-3", @class]} {@rest}>
      <details
        :for={item <- @item}
        id={item.id}
        class="group rounded-2xl border border-slate-200 bg-white shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:shadow-lg"
        open={Map.get(item, :open, false)}
      >
        <summary
          class="flex cursor-pointer list-none items-center justify-between gap-4 px-5 py-4 text-left marker:content-none"
        >
          <span class="text-sm font-semibold text-slate-900">{item.title}</span>
          <svg
            class="h-5 w-5 text-slate-400 transition-transform duration-200 group-open:rotate-180"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M19 9l-7 7-7-7"
            />
          </svg>
        </summary>
        <div class="px-5 pb-5 text-sm leading-relaxed text-slate-600">
          {render_slot(item)}
        </div>
      </details>
    </div>
    """
  end
end
