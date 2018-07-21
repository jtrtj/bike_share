# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require File.expand_path('../config/environment', __dir__)

stations = CSV.open('./db/csv/station.csv',
                    headers: true,
                    header_converters: true)
stations.each do |station|
  Station.create (
    id:                 station[:id],
    name:               station[:name],
    dock_count:         station[:dock_count],
    city:               station[:city],
    installation_date:  DateTime.strptime(station[:installation_date], '%m/%d/%Y')
  )
end
ActiveRecord::Base.connection.reset_pk_sequence!('stations')

trips = CSV.open('./db/csv/trips.csv',
                  headers: true,
                  header_converters: true)
trips.each do |trip|
  Trip.create(
    id:                               trip[:id],
    duration:                         trip[:duration],
    start_date:                       trip[:start_date],
    start_station_name:               trip[:start_station_name],
    start_station_id:                 trip[:start_station_id],
    end_date:                         trip[:end_date],
    end_station_name:                 trip[:end_station_name],
    end_station_id:                   trip[:end_station_id],
    bike_id:                          trip[:bike_id],
    subscription_type:                trip[:subscription_type],
    zip_code:                         trip[:zip_code]
  )
end

conditions = CSV.open('./csv/weather.csv'
                      header: true,
                      header_converters: true)
conditions.each do |condition|
  Condition.create(
    date:                         condition[:date] 
    max_temperature_f:            condition[:max_temperature_f]
    mean_temperature_f:           condition[:mean_temperature_f]
    min_temperature_f:            condition[:min_temperature_f]
    mean_humidity:                condition[:mean_humidity]
    mean_visibility_miles:        condition[:mean_visibility_miles]
    mean_wind_speed_mph:          condition[:mean_wind_speed_mph]
    precipitation_inches:         condition[:precipitation_inches]
  )
end
