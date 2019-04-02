def task_4(str)
  sum = 0
  str.delete('^0-9').each_char { |digit| sum += digit.to_i }
  sum
end
