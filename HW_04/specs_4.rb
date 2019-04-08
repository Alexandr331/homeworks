# rubocop:disable all
require "minitest/autorun"
require 'timeout'

# sorry for that -_-
begin
  if respond_to?(:task_4_1) && respond_to?(:task_4_2) && respond_to?(:task_4_3) && respond_to?(:task_4_4)
    loaded = true
  else
    loaded = false
  end
end

# btw, what are you looking here, huh?

if true
  class TestHW4 < Minitest::Test
    def test_true
      assert_equal true, true
    end

    def test_task_4_1_fib_numbers_zero
      assert_equal [0], task_4_1(0), "should be 0 for 0"
    end

    def test_task_4_1_fib_numbers_invalid
      assert_equal [], task_4_1(-1), "should be empty for invalid"
    end

    def test_task_4_1_fib_numbers_starts_from_one
      assert_equal [1], task_4_1(1), "should start from 1"
    end

    def test_task_4_1_fib_numbers_corner_case
      assert_equal [1, 1], task_4_1(2), "should start from 1"
    end

    def test_task_4_1_fib_numbers_normal_sequence
      assert_equal [1, 1, 2, 3, 5, 8, 13, 21, 34, 55], task_4_1(10), "should return the valid sequence"
    end

    def test_task_4_1_fib_numbers_big_number
      Timeout::timeout(5) do
        assert_equal task_4_1(1_000).size, 1_000, "should handle big numbers"
      end
    end

    def test_task_4_2_valid_config_full
      input = <<-YAML
  stage:
    adapter: mysql2
    encoding: utf8
    reconnect: false
    database: test-mysql2_development
    pool: 5
    timeout: 5000
    username: root
    password: password
    socket: /tmp/mysql.sock

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
      YAML

      assert_equal [
    { stage: { db: "test-mysql2_development", user: "root", password: "password", magic_number: 25000 } },
    { development: { db: "db/development.sqlite3", magic_number: 5000 } },
    { production: { db: "test-postgres_production", user: "test-postgres", password: "x123", magic_number: 5000 } },
   ], task_4_2(input), "should extract the right data"
    end

    def test_task_4_2_empty_config
      assert_empty task_4_2(""), "should be empty for missing envs"
    end

    def test_task_4_2_default_values
      input = <<-YAML
  stage:
    adapter: mysql2
    encoding: utf8
    reconnect: false
    database: test-mysql2_development
    username: root
    password: password
    socket: /tmp/mysql.sock
  YAML

      assert_equal [
        { stage: { db: "test-mysql2_development", user: "root", password: "password", magic_number: 1000 }}
      ], task_4_2(input), "should use default values"
    end

    def test_task_4_3_normal
      assert_equal [9, 8, 7, 5, 4, 3, 2, 1], task_4_3([7, 3, [4, 5, 1], 1, 9, [2, 8, 1]]), "should return sorted 1-level unique array"
    end

    def test_task_4_3_empty
      assert_equal [], task_4_3([]), "should return empty array for empty input"
    end

    def test_task_4_3_duplicates
      assert_equal [3], task_4_3([3, 3, 3, 3]), "should filter out duplicates"
      assert_equal [3, 2, 1], task_4_3([3, 2, 2, 1, [3]]), "should filter out duplicates"
    end

    def test_task_4_3_keep_original_intact
      orig = [1, 1, [6], 4, 9]
      bckp = orig.dup
      task_4_3(orig)

      assert_equal bckp, orig, "should leave original intact"
    end

    def test_task_4_4_negative
      refute task_4_4("hello"), "should detect palindrome correctly"
    end

    def test_task_4_4_positive
      assert task_4_4("sum summus mus"), "should detect palindrome correctly"
    end

    def test_task_4_4_one
      assert task_4_4("1"), "should detect palindrome correctly"
    end

    def test_task_4_4_camelcase
      assert task_4_4("sUm suMMus Mus"), "should detect palindrome correctly"
    end
  end
end
# rubocop:enable all
