class MeetSerializer < ActiveModel::Serializer
  attributes :id, :opponent, :competition_date

  has_many :heats
end
