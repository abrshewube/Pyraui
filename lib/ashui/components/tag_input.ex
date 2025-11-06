defmodule Ashui.Components.TagInput do
  @moduledoc """
  Tag / Chips Input component for adding and removing multiple tags dynamically.

  ## Examples

      <.tag_input id="tags-input" tags={@tags} />
      <.tag_input id="skills-input" tags={@skills} placeholder="Add skills..." />
  """

  use Phoenix.Component

  import AshuiWeb.CoreComponents

  attr :id, :string, required: true, doc: "Unique ID for the tag input"
  attr :tags, :list, default: [], doc: "List of current tags"
  attr :placeholder, :string, default: "Add a tag...", doc: "Input placeholder"
  attr :max_tags, :integer, default: nil, doc: "Maximum number of tags allowed"
  attr :allow_duplicates, :boolean, default: false, doc: "Allow duplicate tags"
  attr :class, :string, default: ""
  attr :rest, :global

  def tag_input(assigns) do
    ~H"""
    <div
      id={@id}
      class={["tag-input-container", @class]}
      phx-hook="TagInputHook"
      data-max-tags={@max_tags}
      data-allow-duplicates={@allow_duplicates}
      {@rest}
    >
      <div class="flex flex-wrap gap-2 p-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 min-h-[2.5rem]">
        <%= for tag <- @tags do %>
          <span class="inline-flex items-center gap-1 px-3 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 rounded-full text-sm font-medium">
            {tag}
            <button
              type="button"
              class="hover:text-blue-600 dark:hover:text-blue-300 transition-colors"
              phx-click="remove-tag"
              phx-value-id={@id}
              phx-value-tag={tag}
              aria-label="Remove tag"
            >
              <.icon name="hero-x-mark" class="w-4 h-4" />
            </button>
          </span>
        <% end %>

        <input
          type="text"
          placeholder={@placeholder}
          class="flex-1 min-w-[120px] border-none outline-none bg-transparent text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500"
          phx-blur="add-tag"
          phx-value-id={@id}
        />
      </div>
    </div>
    """
  end
end
