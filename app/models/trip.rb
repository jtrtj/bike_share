class Trip < ApplicationRecord
  validates_presence_of :bike_id, :subscription_type, :duration, :zip_code, :start_date, :end_date, :start_station_id, :end_station_id

end
