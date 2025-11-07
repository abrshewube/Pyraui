# Script to extract documentation functions from docs_live.ex into separate modules
defmodule DocsExtractor do
  def extract_all do
    content = File.read!("lib/ashui_web/live/docs_live.ex")
    lines = String.split(content, "\n")

    # Get all render function line numbers
    functions = [
      {786, 905, "button"},
      {907, 949, "input"},
      {951, 1052, "card"},
      {1054, 1106, "select"},
      {1108, 1153, "textarea"},
      {1155, 1188, "checkbox"},
      {1190, 1299, "progress"},
      {1301, 1502, "navbar"},
      {1504, 1597, "tabs"},
      {1599, 1700, "badge"},
      {1702, 1827, "modal"},
      {1829, 1921, "table"},
      {1923, 2074, "accordion"},
      {2076, 2158, "breadcrumbs"},
      {2160, 2388, "grid"},
      {2390, 2539, "list"},
      {2541, 2695, "stats"},
      {2697, 2910, "avatar"},
      {2912, 3164, "datepicker"},
      {3166, 3436, "slider"},
      {3438, 3758, "toast"},
      {3760, 4026, "stepper"},
      {4028, 4255, "chart"},
      {4257, 4414, "gauge"},
      {4416, 4549, "heatmap"},
      {4551, 4740, "map"},
      {4742, 4912, "file_upload"},
      {4914, 5194, "rich_text_editor"},
      {5196, 5365, "multi_select"},
      {5367, 5579, "rating"},
      {5581, 5630, "password_strength_meter"},
      {5632, 5675, "tag_input"},
      {5677, 5721, "signature_pad"},
      {5723, 5773, "color_picker"},
      {5775, 5831, "conditional_form"},
      {5833, 5993, "carousel"},
      {5995, 6144, "wizard"},
      {6146, 6278, "resizable_panels"},
      {6280, 6401, "filter_panel"},
      {6403, 6555, "skeleton"},
      {6557, 6600, "skeleton_layout"},
      {6602, 6766, "autocomplete"},
      {6768, 6910, "sortable_list"},
      {6912, 7055, "live_chat"},
      {7057, 7190, "live_feed"},
      {7192, 7342, "countdown"},
      {7344, 7452, "kanban"},
      {7454, 7565, "gantt"},
      {7567, 7705, "live_data_table"},
      {7707, 7843, "user_profile_card"},
      {7845, 7981, "avatar_group"},
      {7983, 8091, "connections_widget"},
      {8093, 8181, "badge_card"},
      {8183, 8294, "theme_switch"},
      {8296, 8433, "alert"},
      {8435, 8633, "theme_config"},
      {8635, 8764, "diff"},
      {8766, 8888, "kbd"},
      {8890, 8956, "link"},
      {8958, 9020, "hero"},
      {9022, 9081, "swap"},
      {9083, 9183, "dock"},
      {9185, 9316, "drawer"},
      {9318, 9444, "mockup"},
      {9446, 9583, "timeline"},
      {9585, 9720, "lightbox"},
      {9722, 9818, "video_player"},
      {9820, 9946, "animated_chart"},
      {9948, 10065, "masonry_grid"},
      {10067, 10079, "coming_soon"}
    ]

    Enum.each(functions, fn {start_line, end_line, name} ->
      extract_function(lines, start_line, end_line, name)
    end)

    IO.puts("Extracted #{length(functions)} documentation modules!")
  end

  defp extract_function(lines, start_line, end_line, name) do
    # Extract the function body (skip the defp line)
    function_lines = Enum.slice(lines, start_line, end_line - start_line)

    # Find the actual content between ~H""" and """
    content_start = Enum.find_index(function_lines, &String.contains?(&1, ~s(~H""")))
    content_end = Enum.find_index(function_lines, fn line ->
      String.trim(line) == ~s(""")
    end)

    if content_start && content_end do
      content_lines = Enum.slice(function_lines, content_start + 1, content_end - content_start - 1)
      content = Enum.join(content_lines, "\n")

      module_name = name
        |> String.split("_")
        |> Enum.map(&String.capitalize/1)
        |> Enum.join("")

      module_content = """
      defmodule AshuiWeb.DocsLive.#{module_name}Docs do
        use AshuiWeb, :html

        def render(assigns) do
          ~H\"""
      #{content}
          \"""
        end
      end
      """

      file_path = "lib/ashui_web/live/docs/#{name}_docs.ex"
      File.write!(file_path, module_content)
      IO.puts("Created #{file_path}")
    end
  end
end

DocsExtractor.extract_all()
