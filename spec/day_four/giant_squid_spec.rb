require 'day_four/giant_squid'

RSpec.describe DayFour::GiantSquid do
  let(:input) { File.read('spec/fixtures/day_four.text').split("\n\n") }

  let(:boards) { input[1..-1] }
  let(:numbers) { input[0].split(',') }

  subject { described_class.new(boards: boards, numbers: numbers) }

  describe '#part_one' do
    it 'returns the final score of the winning board' do
      expect(subject.part_one).to eq(69579)
    end
  end

  describe '#part_two' do
    it 'returns the final score of the last to win board' do
      expect(subject.part_two).to eq(14877)
    end
  end
end
