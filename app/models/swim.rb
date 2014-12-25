class Swim < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :heat
end