defmodule TableFormatterTest do
  use ExUnit.Case           # 테스트 기능을 가져온다
  import ExUnit.CaptureIO   # 표준 출력(stdout)으로 나가는 값을 가져올 수 있게 한다
  alias Issues.TableFormatter, as: TF


  @simple_test_data [
    [ c1: "r1 c1", c2: "r1 c2", c3: "r1 c3", c4: "r1+++c4" ],
    [ c1: "r2 c1", c2: "r2 c2", c3: "r2 c3", c4: "r2 c4" ],
    [ c1: "r3 c1", c2: "r3 c2", c3: "r3 c3", c4: "r3 c4" ],
    [ c1: "r4 c1", c2: "r4++c2", c3: "r4 c3", c4: "r4 c4" ]
  ]

  @headers [ :c1, :c2, :c4 ]


  def split_with_three_columns do
    TF.split_into_columns(@simple_test_data, @headers)
  end

  test "컬럼을 나눈다." do
    columns = split_with_three_columns()
    assert length(columns) == length(@headers)
    assert List.first(columns) == ["r1 c1", "r2 c1", "r3 c1", "r4 c1"]
    assert List.last(columns) == ["r1+++c4", "r2 c4", "r3 c4", "r4 c4"]
  end

  test "컬럼의 너비" do
    widths = TF.widths_of(split_with_three_columns())
    assert widths == [ 5, 6, 7 ]
  end

  test "문자열이 올바른 형식으로 반환된다." do
    assert TF.format_for([9, 10, 11]) == "~-9s | ~-10s | ~-11s~n"
  end

  test "결과가 올바르게 출력된다." do
    result = capture_io fn ->
    TF.print_table_for_columns(@simple_test_data, @headers)
    end
    assert result == """
    c1    | c2     | c4#{"     "}
    ------+--------+--------
    r1 c1 | r1 c2  | r1+++c4
    r2 c1 | r2 c2  | r2 c4#{"  "}
    r3 c1 | r3 c2  | r3 c4#{"  "}
    r4 c1 | r4++c2 | r4 c4#{"  "}
    """
  end
end
