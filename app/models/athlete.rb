class Athlete < ActiveRecord::Base
  scope :active,       -> { where(:status => 'active')}
  scope :active_men,   -> { active.where(:gender => 'male')}
  scope :active_women,   -> { active.where(:gender => 'female')}

  STATUS_LIST = ['active', 'inactive']
  GENDER_LIST = ['female', 'male']

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :status
  validates_presence_of :gender

  has_many :swims

  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end
end