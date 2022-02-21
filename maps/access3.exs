cast = %{
  buttercup: %{
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  westley: %{
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
}

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)])
#=> "Elwes"

IO.inspect get_and_update_in(cast, [Access.key(:buttercup), :role],
                             fn (val) -> {val, "Queen"} end)
#=> {"princess",
#    %{buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
#      westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}}}
