# require 'pry'
# rubocop:disable all
class HW4Runner
  class << self
    def call
      @errors = Hash.new

      directories.each do |dir|
        Process.fork do
          tasks_in(dir).each do |task|
            require hw_path(dir, task)
          end
          puts "---- Running tests for #{dir} ----"
          require './HW_04/specs_4.rb'
        end
        Process.wait
        @errors[dir] = $?.exitstatus
      end

      exit_on_failure!(@errors)
    end

    private

    def exit_on_failure!(errors)
      if errors.values.count { |v| v == 1 } > 0
        puts errors
        puts "Some specs exited with 1, exiting..."
        exit 1
      end
    end

    def hw_path(dir, filename)
      File.join("./", dir, filename)
    end

    def directories
      Dir.glob('HW_04/*').select { |f| File.directory? f }
    end

    def tasks_in(folder)
      Dir.entries(folder).select { |file| file.match? %{hw_04.*\.rb} }
    end
  end
end
# rubocop:enable all

HW4Runner.call
