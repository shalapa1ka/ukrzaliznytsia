FactoryBot.define do
  factory :train do
    number { '123' }
    reverse { false }
    association :route
    association :current_station, factory: :railway_station
  end
end

def train_with_carriages(count: 5)
  FactoryBot.create(:train) do |train|
    FactoryBot.create_list(:carriage, count, train: train)
  end
end