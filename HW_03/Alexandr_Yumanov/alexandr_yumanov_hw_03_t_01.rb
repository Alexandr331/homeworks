def task_01(str)
  result = ''
  str.each_line do |line|
    return line.chomp if line.downcase.include? 'error'
  end
  result
end
