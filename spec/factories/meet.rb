FactoryGirl.define do
  factory :meet do
    opponent 'test opponent'
    competition_date { Time.zone.today }
  end
end