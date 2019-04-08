def task_04_1(num)
  return 0 if num.zero?

  num.times.each_with_object([1]) do |n, obj|
    obj << obj[n - 1] + obj[n - 2] if n >= 1 && n <= 1000
  end
end
