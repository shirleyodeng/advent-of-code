require 'day_two/dive'

RSpec.describe DayTwo::Dive do
  let(:commands) { File.read('spec/fixtures/day_two.text').split("\n") }

  subject { described_class.new(commands: commands) }

  describe '#part_one' do
    it 'returns the multiple of the horizontal position and the depth' do
      expect(subject.part_one).to eq(1815044)
    end
  end

  describe '#part_two' do
    it 'returns the multiple of the horizontal position and the depth with consideration of aim' do
      expect(subject.part_two).to eq(1739283308)
    end
  end
end
