# Script to rename Ashui to Pyraui in all .ex and .exs files
defmodule RenameScript do
  def run do
    IO.puts("Renaming Ashui to Pyraui in all Elixir files...")

    # Find all .ex and .exs files in lib directory
    files =
      Path.wildcard("lib/**/*.ex") ++
      Path.wildcard("lib/**/*.exs") ++
      Path.wildcard("lib/**/*.heex")

    Enum.each(files, fn file ->
      content = File.read!(file)

      # Replace module names and references
      updated_content =
        content
        |> String.replace("Ashui.Components", "Pyraui.Components")
        |> String.replace("AshuiWeb", "PyrauiWeb")
        |> String.replace("Ashui.Application", "Pyraui.Application")
        |> String.replace("Ashui.Theme", "Pyraui.Theme")
        |> String.replace("Ashui.MixProject", "Pyraui.MixProject")
        |> String.replace("defmodule Ashui do", "defmodule Pyraui do")
        |> String.replace(~r/AshUI/, "PyraUI")  # Documentation references
        |> String.replace(":ashui", ":pyraui")  # Atom references
        |> String.replace("@moduledoc \"Ashui", "@moduledoc \"Pyraui")

      if content != updated_content do
        File.write!(file, updated_content)
        IO.puts("Updated: #{file}")
      end
    end)

    IO.puts("\nDone! Updated Elixir files.")
  end
end

RenameScript.run()
