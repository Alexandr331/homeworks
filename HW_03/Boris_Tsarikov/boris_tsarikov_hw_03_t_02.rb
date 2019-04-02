begin
  def task_2(str)
    res = []
    str.each_line do |i|
      ip = i[/^.* - -./]
      date = i[/[\[].*[\]]/]
      adr = i[/T .* H/]
      if date && adr && ip
        res << date[1..-2] + ' FROM: ' + ip[0..-5] + 'TO:' + adr[1..-3].upcase
      end
    end
    res
  end
rescue TypeError
  puts 'Check the type of object being passed to the method.It must be a string'
end
