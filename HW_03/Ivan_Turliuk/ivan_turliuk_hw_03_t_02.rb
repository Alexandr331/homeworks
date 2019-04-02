# given pattern
def pattern
  ip = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
  time = %r{\d{2}\/[a-zA-Z]{3}\/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}}
  query = %r{POST .+ HTTP\/\d+\.\d+}
  /#{ip} - - \[#{time}\] "#{query}"/
end

# given string format
def format(line = '')
  ip = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
  time = %r{\d{2}\/[a-zA-Z]{3}\/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}}
  query = %r{POST .+ HTTP\/\d+\.\d+}
  "#{line[time]} FROM: #{line[ip]} TO: #{line[query][5..-10].upcase}"
end

# task 2 solution
def task_2(variable = '')
  return [] unless variable.is_a?(String)

  arr = []
  variable.each_line { |l| arr << format(l) if l.match?(pattern) }
  arr.compact
end
