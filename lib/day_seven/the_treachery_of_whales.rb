module DaySeven
  class TheTreacheryOfWhales
    def initialize(crab_positions:)
      @crab_positions = crab_positions.map(&:to_i)
    end

    def part_one
      possible_positions
        .map { |position| constant_fuel(position) }
        .min
    end

    def part_two
      possible_positions
        .map { |position| inconstant_fuel(position) }
        .min
    end

    private

    attr_reader :crab_positions

    def possible_positions
      (1..crab_positions.max)
    end

    def constant_fuel(position)
      crab_positions.map { |crab_position| moves(position, crab_position) }.sum
    end

    def inconstant_fuel(position)
      crab_positions.map { |crab_position| (1..moves(position, crab_position)).sum }.sum
    end

    def moves(a, b)
      (a - b).abs
    end
  end
end
