defmodule Pyraui.Components.RichTextEditor do
  @moduledoc """
  Rich text editor / WYSIWYG component for blogs, comments, and content editing.

  Uses a contenteditable div with formatting controls.

  ## Examples

      <.rich_text_editor field={@form[:content]} label="Content" />
      <.rich_text_editor field={@form[:body]} placeholder="Write your post..." />
  """

  use Phoenix.Component

  import PyrauiWeb.CoreComponents

  attr :field, Phoenix.HTML.FormField,
    required: true,
    doc: "a form field struct retrieved from the form"

  attr :label, :string, default: nil
  attr :placeholder, :string, default: "Start typing..."
  attr :value, :string, default: nil
  attr :error, :string, default: nil
  attr :helper, :string, default: nil
  attr :required, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(name id)

  def rich_text_editor(assigns) do
    field = Map.get(assigns, :field)
    has_field = not is_nil(field)

    assigns =
      assigns
      |> assign_new(:id, fn ->
        if has_field do
          field.id
        else
          "richtext-#{System.unique_integer([:positive])}"
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

    ~H"""
    <div class={["rich-text-editor-container mb-4", @class]} {@rest}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-medium text-gray-700 mb-2">
          {@label}
          <%= if @required do %>
            <span class="text-red-500">*</span>
          <% end %>
        </label>
      <% end %>

      <div class="border border-gray-300 rounded-lg overflow-hidden focus-within:ring-2 focus-within:ring-blue-500 focus-within:border-blue-500">
        <!-- Toolbar -->
        <div class="flex flex-wrap items-center gap-1 p-2 bg-gray-50 border-b border-gray-200">
          <!-- Text Formatting -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="bold"
              aria-label="Bold"
              title="Bold (Ctrl+B)"
            >
              <.icon name="hero-bold" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="italic"
              aria-label="Italic"
              title="Italic (Ctrl+I)"
            >
              <.icon name="hero-italic" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="underline"
              aria-label="Underline"
              title="Underline (Ctrl+U)"
            >
              <.icon name="hero-underline" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="strikeThrough"
              aria-label="Strikethrough"
              title="Strikethrough"
            >
              <.icon name="hero-minus" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Headings -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="px-2 py-1 text-xs hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<h1>"
              title="Heading 1"
            >
              H1
            </button>
            <button
              type="button"
              class="px-2 py-1 text-xs hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<h2>"
              title="Heading 2"
            >
              H2
            </button>
            <button
              type="button"
              class="px-2 py-1 text-xs hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<h3>"
              title="Heading 3"
            >
              H3
            </button>
            <button
              type="button"
              class="px-2 py-1 text-xs hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<p>"
              title="Paragraph"
            >
              P
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Lists -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="insertUnorderedList"
              aria-label="Bullet List"
              title="Bullet List"
            >
              <.icon name="hero-list-bullet" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="insertOrderedList"
              aria-label="Numbered List"
              title="Numbered List"
            >
              <.icon name="hero-list-numbered" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Alignment -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="justifyLeft"
              aria-label="Align Left"
              title="Align Left"
            >
              <.icon name="hero-arrow-left" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="justifyCenter"
              aria-label="Align Center"
              title="Align Center"
            >
              <.icon name="hero-minus" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="justifyRight"
              aria-label="Align Right"
              title="Align Right"
            >
              <.icon name="hero-arrow-right" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="justifyFull"
              aria-label="Justify"
              title="Justify"
            >
              <.icon name="hero-bars-3-bottom-left" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Special Formatting -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<blockquote>"
              aria-label="Blockquote"
              title="Blockquote"
            >
              <.icon name="hero-chat-bubble-left-right" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="formatBlock"
              data-value="<pre>"
              aria-label="Code Block"
              title="Code Block"
            >
              <.icon name="hero-code-bracket" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="createLink"
              aria-label="Link"
              title="Insert Link (Ctrl+K)"
            >
              <.icon name="hero-link" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="unlink"
              aria-label="Remove Link"
              title="Remove Link"
            >
              <.icon name="hero-link-slash" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Colors & Media -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="foreColor"
              data-value="#111827"
              aria-label="Text Color"
              title="Text Color"
            >
              <.icon name="hero-swatch" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="backColor"
              data-value="#fde68a"
              aria-label="Highlight"
              title="Highlight"
            >
              <.icon name="hero-swatch" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="insertImage"
              aria-label="Insert Image"
              title="Insert Image"
            >
              <.icon name="hero-photo" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Undo/Redo -->
          <div class="flex items-center space-x-1">
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="undo"
              aria-label="Undo"
              title="Undo (Ctrl+Z)"
            >
              <.icon name="hero-arrow-uturn-left" class="w-4 h-4" />
            </button>
            <button
              type="button"
              class="p-2 hover:bg-gray-200 rounded transition-colors"
              data-command="redo"
              aria-label="Redo"
              title="Redo (Ctrl+Y)"
            >
              <.icon name="hero-arrow-uturn-right" class="w-4 h-4" />
            </button>
          </div>

          <div class="w-px h-6 bg-gray-300"></div>
          <!-- Clear Formatting -->
          <button
            type="button"
            class="p-2 hover:bg-gray-200 rounded transition-colors"
            data-command="removeFormat"
            aria-label="Clear Formatting"
            title="Clear Formatting"
          >
            <.icon name="hero-x-mark" class="w-4 h-4" />
          </button>
        </div>
        <!-- Editor -->
        <div
          id={@id}
          contenteditable={!@disabled}
          phx-hook="RichTextEditorHook"
          data-field-name={@name}
          class={[
            "relative min-h-[200px] p-4 text-gray-900 focus:outline-none",
            @error && "border-red-300",
            @disabled && "bg-gray-100 cursor-not-allowed"
          ]}
          data-placeholder={@placeholder}
        >
          <%= if @value do %>
            <%= Phoenix.HTML.raw(@value) %>
          <% end %>
        </div>
        <!-- Hidden input for form submission -->
        <input
          type="hidden"
          name={@name}
          id={"#{@id}-input"}
          value={@value || ""}
          phx-change="validate"
        />
        <input type="file" accept="image/*" id={"#{@id}-image-input"} class="hidden" />
      </div>

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
