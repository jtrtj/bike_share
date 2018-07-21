FactoryBot.define do
  factory :trip do
    bike_id 5
    subscription_type "Subscriber"
    duration 15
    start_station_id 23
    start_station_name "Downtown"
    end_station_id 25
    end_station_name "Castro"
    start_date Date.today
    end_date Date.today
    zip_code 91234
  end
end