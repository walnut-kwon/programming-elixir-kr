defmodule Users do
  dave = %{ name: "Dave", state: "TX", likes: "programming" }
  case dave do
    %{state: some_state} = person ->
      IO.puts "#{person.name} lives in #{some_state}"
    _ ->
      IO.puts "No matches"
  end
end
