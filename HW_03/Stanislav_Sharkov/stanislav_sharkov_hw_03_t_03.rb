require 'time'
def rgx
  path = File.join 'HW_03', 'Stanislav_Sharkov'
  IO.read(File.join(path, 'rgx_tsk3.txt')).each_line.select do |line|
    /#{line.chomp}/
  end
end

def get_time(time)
  t_arr = []
  time.each { |el| t_arr << Time.parse(el) }
  (t_arr[0] - t_arr[-1]).abs.to_s
end

def zero
  '0'
end

def get_valid_lines(str)
  reg_exp = rgx
  str.each_line.select do |line|
    line.match?(/#{reg_exp}/) && (line.include? 'Calling core with action:')
  end
end

def task_3(str)
  return zero unless str.include? 'Calling core with action:'

  get_time(get_valid_lines(str))
end
