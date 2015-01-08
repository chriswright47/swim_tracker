class Event < ActiveRecord::Base
  has_many :heats

  default_scope { order 'number ASC' }

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
      .select  {|a| a.best_swim_for_event(self).try(:final_time_ms) }
      .sort_by {|a| a.best_swim_for_event(self).try(:final_time_ms)}
      .| Athlete.send(:"active_#{gender}").all
  end

  def split_count
    # how many splits need to be recorded for pdf print
    if relay
      1
    else
      [distance / 50, 5].min
    end
  end

  def related_heats
    if group = similar_events
      group.map { |number| Event.find_by_number(number).heats }.flatten
    else
      heats
    end
  end

  private

  def similar_events
    SIMILAR_EVENTS_GROUPS
      .find { |group| group.include?(self.number) }
  end

  SIMILAR_EVENTS_GROUPS = [
    # 50-free, 200-free-relay, jv-50-free
    [7,15,107],
    [8,16,108],
    # 100-free, 400-free-relay, jv-100-free
    [11,21,111],
    [12,22,112]
  ]
end