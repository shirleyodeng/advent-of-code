require 'day_three/binary_diagnostic'

RSpec.describe DayThree::BinaryDiagnostic do
  let(:binary_numbers) { File.read('spec/fixtures/day_three.text').split("\n") }

  subject { described_class.new(binary_numbers: binary_numbers) }

  describe '#part_one' do
    it 'returns the power consumption of the submarine in decimal' do
      expect(subject.part_one).to eq(2250414)
    end
  end

  describe '#part_two' do
    it 'returns the life support rating of the submarine in decimal' do
      expect(subject.part_two).to eq(6085575)
    end
  end
end
