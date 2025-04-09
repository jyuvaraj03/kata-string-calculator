class StringCalculator
  def add(numbers_str)
    numbers = numbers_str.split(',')

    sum = 0
    numbers.each do |number|
      sum += number.to_i
    end
    sum
  end
end
