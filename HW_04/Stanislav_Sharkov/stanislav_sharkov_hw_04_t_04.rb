def task_4_4(str)
  return puts 'Invalid input!' unless str.class == String
  return true if str.downcase.reverse == str.downcase

  false
end
