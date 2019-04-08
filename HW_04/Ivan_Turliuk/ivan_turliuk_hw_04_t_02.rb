require 'yaml'

# calculating magic_number
def magic_number(pool = 1, timeout = 1000)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool * timeout
end

# getting needed values for hashes-values in the final array
def vformat(hash = {})
  hash = hash.map { |k, v| [k.to_sym, v] }.to_h
  new_hash = {}
  new_hash[:db] = hash[:database]
  new_hash[:user] = hash[:username] unless hash[:username].nil?
  new_hash[:password] = hash[:password] unless hash[:password].nil?
  new_hash[:magic_number] = magic_number(hash[:pool], hash[:timeout])
  new_hash
rescue NoMethodError
  {}
end

# formalizing hashes-elements of the final array
def hformat(hash = {})
  hash.map { |k, v| [k.to_sym, vformat(v)] }.to_h
end

# building output array
def aformat(array = [])
  array.map { |h| hformat(h) }
end

# dividing array with one hash into the array of many hashes
def devide(array = {})
  hash = array[0]
  new_array = []
  hash.each do |k, v|
    new_hash = {}
    new_hash[k] = v
    new_array << new_hash
  end
  new_array
end

# task 4_2 solution
def task_4_2(input = '')
  return [] unless input.is_a?(String)

  array = []
  array << YAML.safe_load(input)
  array.any? { |n| n.is_a?(Hash) } ? aformat(devide(array)) : []
rescue Psych::SyntaxError
  []
end
