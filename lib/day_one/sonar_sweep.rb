module DayOne
  class SonarSweep
    def initialize(measurements:)
      @measurements = measurements
    end

    def part_one
      number_of_increases(measurements)
    end

    def part_two
      number_of_increases(sliding_windows)
    end

    private

    attr_reader :measurements

    def number_of_increases(values)
      values
        .select
        .with_index { |_value, index| increased?(index, values) }
        .count
    end

    def increased?(index, values)
      return false if index.zero?

      values[index].to_f > values[index - 1].to_f 
    end

    def sliding_windows
      @sliding_windows ||=
        measurements
          .filter_map
          .with_index { |_measurement, index| sliding_window(index) }
    end

    def sliding_window(index)
      values = measurements[index..index + 2]
      return unless values.count == 3

      values.map(&:to_i).sum
    end
  end
end
