class Meet < ActiveRecord::Base
  has_many :heats
  has_many :swims, :through => :heats
end