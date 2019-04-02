# Reading comments, huh?
def task_1(str)
  result = ''
  str.each_line do |x|
    if x.downcase.include?('error') == true
      result = x.chomp
      break
    end
  end
  result
end
