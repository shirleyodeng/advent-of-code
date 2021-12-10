require 'day_seven/the_treachery_of_whales'

RSpec.describe DaySeven::TheTreacheryOfWhales do
  let(:crab_positions) { File.read('spec/fixtures/day_seven.text').split(',') }

  subject { described_class.new(crab_positions: crab_positions) }

  describe '#part_one' do
    it 'returns the amount of fuel spent to align to the horizontal position using the least fuel possible' do
      expect(subject.part_one).to eq(343468)
    end
  end

  describe '#part_two' do
    it 'returns the amount of fuel spent to align to the horizontal position using the least fuel possible considering the inconstant rate' do
      expect(subject.part_two).to eq(96086265)
    end
  end
end
