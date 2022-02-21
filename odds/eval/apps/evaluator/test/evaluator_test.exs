defmodule EvaluatorTest do
  use ExUnit.Case
  import LineSigil

  test "일반 표현식 계산" do
    input = ~l"""
    1 + 2
    """
    output = ~l"""
    code> 1 + 2
    value> 3
    """

    run_test input, output
  end

  test "변수 바인딩이 유지된다" do
    input = ~l"""
    a = 123
    a + 1
    """
    output = ~l"""
    code> a = 123
    value> 123
    code> a + 1
    value> 124
    """
    run_test input, output
  end

  defp run_test(lines, output) do
    assert output == Evaluator.eval(lines)
  end
end
