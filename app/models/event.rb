class Event < ActiveRecord::Base
  has_many :heats

  default_scope { order(:number) }

  def display_name
    format(
      '%{gender} %{distance} %{stroke} %{relay}',
      :gender => gender,
      :distance => distance,
      :stroke => stroke,
      :relay => relay ? 'relay' : ''
    ).strip.titleize
  end

  def eligible_athletes
    Athlete.send(:"active_#{gender}")
  end

  def related_heats
    if relay
      similar_events.reduce(heats) {|memo, event| memo += event.heats}
    else
      heats
    end
  end

  private

  def similar_events
    RELAY_SIMILAR_EVENTS
      .find { |event| event[:distance] == distance && event[:stroke] == stroke }
      .fetch(:similar_events)
      .map { |event_data| Event.where(event_data.merge(:gender => gender)).first }
  end

  RELAY_SIMILAR_EVENTS = [
    {
      :distance => 200,
      :stroke => 'freestyle',
      :similar_events => [{:distance => 50, :stroke => 'freestyle', :relay => false}]
    },
    {
      :distance => 400,
      :stroke => 'freestyle',
      :similar_events => [{:distance => 100, :stroke => 'freestyle', :relay => false}]
    },
    {
      :distance => 200,
      :stroke => 'medley',
      :similar_events => []
    }
  ]


end