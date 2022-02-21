handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("Rakefile"))    # 존재하는 파일을 연다.
IO.puts handle_open.(File.open("nonexistent")) # 존재하지 않는 파일을 연다.
