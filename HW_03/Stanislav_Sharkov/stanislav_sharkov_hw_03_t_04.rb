def task_4(str)
  return error_msg unless str.class == String

  str.each_char.reduce(0) { |sum, el| sum + el.to_i }
end

def error_msg
  'Must be string!'
end
