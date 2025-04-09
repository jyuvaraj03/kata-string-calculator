require_relative 'test_helper'
require 'main'

class StringCalculatorTest < Minitest::Test
  def test_string_calculator_adds
    assert StringCalculator.new.respond_to?(:add)
  end
end
