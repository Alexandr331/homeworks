# The hour hand of a 12-hour clock turns 360 angles in 12 hours (720 minutes)
# or 0.5 angles per minute.
# The minute hand rotates through 360 angles in 60 minutes
# or 6 angles per minute.
# Equation for the angle(a1) of the hour hand:
# a1 = 0.5 angles * (60 * hour + minutes past the hour)
# Equation for the angle(a2) of the minute hand:
# a2 = 6 angles * minute
# Equation for the angle(a3) between the hands:
# a3 = a1 - a2
# a3 = 0.5 angles * (60 * hours - 11 * minutes)
# a1, a2 there are angles of the hands
# measured clockwise from the 12 o'clock position.
# If the angle is greater than 180 degrees then subtract it from 360 degrees.
def angl(hrs, mnts)
  0.5 * (60 * hrs - 11 * mnts)
end

print 'Set Hours: '
hrs = gets.chomp.to_f
print 'Set Minutes: '
mnts = gets.chomp.to_f

if angl(hrs, mnts).abs > 180
  puts "Angle between hands is #{360 - angl(hrs, mnts).abs}"
else
  puts "Angle between hands is #{angl(hrs, mnts).abs}"
end
