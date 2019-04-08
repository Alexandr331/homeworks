def task_1(str)
  return msg unless str.class == String

  str.each_line do |line|
    return line.chomp if line.downcase.include?('error')
  end

  ''
end

def msg
  puts 'Incorrect input'
end
