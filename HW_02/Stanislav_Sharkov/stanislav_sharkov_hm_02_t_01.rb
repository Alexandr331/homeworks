# My super class
class MyTime
  def initialize(hours = 3, minutes = 15)
    @hours = hours
    @minutes = minutes
  end

  def msg
    puts 'Incorrect input!'
  end

  def validation
    return msg unless @hours >= 0 && @hours <= 12
    return msg unless @minutes >= 0 && @minutes <= 60

    angle
  end

  def angle
    hour_hand = 0.5 * (60 * @hours + @minutes)
    minutes_hand = 6 * @minutes
    result = hour_hand - minutes_hand
    puts "Angle between #{@hours} hour hand and #{@minutes} minute hand
     Is #{result}"
  end
end

result = MyTime.new
result.validation
