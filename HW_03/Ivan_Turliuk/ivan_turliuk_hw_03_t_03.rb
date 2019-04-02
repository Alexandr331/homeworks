require 'time'

# task 3 solution
def task_3(variable = '')
  return '0' unless variable.is_a?(String)

  ccwa = 'Calling core with action:'
  arr = []
  variable.each_line { |l| arr << Time.parse(l.chomp) if l.include?(ccwa) }
  arr.size == 2 ? (arr[1] - arr[0]).to_s : '0'
end
