class Heat < ActiveRecord::Base
  belongs_to :meet
  belongs_to :event

  has_many :swims
end