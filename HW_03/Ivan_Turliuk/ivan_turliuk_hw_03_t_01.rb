# task 1 solution
def task_1(variable = '')
  return '' unless variable.is_a?(String)

  variable.downcase.each_line { |l| return l.chomp if l.include?('error') }
  ''
end
