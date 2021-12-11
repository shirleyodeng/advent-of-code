module DayNine
  class SmokeBasin
    def initialize(heightmap:)
      @heightmap = heightmap
    end

    def part_one
      heightmap.each_with_index.inject(0) do |sum, (row, y)|
        row.each_with_index { |number, x| sum += number + 1 if low_point?(neighbours(x, y)[1], number) }
        sum
      end
    end

    def part_two
      basins.map(&:count).max(3).inject(:*)
    end

    private

    attr_reader :heightmap

    def neighbours(x, y)
      positions = [[x, y - 1], [x - 1, y], [x + 1, y], [x, y + 1]].reject { |position| out_of_bounds?(position) }
      numbers = positions.map { |position| number(position) }
      [positions, numbers]
    end

    def out_of_bounds?(position)
      x, y = position
      position.any?(&:negative?) || x > last_x || y > last_y
    end

    def last_x
      @last_x ||= heightmap.first.size - 1
    end

    def last_y
      @last_y ||= heightmap.count - 1
    end

    def number(position)
      x, y = position
      heightmap[y][x]
    end

    def low_point?(neighbour_numbers, number)
      neighbour_numbers.all? { |neighbour_number| neighbour_number > number }
    end

    def basins
      [].tap do |basins|
        heightmap.each_with_index do |row, y|
          row.each_with_index do |number, x|
            neighbour_positions, neighbour_numbers = neighbours(x, y)
            basins << basin_numbers(neighbour_positions, [[x, y]]) if low_point?(neighbour_numbers, number)
          end
        end
      end
    end

    def basin_numbers(neighbour_positions, positions)
      basin_positions(neighbour_positions, positions).map { |basin_position| number(basin_position) }
    end

    def basin_positions(neighbour_positions, total_positions)
      positions = neighbour_positions - total_positions
      return total_positions if positions.empty?

      positions = positions.reject { |position| number(position) == 9 }
      return total_positions if positions.empty?

      total_positions += positions
      
      positions.each do |position|
        additional_positions, _additional_numbers = neighbours(position[0], position[1])
        total_positions = basin_positions(additional_positions, total_positions)
      end

      return total_positions
    end
  end
end
