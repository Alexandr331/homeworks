def task_4_3(arr)
  return puts 'Invalid input!' unless arr.class == Array

  arr.flatten.uniq.sort.reverse
end
