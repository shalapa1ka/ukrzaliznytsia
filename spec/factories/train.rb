FactoryBot.define do
  factory :train do
    number { Faker::Number.non_zero_digit }
    reverse { Faker::Boolean.boolean }
    route
    association :current_station, factory: :railway_station
  end
end

def train_with_carriages(count: 5, carriage_type: Carriage::TYPES.sample)
  FactoryBot.create(:train) do |train|
    FactoryBot.create_list(:carriage, count, carriage_type.downcase.to_sym, train: train)
  end
end