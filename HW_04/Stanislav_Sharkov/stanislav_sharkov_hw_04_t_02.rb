require 'yaml'

def task_4_2(str)
  return str if str == ''

  yaml_hash = YAML.safe_load(str)
  yaml_hash.map { |key, value| [key.to_sym => data_selection(value)] }.flatten
end

def data_selection(hash)
  result_hash = {}
  result_hash[:db] = hash['database'] if hash.key?('database')
  result_hash[:user] = hash['username'] if hash.key?('username')
  result_hash[:password] = hash['password'] if hash.key?('password')
  result_hash[:magic_number] = magic_num(hash)
  result_hash
end

def magic_num(hash)
  hash.default = 1
  pool = hash['pool']
  hash.default = 1000
  timeout = hash['timeout']
  pool * timeout
end
