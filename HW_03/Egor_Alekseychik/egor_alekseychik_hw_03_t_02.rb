# Regex created with https://rubular.com/ regexp editor
# Thanks to /pr/1371786 for telling about this resource

def task_2(str)
  r = []
  str.each_line do |x|
    ip = x[/^.* - -/]
    d = x[/[\[].*[\]]/]
    a = x[/T .* H/]
    if ip && d && a
      r << d[1..-2] + ' FROM: ' + ip[0..-4] + 'TO:' + a[1..-3].upcase
    end
  end
  r
end
