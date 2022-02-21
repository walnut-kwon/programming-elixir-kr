defmodule Operators do
  defmacro a + b do
    quote do
      to_string(unquote(a)) <> to_string(unquote(b))
    end
  end
end

defmodule Test do
  IO.puts(123 + 456)             #=> "579"
  import Kernel, except: [+: 2]
  import Operators
  IO.puts(123 + 456)             #=> "123456"
end

IO.puts(123 + 456)               #=> "579"
