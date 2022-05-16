FactoryBot.define do
  factory :route do
    title { "#{Faker::Address.city} - #{Faker::Address.city}" }
  end
end