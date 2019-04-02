def task_4(str)
  sum = 0
  str.each_char { |x| sum += x.to_i }
  sum
end
