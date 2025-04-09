require_relative 'test_helper'
require 'main'

class GreeterTest < Minitest::Test
  def test_hello
    assert_equal "Hello", Greeter.new.hello
  end
end
