class AthleteSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :status
end