require 'day_ten/syntax_scoring'

RSpec.describe DayTen::SyntaxScoring do
  let(:lines) { File.read('spec/fixtures/day_ten.text').split("\n") }

  subject { described_class.new(lines: lines) }

  describe '#part_one' do
    it 'returns the total syntax error score of the first illegal character of the corrupted lines' do
      expect(subject.part_one).to eq(358737)
    end
  end

  describe '#part_two' do
    it 'returns the middle score of the completion string total scores' do
      expect(subject.part_two).to eq(4329504793)
    end
  end
end