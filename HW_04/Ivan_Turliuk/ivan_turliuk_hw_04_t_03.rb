# task 4_3 solution
def task_4_3(array = [])
  return [] unless array.is_a?(Array)

  array.flatten.uniq.sort { |a, b| b.to_s <=> a.to_s }
end
