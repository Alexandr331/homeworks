puts 'Enter hours:'
h = gets.to_i
puts 'Enter minutes:'
m = gets.to_i
angle = (h + m / 60.0) * 30 - m * 6
puts "The angle between clock hands is #{angle.abs}"
