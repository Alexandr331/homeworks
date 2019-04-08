def task_4_1(number)
  return [] if number < 0
  return [0] if number.zero?

  first_number = 0
  second_number = 1
  array_results = [1]
  (2..number).each do |_i|
    first_number, second_number = second_number, first_number + second_number
    array_results << second_number
  end
  array_results
end
