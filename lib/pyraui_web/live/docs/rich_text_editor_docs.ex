defmodule PyrauiWeb.DocsLive.RichTextEditorDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Rich Text Editor</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Rich text editor / WYSIWYG component for blogs, comments, and content editing with formatting controls.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Interactive Example</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <p class="text-sm text-gray-600 mb-4">
              Try the editor below - use the toolbar buttons or keyboard shortcuts to format your text!
            </p>

            <Pyraui.Components.RichTextEditor.rich_text_editor
              field={@form[:content]}
              label="Rich Text Content"
              placeholder="Start typing your content here..."
            />
            <%= if @rich_text_content do %>
              <div class="mt-4 p-4 bg-gray-50 rounded-lg border border-gray-200">
                <p class="text-sm font-medium text-gray-700 mb-2">Current HTML Output:</p>
                <pre class="text-xs text-gray-600 overflow-x-auto"><code phx-no-curly-interpolation>{@rich_text_content}</code></pre>
              </div>
            <% end %>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rich_text_editor field={@form[:content]} label="Content" /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Features</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Text Formatting</h3>

                <ul class="text-sm text-gray-700 space-y-1 list-disc list-inside">
                  <li>Bold (Ctrl+B)</li>

                  <li>Italic (Ctrl+I)</li>

                  <li>Underline (Ctrl+U)</li>

                  <li>Strikethrough</li>
                </ul>
              </div>

              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Headings</h3>

                <ul class="text-sm text-gray-700 space-y-1 list-disc list-inside">
                  <li>Heading 1 (H1)</li>

                  <li>Heading 2 (H2)</li>

                  <li>Heading 3 (H3)</li>

                  <li>Paragraph (P)</li>
                </ul>
              </div>

              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Lists & Alignment</h3>

                <ul class="text-sm text-gray-700 space-y-1 list-disc list-inside">
                  <li>Bullet Lists</li>

                  <li>Numbered Lists</li>

                  <li>Text Alignment (Left, Center, Right, Justify)</li>

                  <li>Indentation (Tab / Shift+Tab)</li>
                </ul>
              </div>

              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Special Features</h3>

                <ul class="text-sm text-gray-700 space-y-1 list-disc list-inside">
                  <li>Links (Ctrl+K)</li>

                  <li>Blockquotes</li>

                  <li>Code Blocks</li>

                  <li>Undo/Redo (Ctrl+Z / Ctrl+Y)</li>

                  <li>Clear Formatting</li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">With Initial Content</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <Pyraui.Components.RichTextEditor.rich_text_editor
              field={@form[:content]}
              value="<h2>Welcome</h2><p>This is <strong>pre-filled</strong> content with <em>formatting</em>!</p><ul><li>Item 1</li><li>Item 2</li></ul>"
              label="Pre-filled Editor"
            />
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
              &lt;.rich_text_editor
                field={@form[:content]}
                value={"&lt;h2&gt;Welcome&lt;/h2&gt;&lt;p&gt;This is &lt;strong&gt;pre-filled&lt;/strong&gt; content!&lt;/p&gt;"}
                label="Pre-filled Editor"
              /&gt;
            </code></pre>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Keyboard Shortcuts</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Formatting</h3>

                <ul class="text-sm text-gray-700 space-y-1">
                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+B</kbd>
                    - Bold
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+I</kbd>
                    - Italic
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+U</kbd>
                    - Underline
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+K</kbd>
                    - Insert Link
                  </li>
                </ul>
              </div>

              <div>
                <h3 class="font-semibold text-gray-900 mb-2">Editing</h3>

                <ul class="text-sm text-gray-700 space-y-1">
                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+Z</kbd>
                    - Undo
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Ctrl+Y</kbd>
                    - Redo
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Tab</kbd>
                    - Indent
                  </li>

                  <li>
                    <kbd class="px-2 py-1 bg-gray-100 rounded border border-gray-300">Shift+Tab</kbd>
                    - Outdent
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Note</h2>

          <div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <p class="text-sm text-blue-800 mb-2">
              The rich text editor uses a JavaScript hook (<code class="bg-blue-100 px-1 rounded">RichTextEditorHook</code>) to sync content with the hidden input field for form submission.
            </p>

            <p class="text-sm text-blue-800">
              All formatting is handled client-side using the browser's
              <code class="bg-blue-100 px-1 rounded">document.execCommand</code>
              API. The HTML content is automatically synced to a hidden input field for form submission.
            </p>
          </div>
        </section>

        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Props</h2>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 border border-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Prop
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Type
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Default
                  </th>

                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">
                    Description
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">field</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                    Phoenix.HTML.FormField
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">-</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Form field struct</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">label</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Label text</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    placeholder
                  </td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">"Start typing..."</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Placeholder text</td>
                </tr>

                <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">value</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">string</td>

                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">nil</td>

                  <td class="px-6 py-4 text-sm text-gray-700">Initial HTML content</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
