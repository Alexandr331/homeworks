# HOME WORK: 4 

- use `Ruby >= 2.6.0`
- please create fork from the https://github.com/labs-ruby/homeworks (should be
  already done)
- then create a new branch `my_hw_04` (!)
- and go to the directory to `HW_04`
- create a folder with your name `Name_Surname`
- inside the folder create a file .rb for every task, for example `name_surname_hw_04_t_01.rb` 
- HARD WORK!
- and then create a PR (pull request) to https://github.com/labs-ruby/homeworks master branch
- you homeworks also will be automatically checked by `rubocop` and `minitest`. So, please 
  correct you code if there is a request from the rubocop or minitest (https://github.com/rubocop-hq/ruby-style-guide).
- Travis CI should be GREEN

### Tasks:

#### 1 at the input of method `task_4_1(n)` (read "variable") is sent number n.
Method `task_4_1(n)` should return a sequence of Fibonacci for the sent number n. 
  - n is an argument indicating the number of elements in the sequence
  - Starting with 1. Return 0 if 0 is sent.
  - The maximum number is 1000
  - https://en.wikipedia.org/wiki/Fibonacci_number 

example:

```ruby
task_4_1(5) # => 1, 1, 2, 3, 5
```

#### 2. at the input of method `def task_4_2(input)` (read "variable") is sent text in YAML format:
Method `def task_4_2(input)` should return:
- an array of all configurations (empty if they are not), each in the form of a hash of the following format:

```ruby
{
  env_name: {
    db: database value,
    user: username value #if present,
    password: password value #if present,
    magic_number: pool * timeout #use default if not setted
  }
}
```
###### info & example
  - YAML (http://www.yaml.org/).
  - Parse manually or use http://ruby-doc.org/stdlib-2.5.1/libdoc/yaml/rdoc/YAML.html
  - example YAML(starting from # - its just my comment):

```yaml
stage: # name env
  adapter: mysql2 # not obligatory
  encoding: utf8  # not obligatory
  reconnect: false # not obligatory
  database: test-mysql2_development # obligatory
  pool: 5 # not obligatory, by default 1
  timeout: 5000 # not obligatory, by default 1000
  username: root # not obligatory
  password: password # not obligatory
  socket: /tmp/mysql.sock # not obligatory

development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 1000

production:
  adapter: postgresql
  encoding: unicode
  database: test-postgres_production
  pool: 5
  username: test-postgres
  password: x123
```
  - example result:

```ruby
[
  { stage: { db: "test-mysql2_development", user: "root", password: "password", magic_number: 25000 } },
  { development: { db: "db/development.sqlite3", magic_number: 5000 } },
  { production: { db: "test-postgres_production", user: "test-postgres", password: "x123", magic_number: 5000 } },
 ]
 ```

#### 3. at the input of method `def task_4_3(array)` (read "variable") is sent an multi-level array:
Method `def task_4_3(array)` should return:
- Return the sorted in descending order array of the unique elements of the initial array. 
- The initial array must not be changed.

```ruby
task_4_3([7, 3, [4, 5, 1], 1, 9, [2, 8, 1]]) # => [9, 8, 7, 5, 4, 3, 2, 1]
```

#### 4 at the input of method `def task_4_4(string)` (read "variable") is sent an string
- Check if it is palindrome?
- (https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D0%BB%D0%B8%D0%BD%D0%B4%D1%80%D0%BE%D0%BC)

```ruby
task_4_4("hello") # => false
task_4_4("Sum summus mus") # => true
```
