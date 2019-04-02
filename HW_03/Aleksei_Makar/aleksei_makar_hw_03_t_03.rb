require 'date'

def task_3(str)
  result = 0
  line_array = []
  str.each_line do |line|
    line_array.push(line) if line.include?('Calling core with action:')
  end
  result = duration_calling(line_array) if line_array.size >= 2
  result.to_s
end

def duration_calling(line_array)
  finish = DateTime.strptime(line_array.last,
                             '%Y-%m-%d %H:%M:%S.%L').strftime('%Q').to_i
  start = DateTime.strptime(line_array.first,
                            '%Y-%m-%d %H:%M:%S.%L').strftime('%Q').to_i
  (finish - start) / 1000.0
end
