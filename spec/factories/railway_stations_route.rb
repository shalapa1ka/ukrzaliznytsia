FactoryBot.define do
  factory :railway_stations_route do
    association :route
    association :railway_station
    position { 1 }
    time_in { Time.new(1, 1, 1, 6, 0) }
    time_out { Time.new(1, 1, 1, 8, 0) }
  end
end