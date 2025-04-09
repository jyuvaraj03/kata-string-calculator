class StringCalculator
  def add(input_str)
    numbers = parse_numbers(input_str)
    validate(numbers)

    numbers.inject(0, :+)
  end

  private

  def parse_numbers(input_str)
    StringCalculatorInput.new(input_str).numbers
  end

  def validate(numbers)
    negative_numbers = numbers.filter(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" unless negative_numbers.empty?
  end
end

class StringCalculatorInput
  DEFAULT_DELIMITERS = [',', "\n"].freeze
  DELIMITER_SPECIFICATION_PATTERN = /\/\/(?<delimiter>.)\n/.freeze

  attr_reader :input_str

  def initialize(input_str)
    @input_str = input_str
  end

  def numbers
    split_numbers.map(&:to_i)
  end

  private

  def delimiters
    input_str.match(DELIMITER_SPECIFICATION_PATTERN)&.captures || DEFAULT_DELIMITERS
  end

  def numbers_str
    input_str.split(DELIMITER_SPECIFICATION_PATTERN).last || ''
  end

  def split_numbers
    numbers_str
      .split(/[#{delimiters.join}]+/)
  end
end
