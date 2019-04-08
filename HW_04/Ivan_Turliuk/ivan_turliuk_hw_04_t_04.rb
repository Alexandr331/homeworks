# formalize string for adequate comparison
def sformat(string = '')
  string.downcase.gsub(/[\s[[:punct:]]]/, '')
end

# task 4_4 solution
def task_4_4(string = '')
  return false unless string.is_a?(String)

  sformat(string).reverse == sformat(string).downcase
end
