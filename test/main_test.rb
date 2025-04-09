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

  def test_different_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_add_throws_on_single_negative_number
    exception = assert_raises do
      @calculator.add("-1,2")
    end
    assert_equal "negative numbers not allowed -1", exception.message
  end

  def test_add_throws_on_multiple_negative_numbers
    exception = assert_raises do
      @calculator.add("-1,-2")
    end
    assert_equal "negative numbers not allowed -1,-2", exception.message
  end
end

class StringCalculatorInputTest < Minitest::Test
  def test_numbers_for_empty_str
    assert_equal [], StringCalculatorInput.new('').numbers
  end

  def test_numbers_for_single_number
    assert_equal [101], StringCalculatorInput.new('101').numbers
  end

  def test_numbers_for_multiple_numbers
    assert_equal [101, 10], StringCalculatorInput.new('101,10').numbers
  end

  def test_numbers_with_newline
    assert_equal [101, 10], StringCalculatorInput.new("101\n10").numbers
  end

  def test_numbers_with_newline_and_comma
    assert_equal [101, 10, 1], StringCalculatorInput.new("101\n10,1").numbers
  end

  def test_numbers_with_custom_delimiter
    assert_equal [1, 2], StringCalculatorInput.new("//;\n1;2").numbers
  end
end
