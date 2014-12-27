class Athlete < ActiveRecord::Base
  scope :active,       -> { where(:status => 'active').order(:first_name, :last_name)}
  scope :active_men,   -> { active.where(:gender => 'men')}
  scope :active_women, -> { active.where(:gender => 'women')}

  STATUS_LIST = ['active', 'inactive']
  GENDER_LIST = ['women', 'men']

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :status
  validates_presence_of :gender

  has_many :swims
  has_many :heats, :through => :swims
  has_many :events, :through => :heats

  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end

  def display_entry_count(meet)
    individual, relay = [0, 0]
    self.heats.where(:meet_id => meet.id).each do |h|
      h.event.relay ? relay += 1 : individual += 1
    end
    format('individual: %s, relay: %s', individual, relay)
  end
end