require 'date'
require 'time'

def task_3(text)
  str_to_cmp = []
  text.lines.each do |string|
    str_to_cmp << string if string.include? 'Calling core with action:'
  end
  str_to_cmp = str_to_cmp.map { |string| to_time(time(string)) }
  # puts str_to_cmp
  if str_to_cmp.size == 2
    difference(str_to_cmp[1], str_to_cmp[0])
  else
    '0'
  end
  # times = split_text(text).map { |string| to_time(time(string)) }.compact
  # until times[1].nil?
  #   curr = times.pop
  #   rezult << "#{curr} - #{times.last} =
  #              #{difference(curr.to_i, times.last.to_i)}"
  # end
  # rezult
end

def time(string)
  DateTime.parse(string)
rescue ArgumentError
  nil
end

def difference(curr, prev)
  String(curr.to_i - prev.to_i)
end

def to_time(date)
  Time.new(date.year, date.month,
           date.day, date.hour,
           date.min, date.sec, date.zone)
rescue NoMethodError
  nil
end
