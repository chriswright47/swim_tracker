class Athlete < ActiveRecord::Base
  scope :active,       -> { where(:status => 'active')}
  scope :active_men,   -> { active.where(:gender => 'male')}
  scope :active_women, -> { active.where(:gender => 'female')}

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :status
  validates_presence_of :gender


  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end
end