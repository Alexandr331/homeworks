require 'minitest/pride'
require 'openssl'
# rubocop:disable all
class HW3Runner
  KEY = '_' * 16
  VECTOR = "G\A�*{UK�	�".freeze

  class << self
    def call
      tasks_range.each do |task_number|
        decription_result = decrypt(task_number)
        IO.write(decription_result.decrypted_test_path, decription_result.decrypted_test_data)
        next unless path_for_task(task_number)
        require path_for_task(task_number)
        require decription_result.decrypted_test_path
        File.delete(decription_result.decrypted_test_path)
      end
    end

    def decrypt(task_number)
      decipher.decrypt
      decipher.key = KEY
      decipher.iv = VECTOR

      decription_result = Struct.new(:encrypted_test_path, :decrypted_test_path, :decrypted_test_data)
      encrypted_test_path = File.join('.', File.dirname(__FILE__), "/encrypted/encrypted_test_hw_03_#{task_number}.rb")
      decrypted_test_path = File.join('.', File.dirname(__FILE__), "/encrypted/decrypted_test_hw_03_#{task_number}.rb")

      decription_result.new(
        encrypted_test_path,
        decrypted_test_path,
        decipher.update(File.read(encrypted_test_path)) + decipher.final
      )
    end

    # expected FILE hw{INT}_test.rb to be present in the directory
    def encrypt(task_number)
      cipher.encrypt
      decipher.key = KEY
      decipher.iv = VECTOR
      test_file = File.join('.', File.dirname(__FILE__), "hw#{task_number}_test.rb")
      encrypted_data = cipher.update(File.read(test_file)) + cipher.final
      encrypted_file_path = File.join('.', File.dirname(__FILE__), "/encrypted/encrypted_test_hw_03_#{task_number}.rb")
      IO.write(encrypted_file_path, encrypted_data)
    end

    private

    def tasks_range
      (1..4).to_a(&:to_s)
    end

    def path_for_task(number)
      regexp = Regexp.new("hw_03_t_0#{number}")
      exclude_maks_regexp = Regexp.new("maksim_holubeu")
      Dir[File.join('.', '**/*.rb')].select { |f| f.match?(regexp) && !f.match?(exclude_maks_regexp) }.last
    end

    def decipher
      @cipher ||= OpenSSL::Cipher::AES.new(128, :CBC)
    end
    alias cipher decipher
  end
end
# rubocop:enable all

HW3Runner.call
