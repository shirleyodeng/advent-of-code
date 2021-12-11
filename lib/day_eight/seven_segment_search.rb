module DayEight
  class SevenSegmentSearch
    def initialize(entries:)
      @entries = entries
    end

    def part_one
      sizes = [1, 4, 7, 8].map { |digit| rules[digit][0] }
      entries.inject(0) do |count, entry|
        output_values = entry.split(' | ')[-1].split
        count += output_values.select { |output_value| sizes.include?(output_value.size) }.count
      end
    end

    def part_two
      entries.inject(0) { |sum, entry| sum += decoded_output_value(entry) }
    end

    private

    attr_reader :entries

    def rules
      {
        0 => [6, [7, 0]],
        1 => [2],
        2 => [5],
        3 => [5, [1, 0]],
        4 => [4],
        5 => [5, [4, 1]],
        6 => [6],
        7 => [3],
        8 => [7],
        9 => [6, [4, 0]]
      }
    end

    def decoded_output_value(entry)
      value = []
      signal_patterns, output_values = entry.split(' | ').map(&:split)
      translate(signal_patterns)

      output_values.each do |output_value|
        value << @key.find { |_k, v|  output_value.split('').sort == v }[0]
      end

      value.join.to_i
    end

    def translate(signal_patterns)
      @key = {}

      [1, 7, 4, 8, 3, 9, 5, 2, 0, 6].each do |digit|
        signal_pattern = signal_pattern(digit, signal_patterns)
        @key[digit] = signal_pattern.sort
        signal_patterns -= [signal_pattern.join]
      end
    end

    def signal_pattern(digit, signal_patterns)
      count, contains = rules[digit]

      signal_patterns
        .map { |signal_pattern| signal_pattern.split('') }
        .find do |signal_pattern|
          next false unless signal_pattern.count == count
          next true unless contains
          
          (@key[contains[0]] - signal_pattern).count == contains[1]
        end
    end
  end
end
