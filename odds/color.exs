defmodule ColorSigil do
  @color_map [
    rgb: [ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff, # ...
         ],
    hsb: [ red: {0,100,100}, green: {120,100,100}, blue: {240,100,100}
         ]
  ]

  def sigil_c(color_name, []), do: _c(color_name, :rgb)
  def sigil_c(color_name, 'r'), do: _c(color_name, :rgb)
  def sigil_c(color_name, 'h'), do: _c(color_name, :hsb)


  defp _c(color_name, color_space) do
    @color_map[color_space][String.to_atom(color_name)]
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [sigil_c: 2]
      import unquote(__MODULE__), only: [sigil_c: 2]
    end
  end
end

defmodule Example do
  use ColorSigil

  def rgb, do: IO.inspect ~c{red}
  def hsb, do: IO.inspect ~c{red}h
end


Example.rgb #=> 16711680 (== 0xff0000)
Example.hsb #=> {0,100,100}
