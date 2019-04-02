def task_4(text)
  text.delete('^0-9').chars.inject(0) { |sum, x| sum + x.to_i }
end
