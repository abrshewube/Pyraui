defmodule PyrauiWeb.DocsLive.ConditionalFormDocs do
  use PyrauiWeb, :html

  def render(assigns) do
    ~H"""
    <div class="text-gray-900">
      <h1 class="text-4xl font-bold mb-4 text-gray-900">Conditional Form</h1>

      <div class="mb-8">
        <p class="text-gray-700 text-lg">
          Conditional / dynamic form component where fields appear/disappear based on user input.
        </p>
      </div>

      <div class="space-y-8">
        <section>
          <h2 class="text-2xl font-semibold mb-4 text-gray-900">Basic Usage</h2>

          <div class="bg-white p-6 rounded-lg border border-gray-200 mb-4 shadow-sm">
            <div class="max-w-md">
              <Pyraui.Components.ConditionalForm.conditional_form id="conditional-form-demo">
                <:field name="user_type" type="select" options={["individual", "business"]} />
                <:conditional_field show_if={%{"user_type" => "business"}}>
                  <div class="mb-4">
                    <label
                      for="company_name-input"
                      class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                    >
                      Company Name
                    </label>
                    <input
                      type="text"
                      id="company_name-input"
                      name="company_name"
                      class="block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100"
                    />
                  </div>
                </:conditional_field>
              </Pyraui.Components.ConditionalForm.conditional_form>
            </div>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto border border-gray-200">
            <pre class="text-gray-800"><code phx-no-curly-interpolation>
    &lt;.conditional_form id="dynamic-form"&gt;
      &lt;:field name="user_type" type="select" options={["individual", "business"]} /&gt;
      &lt;:conditional_field show_if={%{"user_type" => "business"}}&gt;
        &lt;div class="mb-4"&gt;
          &lt;label for="company_name-input"&gt;Company Name&lt;/label&gt;
          &lt;input type="text" id="company_name-input" name="company_name" /&gt;
        &lt;/div&gt;
      &lt;/:conditional_field&gt;
    &lt;/.conditional_form&gt;
            </code></pre>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
