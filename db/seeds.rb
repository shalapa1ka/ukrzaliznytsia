30.times do
  title = Faker::Address.city
  RailwayStation.create title: title
end
