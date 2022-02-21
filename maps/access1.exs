cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last:  "Elwes"
    },
    role: "farm boy"
  }
]

IO.inspect get_in(cast, [Access.all(), :character])
#=> ["Buttercup", "Westley"]

IO.inspect get_in(cast, [Access.at(1), :role])
#=> "farm boy"

IO.inspect get_and_update_in(cast, [Access.all(), :actor, :last],
                             fn (val) -> {val, String.upcase(val)} end)
#=> {["Wright", "Elwes"],
#    [%{actor: %{first: "Robin", last: "WRIGHT"}, character: "Buttercup",
#       role: "princess"},
#     %{actor: %{first: "Cary", last: "ELWES"}, character: "Westley",
#       role: "farm boy"}]}
