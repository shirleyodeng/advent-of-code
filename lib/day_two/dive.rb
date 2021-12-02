module DayTwo
  class Dive
    def initialize(commands:)
      @aim = 0
      @commands = commands
      @depth = 0
      @horizontal_position = 0
    end

    def part_one
      calculate(aim: false)
    end

    def part_two
      calculate(aim: true)
    end

    private

    attr_reader :commands

    def calculate(aim:)
      commands.each do |command|
        direction, units = command.split

        case direction
        when 'down'
          aim ? @aim += units.to_i : @depth += units.to_i
        when 'forward'
          @horizontal_position += units.to_i
          @depth += @aim * units.to_i if aim
        when 'up'
          aim ? @aim -= units.to_i : @depth -= units.to_i
        end
      end

      @depth * @horizontal_position
    end
  end
end
