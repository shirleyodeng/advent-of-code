require 'day_eleven/dumbo_octopus'

RSpec.describe DayEleven::DumboOctopus do
  let(:energy_levels) do
    File
      .read('spec/fixtures/day_eleven.text')
      .split("\n")
      .map { |line| line.split('').map(&:to_i) }
  end

  subject { described_class.new(energy_levels: energy_levels) }

  describe '#part_one' do
    it 'returns the total of flashes after 100 steps' do
      expect(subject.part_one).to eq(1681)
    end
  end

  describe '#part_two' do
    it 'returns the first step during which all octopuses flash' do
      expect(subject.part_two).to eq(276)
    end
  end
end