def task_2(str)
  r = []
  i = /^.* - -/
  d = /\[.*\]/
  g = /T .* H/
  str.each_line do |l|
    if l.match?(/#{i} #{d}.*#{g}.*/)
      r << "#{l[d][1..-2]} FROM: #{l[i][0..-4]}TO:#{l[g][1..-3].upcase}"
    end
  end
  r
end
