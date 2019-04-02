def task_1(str)
  str.each_line do |line|
    return line.chomp if line.downcase.include? 'error'
  end
  ''
end
