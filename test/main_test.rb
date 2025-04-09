require_relative 'test_helper'
require 'main'

class StringCalculatorTest < Minitest::Test
  def test_string_calculator_adds
    assert StringCalculator.new.respond_to?(:add)
  end

  def test_add_returns_zero_on_empty_string
    assert_equal 0, StringCalculator.new.add('')
  end
end
