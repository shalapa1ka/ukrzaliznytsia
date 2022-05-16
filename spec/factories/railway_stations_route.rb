FactoryBot.define do
  factory :railway_stations_route do
    route
    railway_station
    position { Faker::Number.within range: 1..1000 }
    time_in { Faker::Date.in_date_period }
    time_out { Faker::Date.in_date_period  }
  end
end