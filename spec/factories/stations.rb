FactoryBot.define do
  factory :station do
    sequence(:name) { |n| "station-#{n}"}
    sequence(:dock_count) { |n| "dock-#{n}"}
    city "San Fran"
    installation_date Date.today
  end
end