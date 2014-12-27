require 'rails_helper'
class TestParser; include TimeDurationParser; end
RSpec.describe TestParser do
  subject { TestParser.new }

  describe '#parse' do
    it 'handles nil' do
      expect(subject.parse(nil)).to eq nil
    end

    it 'handles empty string' do
      expect(subject.parse('')).to eq nil
    end

    it 'handles just seconds' do
      expect(subject.parse('23.00')).to eq 2300
    end

    it 'handles seconds and ms' do
      expect(subject.parse('23.47')).to eq 2347
    end

    it 'handles just minutes with a zero' do
      expect(subject.parse('1:01.23')).to eq 6123
    end

    it 'handles minutes with seconds' do
      expect(subject.parse('1:51.51')).to eq 11151
    end

    it 'handles many minutes' do
      expect(subject.parse('10:23.04')).to eq 62304
    end
  end

  describe '#output' do
    it 'handles nil' do
      expect(subject.output(nil)).to eq nil
    end

    it 'handles just seconds' do
      expect(subject.output(2300)).to eq '23.00'
    end

    it 'handles seconds and ms' do
      expect(subject.output(2347)).to eq '23.47'
    end

    it 'handles just minutes with a zero' do
      expect(subject.output(6123)).to eq '1:01.23'
    end

    it 'handles minutes with seconds' do
      expect(subject.output(11151)).to eq '1:51.51'
    end

    it 'handles many minutes' do
      expect(subject.output(62304)).to eq '10:23.04'
    end
  end

end