defmodule LineSigil do
  @doc """
  여러 줄의 문자열을 받아 각 줄에 있는 문자열을 리스트로 반환하는
  `~l` 시길을 구현한다.

  ## 사용법 예제
      iex> import LineSigil
      LineSigil
      iex> ~l\"""
      ...> one
      ...> two
      ...> three
      ...> \"""
      ["one","two","three"]
  """

  def sigil_l(lines, _opts) do
    lines |> String.trim_trailing |> String.split("\n")
  end

end