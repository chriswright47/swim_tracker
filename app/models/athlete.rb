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

  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end
end