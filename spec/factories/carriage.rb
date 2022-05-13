FactoryBot.define do
  factory :carriage do
    type { 'CVCarriage' }
    association :train, factory: :train
    sequence(:number) { |n| n }
    bottom_seats { 15 }
  end
end
