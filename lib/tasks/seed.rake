namespace :db do
  task :seed_events => :environment do
    women_events = YAML.load_file(Rails.root.join('lib', 'fixtures', 'women_events.yml'))
    men_events = women_events.map do |e|
      e.merge('number' => e['number'] + 1, 'gender' => 'men')
    end

    events = women_events.zip(men_events)

    events.each do |event_data|
      Event.create(event_data)
    end
  end

  task :seed_athletes => :environment do
    require Rails.root.join('lib', 'fixtures', 'athlete_seeds.rb')
    AthleteSeeds.data.each do |athlete_data|
      Athlete.find_or_create_by(athlete_data)
    end
  end
end