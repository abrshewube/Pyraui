defmodule Pyraui.Components.Mockup do
  @moduledoc """
  Mockup component for displaying phone, browser, or window mockups.

  ## Examples

      <.mockup type={:phone}>
        <img src="/screenshot.png" />
      </.mockup>
      <.mockup type={:browser} url="example.com">
        Content here
      </.mockup>
  """

  use Phoenix.Component

  attr :type, :atom, required: true, values: [:phone, :browser, :window], doc: "Mockup type"
  attr :url, :string, default: nil, doc: "URL for browser mockup"
  attr :title, :string, default: nil, doc: "Title for window mockup"
  attr :class, :string, default: ""
  attr :rest, :global

  slot :inner_block, required: true

  def mockup(assigns) do
    ~H"""
    <div class={["mockup-container", @class]} {@rest}>
      <%= cond do %>
        <% @type == :phone -> %>
          <div class="mockup-phone border border-gray-300 dark:border-gray-700 rounded-[2.5rem] p-2 bg-gray-100 dark:bg-gray-800 shadow-xl">
            <div class="mockup-phone-screen bg-white dark:bg-gray-900 rounded-[2rem] overflow-hidden">
              {render_slot(@inner_block)}
            </div>
          </div>
        <% @type == :browser -> %>
          <div class="mockup-browser border border-gray-300 dark:border-gray-700 rounded-lg bg-gray-100 dark:bg-gray-800 shadow-xl">
            <div class="mockup-browser-toolbar flex items-center gap-2 px-4 py-3 border-b border-gray-300 dark:border-gray-700">
              <div class="flex gap-1.5">
                <div class="w-3 h-3 rounded-full bg-red-500"></div>

                <div class="w-3 h-3 rounded-full bg-yellow-500"></div>

                <div class="w-3 h-3 rounded-full bg-green-500"></div>
              </div>

              <%= if @url do %>
                <div class="flex-1 bg-white dark:bg-gray-900 rounded px-4 py-1.5 text-sm text-gray-600 dark:text-gray-400 text-center">
                  {@url}
                </div>
              <% end %>
            </div>

            <div class="mockup-browser-content bg-white dark:bg-gray-900">
              {render_slot(@inner_block)}
            </div>
          </div>
        <% @type == :window -> %>
          <div class="mockup-window border border-gray-300 dark:border-gray-700 rounded-lg bg-gray-100 dark:bg-gray-800 shadow-xl">
            <div class="mockup-window-toolbar flex items-center justify-between px-4 py-3 border-b border-gray-300 dark:border-gray-700">
              <%= if @title do %>
                <div class="text-sm font-medium text-gray-700 dark:text-gray-300">{@title}</div>
              <% end %>

              <div class="flex gap-1.5">
                <div class="w-3 h-3 rounded-full bg-red-500"></div>

                <div class="w-3 h-3 rounded-full bg-yellow-500"></div>

                <div class="w-3 h-3 rounded-full bg-green-500"></div>
              </div>
            </div>

            <div class="mockup-window-content bg-white dark:bg-gray-900">
              {render_slot(@inner_block)}
            </div>
          </div>
      <% end %>
    </div>
    """
  end
end
