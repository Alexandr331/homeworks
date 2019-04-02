def calculate_angle(hour, minute)
  hour -= 12 if hour > 12
  angle = ((hour * 30 + minute * 0.5) - (minute * 6)).abs
  [360 - angle, angle].min
end

puts 'Enter hour:'
hours = gets.chomp
puts 'Enter minutes:'
minutes = gets.chomp

puts "the angle is #{calculate_angle(hours.to_f, minutes.to_f)}"
