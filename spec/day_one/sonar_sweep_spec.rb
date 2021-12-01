require 'day_one/sonar_sweep'

RSpec.describe DayOne::SonarSweep do
  let(:measurements) { File.read('spec/fixtures/day_one/input.text').split }

  subject { described_class.new(measurements: measurements) }

  describe '#part_one' do
    it 'returns the number of times a depth measurement increases from the previous measurement' do
      expect(subject.part_one).to eq(1184)
    end
  end

  describe '#part_two' do
    it 'returns the number of times the sum of measurements in this sliding window increases from the previous sum' do
      expect(subject.part_two).to eq(1158)
    end
  end
end
