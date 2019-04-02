def task_4(str)
  result = 0
  str.each_char do |i|
    result += i.to_i
  end
  result
rescue TypeError
  puts 'Check the type of object being passed to the method.It must be a string'
end
