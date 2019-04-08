# rubocop:disable all
require 'minitest/pride'
require "minitest/autorun"

class TestHW3 < Minitest::Test
  def test_true
    assert_equal true, true
  end

  def test_task_1_error_in_caps
    input = <<-LOG
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOG

    assert_equal "2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>", task_1(input), "should find a line with capitalized error"
  end


  def test_task_1_error_in_lower
    input = <<-LOG
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOG

    assert_equal "2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>", task_1(input), "should find a line with downcased error"
  end

  def test_task_1_error_in_mixed
    input = <<-LOG
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL:Error System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOG

    assert_equal "2018-04-23 20:30:42: SSL, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL:Error System error: Undefined error: 0 - 0>", task_1(input), "should find a line with mixed registry error"
  end

  def test_task_1_error_is_missed
    input = <<-LOG
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOG

    assert_empty task_1(input), "should return an empty string if there is no error"
  end

  def test_task_2_formating_valid
    input = <<-LOG
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOG

    assert_equal [
      "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
      "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
      "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"
    ], task_2(input), "should extract valid messages from successfull log entries"
  end

  def test_task_2_formating_no_records
    input = %q(10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST HTTP/1.1" 200 48 0.049)

    assert_empty task_2(input), "should be empty for bad records"
  end

  def test_task_2_formating_only_errors
    input = <<-LOG
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
2018-04-23 20:30:52: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOG

    assert_empty task_2(input), "should be empty for errors"
  end

  def test_task_3_time_counts
    input = <<-LOG
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
    LOG

    assert_equal "49.1", task_3(input), "should calculate the difference between events"
  end

  def test_task_3_time_counts
    input = <<-LOG
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
    LOG

    assert_equal "0", task_3(input), "should return 0 if there no correct events"
  end

  def test_task_4_sum_of_digits
    input = "2018-04-24 17:03:45.6 ubuntu-xenial[17425] Information - Detected docker: Version: 17.05.0-ce, API Version: v1.29"

    assert_equal 91, task_4(input)
  end

  def test_task_4_sum_is_zero_for_no_numbers
    input = "this is cool log"

    assert_equal 0, task_4(input)
  end
end
# rubocop:enable all
