class Trip < ApplicationRecord
  validates_presence_of :bike_id, :subscription_type, :duration, :zip_code, :start_date, :end_date, :start_station_id, :end_station_id

  belongs_to :start_station, class_name: 'Station'
  belongs_to :end_station, class_name: 'Station'
end
