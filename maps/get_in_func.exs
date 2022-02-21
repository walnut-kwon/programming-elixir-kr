authors = [
  %{ name: "José",  language: "Elixir" },
  %{ name: "Matz",  language: "Ruby" },
  %{ name: "Larry", language: "Perl" }
]

languages_with_an_r = fn (:get, collection, next_fn) ->
   for row <- collection do
     if String.contains?(row.language, "r") do
       next_fn.(row)
     end
   end
end

IO.inspect get_in(authors, [languages_with_an_r, :name])
#=> [ "José", nil, "Larry" ]
