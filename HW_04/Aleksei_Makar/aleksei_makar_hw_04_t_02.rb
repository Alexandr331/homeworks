require 'yaml'
def task_4_2(yaml_text)
  return {} if yaml_text.empty?

  yaml_hash = YAML.safe_load(yaml_text)
  yaml_hash = yaml_hash.each_with_object({}) do |(key, value), hash|
    hash[key.to_sym] = value
  end
  result_hash(yaml_hash)
end

def result_hash(hash)
  arr_result = []
  hash.each do |key, value|
    result = {}
    result[key] = { db: value['database'] }
    result[key][:user] = value['username'] unless value['username'].nil?
    result[key][:password] = value['password'] unless value['password'].nil?
    result[key][:magic_number] = magic_number(value)
    arr_result << result
  end
  arr_result
end

def magic_number(value)
  value['pool'] = 1 if value['pool'].nil?
  value['timeout'] = 1000 if value['timeout'].nil?
  value['pool'].to_i * value['timeout'].to_i
end
