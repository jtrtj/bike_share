class Condition < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :max_temperature_f
  validates_presence_of :mean_temperature_f
  validates_presence_of :min_temperature_f
  validates_presence_of :mean_humidity
  validates_presence_of :mean_visibility_miles
  validates_presence_of :mean_wind_speed_mph
  validates_presence_of :precipitation_inches
  validates_presence_of :zip_code

  def self.trip_numbers_by_temp_range
    joins('INNER JOIN trips ON conditions.date = trips.start_date')
    .group(:date, :max_temperature_f).count
  end

  def self.trip_numbers_by_precipitation
    joins('INNER JOIN trips ON conditions.date = trips.start_date')
    .group(:date, :precipitation_inches).count
  end

  def self.trip_numbers_by_wind_speed
    joins('INNER JOIN trips ON trips.start_date = conditions.date')
    .group(:date, :mean_wind_speed_mph).count
  end

  def self.trip_numbers_by_visibility
    joins('INNER JOIN trips ON trips.start_date = conditions.date')
    .group(:date, :mean_visibility_miles).count
  end
end
