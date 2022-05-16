FactoryBot.define do
  factory :carriage do
    type { Carriage::TYPES.sample }
    train
    sequence(:number) { |n| n }

    trait :cvcarriage do
      type { CVCarriage.name }
      bottom_seats { Faker::Number.non_zero_digit }
    end

    trait :coupecarriage do
      type { CoupeCarriage.name }
      top_seats { Faker::Number.non_zero_digit }
      bottom_seats { Faker::Number.non_zero_digit }
    end

    trait :economycarriage do
      type { EconomyCarriage.name }
      top_seats { Faker::Number.non_zero_digit }
      side_top_seats { Faker::Number.non_zero_digit }
      bottom_seats { Faker::Number.non_zero_digit }
      side_bottom_seats { Faker::Number.non_zero_digit }
    end

    trait :seatcarriage do
      type { SeatCarriage.name }
      seat_carriage { Faker::Number.non_zero_digit }
    end
  end
end
