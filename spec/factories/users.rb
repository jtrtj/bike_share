FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user-#{n}"}
    password 'password'
    role 0
  end
end