FactoryBot.define do
  factory :station do
    sequence(:name) { |n| "station-#{n}"}
    sequence(:dock_count) { |n| "dock-#{n}"
    city "San Fran"
    installation_date Date.today
    latitude 37.7749
    longitude 122.4194
  end
end