defmodule StatsPropertyTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "정수 리스트" do
    property "count 함수가 음수를 반환해서는 안 된다" do
      check all l <- list_of(integer()) do
        assert Stats.count(l) >= 0
      end
    end

    property "항목 1개짜리 리스트의 값의 합은 항목의 값과 같다" do
      check all number <- integer() do
        assert Stats.sum([number]) == number
      end
    end

    property "합은 평균과 항목 개수의 곱과 같다 (nonempty)" do
      check all l <- list_of(integer()) |> nonempty do
        assert_in_delta(
          Stats.sum(l),
          Stats.count(l)*Stats.average(l),
          1.0e-6
        )
      end
    end

    property "합은 평균과 항목 개수의 곱과 같다 (min_length)" do
      check all l <- list_of(integer(), min_length: 1) do
        assert_in_delta(
          Stats.sum(l),
          Stats.count(l)*Stats.average(l),
          1.0e-6
        )
      end
    end
  end
end
