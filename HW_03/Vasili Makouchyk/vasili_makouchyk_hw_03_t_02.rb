def ip(string)
  regex = /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/
  string.scan(regex).first
end

def date(string)
  string.scan(/\[(.*?)\]/).flatten.first
end

def route(string)
  regex = %r{\/[a-zA-Z]+\/[0-9a-zA-Z]+\/[0-9a-zA-Z]+}
  string.scan(regex).first
end

def form(hash)
  "#{hash[:date]} FROM: #{hash[:ip]} TO: #{hash[:route]}"
end

def validate(hash)
  hash.any? { |i| i[1].nil? }
end

def hash_from_text(text)
  text.lines.map do |string|
    {
      ip: ip(string),
      route: route(string).upcase,
      date: date(string)
    }
  end
end

def task_2(text)
  hash_from_text(text).map { |hash| form(hash) unless validate(hash) }.compact
end
