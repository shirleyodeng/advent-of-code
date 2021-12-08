module DaySix
  class Lanternfish
    def initialize(fishes:)
      @fishes = fishes
    end

    def part_one
      calculate(80)
    end

    def part_two
      calculate(256)
    end

    private

    attr_reader :fishes

    def calculate(times)
      hash = {}

      (0..8).each { |i| hash[i] = grouped_fishes[i.to_s]&.count || 0 }

      times.times do
        read_only = hash.dup
        read_only.each do |key, value|
          next if value.zero?

          hash[key] -= value

          if key.zero?
            hash[6] += value
            hash[8] += value
          else
            hash[key - 1] += value
          end
        end
      end

      hash.values.sum
    end

    def grouped_fishes
      @grouped_fishes ||= fishes.group_by(&:itself)
    end
  end
end
