# task 4_1 solution
def task_4_1(number = 0)
  return [] unless number.is_a?(Integer)
  return [] if number > 1000 || number < 0
  return [0] if number.zero?
  return [1] if number == 1

  (1...number - 1).inject([1, 1]) { |fib| fib << fib[-1] + fib[-2] }
end
