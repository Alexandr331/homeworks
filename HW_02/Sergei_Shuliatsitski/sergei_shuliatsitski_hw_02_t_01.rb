def hands_angle(hours, minutes)
  # minutes_step = (360 / 60).to_f
  # hours_step = (360 / 12).to_f
  # Abcsize was too high with these assignments
  # using 6 for minutes_step and 30 for hours_step
  if (hours >= 0 && hours <= 12) && (minutes >= 0 && minutes <= 60)
    minutes_angle = 6.0 * minutes.to_f
    hours_angle = ((hours * 30) + (minutes / 60 * 30.0)).to_f
    (hours_angle - minutes_angle).abs
  else 'Incorrect input'
  end
end
puts 'Enter hours'
hours = gets.chomp.to_f
puts 'Enter minutes'
minutes = gets.chomp.to_f
puts "Angle between arrows is #{hands_angle(hours, minutes)}"
