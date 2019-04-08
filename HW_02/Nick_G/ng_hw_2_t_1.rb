# time for me
puts 'time is 3:15, what is the angle between the hours and the minutes hands?'
a = 360 / 12 * 3 # d in 1 hour
b = 360 / 60 * 15 # d in 1 minute
c = a - b
puts "angle between the hours and the minutes hands is #{c}"
