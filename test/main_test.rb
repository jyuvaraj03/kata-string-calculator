require_relative 'test_helper'
require 'main'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_string_calculator_adds
    assert @calculator.respond_to?(:add)
  end

  def test_add_returns_zero_on_empty_string
    assert_equal 0, @calculator.add('')
  end

  def test_add_return_num_on_single_num
    assert_equal 1, @calculator.add('1')
  end

  def test_add_return_sum_on_two_nums
    assert_equal 6, @calculator.add('1,5')
  end

  def test_add_return_sum_on_multiple_nums
    assert_equal 10, @calculator.add('1,2,3,4')
  end

  def test_add_handles_input_with_newline
    assert_equal 6, @calculator.add("1\n2,3")
    assert_equal 6, @calculator.add("1,2\n3")
  end
end
