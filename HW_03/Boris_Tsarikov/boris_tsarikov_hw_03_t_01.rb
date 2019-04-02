def task_1(str)
  result = ''
  str.each_line do |i|
    i.downcase.include?('error') == true ? result = i.chomp : result
  end
  result
rescue TypeError
  puts 'Check the type of object being passed to the method.It must be a string'
end
