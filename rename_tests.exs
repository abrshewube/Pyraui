# Script to update test files
defmodule RenameTests do
  def run do
    IO.puts("Updating test files...")

    # Find all test files
    files = Path.wildcard("test/**/*.{ex,exs}")

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

    IO.puts("\nDone updating test files!")
  end
end

RenameTests.run()
