require 'date'

def task_3(str)
  result = 0
  line_arr = []
  str.each_line do |line|
    line_arr.push(line) if line.include? 'Calling core with action:'
  end
  result = call_duration(line_arr) if line_arr.size >= 1
  result.to_s
end

def call_duration(line_arr)
  s = DateTime.strptime(
    line_arr[0], '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%S.%L').to_i
  f = DateTime.strptime(
    line_arr[1], '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%S.%L').to_i
  f - s
end
