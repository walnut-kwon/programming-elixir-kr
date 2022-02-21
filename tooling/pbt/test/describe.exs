defmodule TestStats do
  use ExUnit.Case

  test "합 계산" do
    list = [1, 3, 5, 7, 9]
    assert Stats.sum(list) == 25
  end

  test "항목 수 계산" do
    list = [1, 3, 5, 7, 9]
    assert Stats.count(list) == 5
  end

  test "값의 평균 계산" do
    list = [1, 3, 5, 7, 9]
    assert Stats.average(list) == 5
  end
end

defmodule TestStats0 do
  use ExUnit.Case

  describe "정수 리스트" do
    test "합 계산" do
      list = [1, 3, 5, 7, 9]
      assert Stats.sum(list) == 26
    end

    test "항목 수 계산" do
      list = [1, 3, 5, 7, 9]
      assert Stats.count(list) == 5
    end

    test "값의 평균 계산" do
      list = [1, 3, 5, 7, 9]
      assert Stats.average(list) == 5
    end
  end
end

defmodule TestStats1 do
  use ExUnit.Case

  describe "정수 리스트" do

    setup do
      [ list:    [1, 3, 5, 7, 9, 11],
        sum:     36,
        count:   6
      ]
    end

    test "합 계산", fixture do
      assert Stats.sum(fixture.list) == fixture.sum
    end

   test "리스트의 항목 수 계산", fixture do
      assert Stats.count(fixture.list) == fixture.count
    end

    test "값의 평균 계산", fixture do
      assert Stats.average(fixture.list) == fixture.sum / fixture.count
    end
  end
end
