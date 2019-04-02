# task 4 solution
def task_4(variable = '')
  return 0 unless variable.is_a?(String)

  variable.chars
          .select { |c| c.match?(/\d/) }
          .inject(0) { |s, c| s + c.to_i }
end
