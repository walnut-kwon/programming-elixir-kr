case File.open("case.ex") do
  { :ok, file } ->
    IO.puts "First line: #{IO.read(file, :line)}"
  { :error, reason } ->
    IO.puts "Failed to open file: #{reason}"
end
