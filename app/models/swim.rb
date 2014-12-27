class Swim < ActiveRecord::Base
  include TimeDurationParser
  belongs_to :athlete
  belongs_to :heat

  accepts_nested_attributes_for :athlete

  def display_final_time
    output(final_time_ms)
  end

  def display_final_time=(final_time_string)
    self.final_time_ms = parse(final_time_string)
  end


  def display_athlete
    athlete && athlete.full_name
  end
end