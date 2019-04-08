puts'Enter the value of hours hand (from 0 to 12)'
h = gets.chomp.to_i
if h < 0 || h > 12
  puts('Invalid hours')
  exit(-1)
end
puts'Enter the value of minutes hand (from 0 to 59)'
m = gets.chomp.to_i
if m < 0 || m > 59
  puts('Invalid minutes')
  exit(-1)
end
puts 'The angle between the hours and the minutes hands is:'
if h * 60 < m * 12
  puts((0.5 * (60 * h + m - 12 * m)).abs)
else
  puts((0.5 * (60 * h - m - 12 * m)).abs)
end
