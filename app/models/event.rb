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
end