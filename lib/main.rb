class StringCalculator
  def add(numbers_str)
    numbers = parse_numbers(numbers_str)

    sum = 0
    numbers.each do |number|
      sum += number.to_i
    end
    sum

  private

  def parse_numbers(numbers_str)
    split_number_strs = numbers_str.split(',')
    split_number_strs.map(&:to_i)
  end
end
