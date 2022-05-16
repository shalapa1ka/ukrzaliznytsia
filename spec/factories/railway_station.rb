FactoryBot.define do
  factory :railway_station do
    title { Faker::Address.city }
  end
end