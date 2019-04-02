# There was a problem with getting the number working with the DateTime class,
# using the help of github.com/yaourtv in the get_theme method.
# Figured it all out now
require 'date'

begin
  def task_3(str)
    result = 0
    duretion = []
    index = 0
    str.each_line do |i|
      next if i .include?('Calling core with action:') == false

      index += 1
      duretion << i[/^.* u/][0..-2]
      result = get_time(duretion) if index == 2
    end
    result.to_s
  end
rescue TypeError
  puts 'Check the type of object being passed to the method.It must be a string'
end

def get_time(duretion)
  end_of_action = DateTime.strptime(
    duretion[1].insert(-1, '0'), '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  begin_of_action = DateTime.strptime(
    duretion[0].insert(-1, '0'), '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  ((end_of_action - begin_of_action) / 1000.0).round(1)
rescue TypeError
  puts 'Check the type of object being passed to the method.It must be a string'
end
