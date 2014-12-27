namespace :db do
  task :populate_fake_athletes => :environment do

    Athlete.destroy_all

    20.times do
      Athlete.create(
        :first_name => Faker::Name.first_name,
        :last_name  => Faker::Name.last_name,
        :gender => ['men','women'].sample,
        :status => 'active'
      )
    end
  end
end