require 'day_nine/smoke_basin'

RSpec.describe DayNine::SmokeBasin do
  let(:heightmap) do
    File
      .read('spec/fixtures/day_nine.text')
      .split("\n")
      .map { |row| row.split('').map(&:to_i) }
  end

  subject { described_class.new(heightmap: heightmap) }

  describe '#part_one' do
    it 'returns the sum of the risk levels of all low points on your heightmap' do
      expect(subject.part_one).to eq(577)
    end
  end

  describe '#part_two' do
    it 'returns the multiple of the sizes of the three largest basins' do
      expect(subject.part_two).to eq(1069200)
    end
  end
end
