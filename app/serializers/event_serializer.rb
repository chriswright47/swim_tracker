class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :stroke

  has_many :heats
end
