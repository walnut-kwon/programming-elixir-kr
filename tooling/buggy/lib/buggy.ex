defmodule Buggy do
  def parse_header(
    <<
      format::integer-16,
      tracks::integer-16,
    division::integer-16
    >>
  ) do

    IO.puts "format: #{format}"
    IO.puts "tracks: #{tracks}"
    IO.puts "division: #{decode(division)}"
  end

  def decode(<< 1::1, beats::15 >>) do
    "♩ = #{beats}"
  end

  def decode(<< 0::1, fps::7, beats::8 >>) do
    "#{-fps} fps, #{beats}/frame"
  end
end
