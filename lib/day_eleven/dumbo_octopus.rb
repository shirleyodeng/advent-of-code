module DayEleven
  class DumboOctopus
    def initialize(energy_levels:)
      @energy_levels = energy_levels
      @flashes = 0
    end

    def part_one
      100.times do |i|
        increase_all
        accumulate
      end

      @flashes
    end

    def part_two
      (1..).each do |step|
        increase_all
        accumulate

        break step if @step_flashes.count == 100
      end
    end

    private

    def increase_all
      @energy_levels
        .each_with_index { |row, y| row.each_with_index { |energy_level, x| increase(x, y) } }
    end

    def increase(x, y)
      @energy_levels[y][x] += 1
    end

    def accumulate
      @step_flashes = []
      @energy_levels.each_with_index do |row, y|
        row.each_with_index do |energy_level, x|
          flash(x, y) if energy_level > 9
        end
      end
    end

    def flash(x, y)
      @energy_levels[y][x] = 0
      return if @step_flashes.include?([x, y])

      @flashes += 1
      @step_flashes << [x, y]

      neighbours(x, y).each do |neighbour|
        neighbour_x, neighbour_y = neighbour
        next if @step_flashes.include?(neighbour)

        increase(neighbour_x, neighbour_y)
        flash(neighbour_x, neighbour_y) if @energy_levels[neighbour_y][neighbour_x] > 9
      end
    end

    def neighbours(x, y)
      [
        [x - 1, y - 1],
        [x, y - 1],
        [x + 1, y - 1],
        [x - 1, y],
        [x + 1, y],
        [x - 1, y + 1],
        [x, y + 1],
        [x + 1, y + 1]
      ].reject { |neighbour| out_of_bounds?(neighbour) }
    end

    def out_of_bounds?(neighbour)
      x, y = neighbour
      neighbour.any?(&:negative?) || x > 9 || y > 9
    end
  end
end
