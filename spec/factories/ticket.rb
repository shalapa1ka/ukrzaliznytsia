FactoryBot.define do
  factory :ticket do
    association :train, factory: :train
    association :user, factory: :user
  end

  factory :invalid_ticket, class: Ticket do
    train {  }
    user {  }
  end
end