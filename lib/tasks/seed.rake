namespace :db do
  task :seed_events => :environment do

    [50, 100, 200, 500].each do |distance|
      Event.create(
        :stroke   => 'freestyle',
        :distance => distance,
        :relay    => false
      )
    end

    %w(breastroke butterfly backstroke).each do |stroke|
      Event.create(
        :stroke   => stroke,
        :distance => 100,
        :relay    => false
      )
    end

    [200, 400].each do |distance|
      Event.create(
        :stroke   => 'freestyle',
        :distance => distance,
        :relay => true
      )
    end

    Event.create(
      :stroke   => 'individual_medley',
      :distance => 200,
      :relay => false
    )

    Event.create(
      :stroke   => 'medley',
      :distance => 200,
      :relay => true
    )
  end
end