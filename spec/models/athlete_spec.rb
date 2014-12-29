require 'rails_helper'

RSpec.describe Athlete, :type => :model do
  subject { create :athlete, :first_name => 'Hal', :last_name => 'Incandenza' }
  describe '#full_name' do
    it 'returns first and last if both present' do
      expect(subject.full_name).to eq 'Hal Incandenza'
    end
  end

  describe '#entry_counts_for_meet' do
    let(:meet) { create :meet }
    let(:relay_event) { create :event, :relay => true }
    let(:individual_event) { create :event, :relay => false }
    let(:heat_one) { create :heat, :meet => meet, :event => relay_event}
    let(:heat_two) { create :heat, :meet => meet, :event => individual_event }
    let(:heat_three) { create :heat }

    it 'works with one relay and one individual' do
      create(:swim, :heat => heat_one, :athlete => subject)
      create(:swim, :heat => heat_two, :athlete => subject)
      expect(subject.entry_counts_for_meet(meet)).to eq(
        {:individual => 1, :relay => 1}
      )
    end

    it 'works with one relay and one individual' do
      create(:swim, :heat => heat_one, :athlete => subject)
      expect(subject.entry_counts_for_meet(meet)).to eq(
        {:individual => 0, :relay => 1}
      )
    end

    it 'works with one relay and one individual' do
      create(:swim, :heat => heat_two, :athlete => subject)
      expect(subject.entry_counts_for_meet(meet)).to eq(
        {:individual => 1, :relay => 0}
      )
    end

    it 'returns zeros if no swims' do
      expect(subject.entry_counts_for_meet(meet)).to eq(
        {:individual => 0, :relay => 0}
      )
    end

  end

  describe '#best_swim_for_event' do
    let(:heat_one)   { create(:heat, :id => 1)}
    let(:heat_two)   { create(:heat, :id => 2)}
    let(:heat_three) { create(:heat, :id => 3)}
    let(:event) { double(Event, :related_heats => [heat_one, heat_two])}

    it 'returns nil if no swims' do
      expect(subject.best_swim_for_event(event)).to be_nil
    end

    it 'returns nil if only swims for other events' do
      create(:swim, :heat => heat_three, :athlete => subject)
      expect(subject.best_swim_for_event(event)).to be_nil
    end

    it 'returns fastest swim if present' do
      swim = create(:swim, :heat => heat_one, :athlete => subject)
      expect(subject.best_swim_for_event(event)).to eq swim
    end

    it 'returns fastest swim if multiple present' do
      swim_one = create(:swim, :heat => heat_one, :athlete => subject, :final_time_ms => 47)
      swim_two = create(:swim, :heat => heat_one, :athlete => subject, :final_time_ms => 50)
      expect(subject.best_swim_for_event(event)).to eq swim_one
    end

    it 'returns fastest swim if multiple present for multiple related heats' do
      swim_one = create(:swim, :heat => heat_one, :athlete => subject, :final_time_ms => 47)
      swim_two = create(:swim, :heat => heat_one, :athlete => subject, :final_time_ms => 50)
      swim_three = create(:swim, :heat => heat_two, :athlete => subject, :final_time_ms => 23)
      expect(subject.best_swim_for_event(event)).to eq swim_three
    end
  end
end