FactoryBot.define do
  factory :user do
    name { "Test User" }
    sequence(:email) { |n| "email#{n}@test.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { false }
  end
end