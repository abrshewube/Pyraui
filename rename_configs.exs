# Script to update config files
defmodule RenameConfigs do
  def run do
    IO.puts("Updating config files...")

    # Find all config files
    files = Path.wildcard("config/**/*.exs")

    Enum.each(files, fn file ->
      content = File.read!(file)

      updated_content =
        content
        |> String.replace("Ashui", "Pyraui")
        |> String.replace("ashui", "pyraui")
        |> String.replace(~r/AshUI/, "PyraUI")

      if content != updated_content do
        File.write!(file, updated_content)
        IO.puts("Updated: #{file}")
      end
    end)

    IO.puts("\nDone updating config files!")
  end
end

RenameConfigs.run()
