FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'password' }
    # password_confirmation { 'password' }
    admin { false }

  end
  trait :admin do
    admin { true }
  end
end