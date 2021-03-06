# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require File.expand_path('../config/environment', __dir__)

User.create(user_name: 'John', password: 'john', role: 1, first_name: 'John', last_name: 'R', street_address: '1331 17th', city: 'Denver', state: 'CO', zip: '80016')
User.create(user_name: 'Claire', password: '123', role: 1, first_name: 'Claire', last_name: 'B', street_address: '1331 17th', city: 'Denver', state: 'CO', zip: '80016')
User.create(user_name: 'Eliot', password: 'idk', role: 1, first_name: 'Eliot', last_name: 'S', street_address: '1331 17th', city: 'Denver', state: 'CO', zip: '80016')
User.create(user_name: 'BILLY MAYS', password: 'ugh', role: 1, first_name: 'Billy', last_name: 'M', street_address: '1331 17th', city: 'Denver', state: 'CO', zip: '80016')
User.create(user_name: 'Bobby', password: 'bobby', role: 0, first_name: 'Bobby', last_name: 'B', street_address: '1331 17th', city: 'Denver', state: 'CO', zip: '80016')

# Item.create(title: "Jetpack", description: 'Sounds great', image: 'wilford.jpeg', price: 400, status: 1)
# Item.create(title: "Mr. Jones", description: 'and me', image: 'wilford.jpeg', price: 300, status: 1)
# Item.create(title: "Counting Crows", description: 'Dead meme', image: 'wilford.jpeg', price: 500, status: 0)
# Item.create(title: "Tom Hardy", description: "He's Bane", image: 'wilford.jpeg', price: 3400, status: 1)
# Item.create(title: "Agent K", description: 'Tommy Lee Jones', image: 'wilford.jpeg', price: 900, status: 1)
# Item.create(title: "Agent J", description: 'Will Smith', image: 'wilford.jpeg', price: 490, status: 1)
# Item.create(title: "Lonliness", description: 'Unlimited supply', image: 'wilford.jpeg', price: 100, status: 1)
# Item.create(title: "A mediocre-looking Couch", description: 'You can burn it', image: 'wilford.jpeg', price: 490, status: 1)
# Item.create(title: "TRAMPOLINE", description: 'He does not know what that is', image: 'wilford.jpeg', price: 480, status: 1)
# Item.create(title: "CANARY", description: 'Not really', image: 'wilford.jpeg', price: 470, status: 0)
# Item.create(title: "Ke$ha's Career", description: 'Get it? Because it is dead!', image: 'wilford.jpeg', price: 400, status: 1)
# Item.create(title: "为什么？", description: '你妈讨厌我', image: 'wilford.jpeg', price: 430, status: 1)

stations = CSV.open('./db/csv/stations.csv',
                    headers: true,
                    header_converters: :symbol)
stations.each do |station|
  Station.create(
    id:                 station[:id],
    name:               station[:name],
    dock_count:         station[:dock_count],
    city:               station[:city],
    installation_date:  Date.strptime(station[:installation_date], '%m/%d/%Y'),
    created_at:         station[:created_at],
    updated_at:         station[:updated_at]
  )
end
ActiveRecord::Base.connection.reset_pk_sequence!('stations')

conditions = CSV.open('./db/csv/weather.csv',
                      headers: true,
                      header_converters: :symbol)
conditions.each do |condition|
  if $. % 2 == 0
    Condition.create(
      date:                         Date.strptime(condition[:date], '%m/%d/%Y'),
      max_temperature_f:            condition[:max_temperature_f],
      mean_temperature_f:           condition[:mean_temperature_f],
      min_temperature_f:            condition[:min_temperature_f],
      mean_humidity:                condition[:mean_humidity],
      mean_visibility_miles:        condition[:mean_visibility_miles],
      mean_wind_speed_mph:          condition[:mean_wind_speed_mph],
      precipitation_inches:         condition[:precipitation_inches],
      zip_code:                     condition[:zip_code]
    )
  end
end

trips = CSV.open('./db/csv/trip.csv',
  headers: true,
  header_converters: :symbol)
trips.each do |trip|
    if $. % 200 == 0
      Trip.create(
        id:                               trip[:id],
        duration:                         trip[:duration],
        start_date:                       Date.strptime(trip[:start_date], '%m/%d/%Y'),
        start_station_name:               trip[:start_station_name],
        start_station_id:                 trip[:start_station_id],
        end_date:                         Date.strptime(trip[:end_date], '%m/%d/%Y'),
        end_station_name:                 trip[:end_station_name],
        end_station_id:                   trip[:end_station_id],
        bike_id:                          trip[:bike_id],
        subscription_type:                trip[:subscription_type],
        zip_code:                         trip[:zip_code],
        created_at:                       trip[:created_at],
        updated_at:                       trip[:updated_at]
      )
    end
  end
