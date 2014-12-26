class Athlete < ActiveRecord::Base
  scope :active,       -> { where(:status => 'active')}

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :status

  has_many :swims
  belongs_to :gender

  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end
end