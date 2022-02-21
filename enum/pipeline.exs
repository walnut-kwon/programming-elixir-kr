[ 1, 2, 3, 4, 5 ]
   #=> [ 1, 2, 3, 4, 5 ]
|> Enum.map(&(&1*&1))
   #=> [ 1, 4, 9, 16, 25 ]
|> Enum.with_index
   #=> [ {1, 0}, {4, 1}, {9, 2}, {16, 3}, {25, 4} ]
|> Enum.map(fn {value, index} -> value - index end)
   #=> [1, 3, 7, 13, 21]
|> IO.inspect              #=> [1, 3, 7, 13, 21]
