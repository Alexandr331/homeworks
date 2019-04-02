# The time is 3:15, lets H = hours and M = minutes, a = angle
H = 3.0
M = 15.0
# Anglebetween 12 and the Hour hand 03
z = (60 * H + M) / 2
# Angle between 12 and the Minute hand 15
x = 6 * M
# Angle between the clock
c = z - x
puts c
