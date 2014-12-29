require 'rails_helper'

RSpec.describe Event, :type => :model do
  subject { create :event, :distance => 47, :stroke => 'bar', :gender => 'women' }
  describe '#display_name' do
    it 'returns display name for individual' do
      subject.relay = false
      expect(subject.display_name).to eq 'Women 47 Bar'
    end

    it 'returns display name for relay' do
      subject.relay = true
      expect(subject.display_name).to eq 'Women 47 Bar Relay'
    end
  end

  describe '#eligible_athletes' do
    it 'asks athlete class for scope of eligible gender' do
      subject.gender = 'women'
      expect(Athlete).to receive(:active_women)
      subject.eligible_athletes
    end
  end

  describe '#related_heats' do
    before(:each) do
      @event_one = create :event, :distance => 50, :stroke => 'freestyle', :gender => 'women', :relay => false
      @event_two = create :event, :distance => 200, :stroke => 'freestyle', :gender => 'women', :relay => true
      @heat_one  = create(:heat, :event => @event_one)
      @heat_two  = create(:heat, :event => @event_two)
    end


    it 'returns just events own heats for individual events' do
      expect(@event_one.related_heats).to match_array([@heat_one])
    end

    it 'returns all related_heats for relays' do
      expect(@event_two.related_heats).to match_array([@heat_one, @heat_two])
    end
  end
end