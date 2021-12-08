module DayFive
  class HydrothermalVenture
    def initialize(vent_lines:)
      @vent_lines = vent_lines
    end

    def part_one
      number_of_overlap_points(points)
    end

    def part_two
      number_of_overlap_points(points('diagonal'))
    end

    private

    attr_reader :vent_lines

    def points(fallback_direction = nil)
      {}.tap do |points|
        vent_lines.each do |vent_line|
          start_position, end_position = vent_line.split(' -> ').map { |v| v.split(',') }
          direction = 'horizontal' if horizontal_line?(start_position, end_position)
          direction = 'vertical' if vertical_line?(start_position, end_position)
          direction ||= fallback_direction
          next unless direction

          vent_line_points(direction, start_position, end_position)
            .each { |point| points[point] = points[point].to_i + 1 }
        end
      end
    end

    def horizontal_line?(start_position, end_position)
      start_position[1] == end_position[1]
    end

    def vertical_line?(start_position, end_position)
      start_position[0] == end_position[0]
    end

    def vent_line_points(direction, start_position, end_position)
      case direction
      when 'diagonal'
        start_x_coordinate, start_y_coordinate = coordinates(start_position, end_position, 0)
        end_x_coordinate, end_y_coordinate = coordinates(start_position, end_position, 1)
        method = start_y_coordinate < end_y_coordinate ? :+ : :-
        (start_x_coordinate..end_x_coordinate).map.with_index do |x_coordinate, index|
          [x_coordinate, start_y_coordinate.send(method, index)]
        end
      when 'horizontal'
        y_coordinate = start_position[1].to_i
        x_coordinates = [start_position[0].to_i, end_position[0].to_i].sort
        (x_coordinates[0]..x_coordinates[1]).map { |x_coordinate| [x_coordinate, y_coordinate] }
      when 'vertical'
        x_coordinate = start_position[0].to_i
        y_coordinates = [start_position[1].to_i, end_position[1].to_i].sort
        (y_coordinates[0]..y_coordinates[1]).map { |y_coordinate| [x_coordinate, y_coordinate] }
      end
    end

    def coordinates(start_position, end_position, index)
      [start_position, end_position].sort_by { |value| value[0].to_i }[index].map(&:to_i)
    end

    def number_of_overlap_points(points)
      points.values.select { |value| value >= 2 }.count
    end
  end
end
