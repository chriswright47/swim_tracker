FactoryGirl.define do
  factory :athlete do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    gender     { ['men','women'].sample }
    status     'active'
  end
end