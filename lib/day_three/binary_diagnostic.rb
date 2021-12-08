module DayThree
  class BinaryDiagnostic
    def initialize(binary_numbers:)
      @binary_numbers = binary_numbers
    end

    def part_one
      gamma_binary_number_array = []
      epsilon_binary_number_array = []

      indexes.each do |index|
        zero_count = count(bit_value: '0', index: index, values: binary_numbers)
        one_count = count(bit_value: '1', index: index, values: binary_numbers)

        gamma_binary_number_array << (zero_count > one_count ? '0' : '1')
        epsilon_binary_number_array << (zero_count > one_count ? '1' : '0')
      end

      gamma_decimal = convert_to_decimal(gamma_binary_number_array)
      epsilon_decimal = convert_to_decimal(epsilon_binary_number_array)

      gamma_decimal * epsilon_decimal
    end

    def part_two
      oxygen_generator_rating = rating(dominant_bit_value: '1', submissive_bit_value: '0')
      c02_scrubber_rating = rating(dominant_bit_value: '0', submissive_bit_value: '1')

      oxygen_generator_rating_decimal = convert_to_decimal(oxygen_generator_rating)
      c02_scrubber_rating_decimal = convert_to_decimal(c02_scrubber_rating)

      oxygen_generator_rating_decimal * c02_scrubber_rating_decimal
    end

    private

    attr_reader :binary_numbers

    def indexes
      @indexes ||= (0...binary_numbers.first.length)
    end

    def rating(dominant_bit_value:, submissive_bit_value:)
      ratings = binary_numbers

      indexes.each do |index|
        break if ratings.count == 1

        zero_count = count(bit_value: '0', index: index, values: ratings)
        one_count = count(bit_value: '1', index: index, values: ratings)
        ratings = ratings.select { |rating| rating[index] == (one_count >= zero_count ? dominant_bit_value : submissive_bit_value) }
      end

      ratings.first.split('')
    end

    def count(bit_value:, index:, values:)
      values_of_index = values.map { |value| value[index] }
      grouped_values = values_of_index.group_by(&:itself)
      grouped_values[bit_value]&.count || 0
    end

    def convert_to_decimal(binary_number_array)
      binary_number_array
        .reverse
        .map
        .with_index { |binary_number, index| (2 ** index) * binary_number.to_i }
        .sum
    end
  end
end
