class Meet < ActiveRecord::Base
  has_many :heats
  has_many :swims, :through => :heats

  validates_presence_of :opponent
  validates_presence_of :competition_date
end