class MeetCsvGenerator
  require 'csv'

  attr_reader :meet, :options

  def initialize(meet:, options: {})
    @meet = meet
    @options = options
  end

  def render!
    CSV.generate do |csv|
      meet.heats.each do |heat|
        csv << [heat.display_name]
        heat.swims.each do |swim|
          csv << [swim.display_athlete]
        end
        csv << ['']
      end
    end
  end
end