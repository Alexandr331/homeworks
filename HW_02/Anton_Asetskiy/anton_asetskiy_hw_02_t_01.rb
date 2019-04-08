def angle_between_hands(hours, minutes)
  0.5 * (60 * hours - 11 * minutes)
end

puts("Angle between hands when time is 3:15: #{angle_between_hands(3, 15)}.")
