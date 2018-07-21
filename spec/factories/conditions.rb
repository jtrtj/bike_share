FactoryBot.define do
  factory :condition do
    date Date.today
    max_temperature_f 75.0
    mean_temperature_f 67.0
    min_temperature_f 60.0
    mean_humidity 55.0
    mean_visible_miles 6.0
    mean_wind_speed 14.0
    precipitation_inches 1.0
  end
end