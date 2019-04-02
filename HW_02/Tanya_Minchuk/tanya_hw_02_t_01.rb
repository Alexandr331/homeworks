puts 'Hours: '
x = gets.to_i

puts 'Minutes: '
y = gets.to_i

z = (x + y / 60.0) * 30 - y * 6
angle = z.to_f
puts "The angle between the hours and the minutes hands is: #{angle}"
