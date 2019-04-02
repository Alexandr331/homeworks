require 'date'

def task_3(str)
  result = 0
  counter = 0
  times = []
  str.each_line do |x|
    next unless x.include?('Calling core with action:') == true

    counter += 1
    times << x[/^.* u/][0..-3]
    result = timecount(times) if counter == 2
  end
  result.to_s
end

def timecount(arr)
  en = DateTime.strptime(
    arr[1].insert(-1, '0'),
    '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  be = DateTime.strptime(
    arr[0].insert(-1, '0'),
    '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  ((en - be) / 1000.0).round(1)
end
