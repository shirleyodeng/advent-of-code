require 'day_eight/seven_segment_search'

RSpec.describe DayEight::SevenSegmentSearch do
  let(:entries) { File.read('spec/fixtures/day_eight.text').split("\n") }

  subject { described_class.new(entries: entries) }

  describe '#part_one' do
    it 'returns the amount of times digits 1, 4, 7 or 8 appear in the output values' do
      expect(subject.part_one).to eq(237)
    end
  end

  describe '#part_two' do
    it 'returns the addition of all the output values' do
      expect(subject.part_two).to eq(1009098)
    end
  end
end
