class StringCalculator
  def add(numbers_str)
    numbers = numbers_str.split(',')

    numbers[0].to_i + numbers[1].to_i
  end
end
