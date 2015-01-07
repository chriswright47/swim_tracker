class Heat < ActiveRecord::Base
  belongs_to :meet
  belongs_to :event

  has_many :swims
  has_many :athletes, :through => :swims

  accepts_nested_attributes_for :swims

  default_scope { joins(:event).order("events.number") }

  scope :men, -> { joins(:event).where('events.gender = ?', 'men').order('events.number asc') }
  scope :women, -> { joins(:event).where('events.gender = ?', 'women').order('events.number asc') }

  def display_name
    event.display_name
  end
end