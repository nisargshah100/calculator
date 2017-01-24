require 'test_helper'

class BasicCalculatorTest < ActiveSupport::TestCase
  
  test "single integer returns itself" do
    assert_equal 3, BasicCalculator.run("3")
  end

  test "sum" do
    assert_equal 6, BasicCalculator.run("3+3")
  end

  test "sum for decimals" do
    assert_equal 6.5, BasicCalculator.run("3+3.5")
  end

  test "multiplication before addition or subtraction" do
    assert_equal -1, BasicCalculator.run("3+5-3*3")
  end

  test "divison before addition or subtraction" do
    assert_equal 6, BasicCalculator.run("3+5-10/5")
  end

  test "left to right for multiplication and division" do
    assert_equal 2, BasicCalculator.run("3+5-10/5*3")
  end

  test "support exponential expressions" do
    assert_equal 101, BasicCalculator.run("1e2+1")
  end

  test "strip whitespace" do
    assert_equal 100, BasicCalculator.run("50 + 50")
  end

  test "examples" do
    examples = [["5*3+1+6/2+9*100", "919"], ["5*3+1+6/85+9*100", "916.07"]]
    examples.each do |ex|
      assert_match ex.last, BasicCalculator.run(ex.first).to_s
    end
  end

  test "division by zero" do
    assert_equal Float::INFINITY, BasicCalculator.run("5/0")
  end

  test "invalid input" do
    assert_nil BasicCalculator.run("apples")
  end

  test "invalid input with nil" do
    assert_nil BasicCalculator.run(nil)
  end
end
