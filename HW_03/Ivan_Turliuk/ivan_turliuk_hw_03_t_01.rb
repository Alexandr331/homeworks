# task 1 solution
def task_1(variable = '')
  return '' unless variable.is_a?(String)

  variable.each_line { |l| return l.chomp if l.downcase.include?('error') }
  ''
end
