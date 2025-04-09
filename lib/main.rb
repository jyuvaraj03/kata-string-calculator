class StringCalculator
  def add(numbers_str)
    numbers = parse_numbers(numbers_str)

    numbers.inject(0, :+)
  end

  private

  def parse_numbers(numbers_str)
    split_number_strs = numbers_str.split(',')
    split_number_strs.map(&:to_i)
  end
end
