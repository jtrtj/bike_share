require 'faker'
FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user-#{n}"}
    password 'password'
    first_name Faker::GreekPhilosophers.name
    last_name Faker::Name.last_name
    street_address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    role 0
  end
end