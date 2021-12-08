require 'day_five/hydrothermal_venture'

RSpec.describe DayFive::HydrothermalVenture do
  let(:vent_lines) { File.read('spec/fixtures/day_five.text').split("\n") }

  subject { described_class.new(vent_lines: vent_lines) }

  describe '#part_one' do
    it 'returns the number of points where at least two horizontal or vertical lines overlap' do
      expect(subject.part_one).to eq(5145)
    end
  end

  describe '#part_two' do
    it 'returns the number of points where at least two diagonal, horizontal or vertical lines overlap' do
      expect(subject.part_two).to eq(16518)
    end
  end
end
