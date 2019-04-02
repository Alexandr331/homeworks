hours = 3
minuts = 15
angle_per_hour = 360 / 12
hours_angle = angle_per_hour * hours + angle_per_hour / 60.0 * minuts
angle_per_minute = 360 / 60
minuts_angle = angle_per_minute * minuts
puts "angle: hours - #{hours_angle} minuts - #{minuts_angle}"
puts "diff #{hours_angle - minuts_angle}"
