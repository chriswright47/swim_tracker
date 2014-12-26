class HeatSerializer < ActiveModel::Serializer
  attributes :id, :meet_id, :event_id, :gender

  belongs_to :meet
  belongs_to :event
end
