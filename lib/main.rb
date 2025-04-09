class StringCalculator
  DEFAULT_DELIMITERS = [',', "\n"].freeze
  DELIMITER_SPECIFICATION_PATTERN = /\/\/(?<delimiter>.)\n/.freeze

  def add(input_str)
    numbers = parse_numbers(input_str)

    numbers.inject(0, :+)
  end

  private

  def parse_numbers(input_str)
    delimiters = get_delimiters(input_str)
    numbers_str = input_str.split(DELIMITER_SPECIFICATION_PATTERN).last || ""
    split_number_strs = split_numbers(numbers_str, delimiters)
    split_number_strs.map(&:to_i)
  end

  def get_delimiters(numbers_str)
    numbers_str.match(DELIMITER_SPECIFICATION_PATTERN)&.captures || DEFAULT_DELIMITERS
  end

  def split_numbers(numbers_str, delimiters = DEFAULT_DELIMITERS)
    numbers_str
      .split(/[#{delimiters.join}]+/)
  end
end
