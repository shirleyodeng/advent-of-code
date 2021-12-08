require 'day_six/lanternfish'

RSpec.describe DaySix::Lanternfish do
  let(:fishes) { File.read('spec/fixtures/day_six.text').split(',') }

  subject { described_class.new(fishes: fishes) }

  describe '#part_one' do
    it 'returns the number of lanternfish there would be after 80 days' do
      expect(subject.part_one).to eq(366057)
    end
  end

  describe '#part_two' do
    it 'returns the number of lanternfish there would be after 256 days' do
      expect(subject.part_two).to eq(1653559299811)
    end
  end
end
