# There is a task solution formula:
# angle = (hour + minutes / 60) * 30 - minutes * 6
# So let do function

def angle(hour, minutes)
  (hour + minutes / 60) * 30 - minutes * 6
end

puts angle(3.0, 15.0)
