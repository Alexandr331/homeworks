# We know that analog clocks uses 12h format
# Lets convert hours to degrees
hour_to_deg = 360 / 12

# Since 15 minutes is a quater of an hour
# Hour hand should have passed 1/4 of it's "way to next hour"
hands_angle = hour_to_deg / 4.to_f

puts("I guess it would be #{hands_angle} degrees")
