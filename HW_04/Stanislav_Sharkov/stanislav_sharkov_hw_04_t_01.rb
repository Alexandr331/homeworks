def task_4_1(number)
  return [] unless valid?(number)
  return [number] if number.zero?

  fibonacci(number)
end

def fibonacci(number)
  result = []
  fib1 = 0
  fib2 = 1
  while number > 0
    fib1, fib2 = fib2, fib1 + fib2
    number -= 1
    result << fib1
  end
  result
end

def valid?(number)
  return false unless number.class == Integer
  return false if number > 1000 || number < 0

  true
end
