class Event < ActiveRecord::Base
  has_many :heats

  def name
    format(
      '%{distance} %{stroke} %{relay}',
      :distance => distance,
      :stroke => stroke,
      :relay => relay ? 'relay' : ''
    ).strip.titleize
  end
end