FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    password { "password" }
    association :account
  end
end
