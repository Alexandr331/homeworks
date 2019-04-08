def task_2(str)
  result = []
  str.each_line do |a|
    ip = a[/^.* - -/]
    date = a[/\[.*\]/]
    adr = a[/T .* H/]
    if ip && date && adr
      result << "#{date[1..-2]} FROM: #{ip[0..-4]}TO:#{adr[1..-3].upcase}"
    end
  end
  result
end
