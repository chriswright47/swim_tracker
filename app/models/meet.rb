class Meet < ActiveRecord::Base
  has_many :heats
  has_many :swims, :through => :heats

  validates_presence_of :opponent
  validates_presence_of :competition_date

  default_scope { order 'competition_date DESC' }

  def title
    format(
      '%s %s',
      competition_date.to_s(:db), opponent.titleize
    )
  end

  def pdf_filename
    format(
      '%s.pdf',
      title.gsub(/\s|-/, '_')
    )
  end
end