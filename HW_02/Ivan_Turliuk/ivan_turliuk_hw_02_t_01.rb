# We suppose that next is true:
# clock hands move along circumference which matches 360 degrees;
# 12 hours are marked on the clock's face,
# that is 360 / 12 = 30 degrees between each mark;
# in 15 minutes minute hand gets to the 3 hours mark
# which is quarter of circumference;
# during one full circle of minute hand hour hand moves between two marks;
# proportionally, at 03:15 angle between hands will be 30 / 4 = 7.5 degrees.

# class for clock modelling
class Clock
  def initialize(hours = 0.0, minutes = 0.0)
    @hours = hours
    @minutes = minutes
  end

  # angle between hands
  def abh
    hour_hand = @hours * 30
    minute_hand = @minutes * 6
    (hour_hand - minute_hand) + (30 / (60 / @minutes))
  end
end

puts 'Set hour hand:'
h = gets.chomp.to_f.abs
h -= 12.0 if h >= 12.0
puts 'Set minute hand:'
m = gets.chomp.to_f.abs
m = 0.0 if m >= 60.0
my_clock = Clock.new(h, m)
answer = my_clock.abh.abs
puts "Angle between hands is #{answer} degrees."
