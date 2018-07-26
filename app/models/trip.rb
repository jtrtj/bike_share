class Trip < ApplicationRecord
  validates_presence_of :bike_id, :subscription_type, :duration, :zip_code, :start_date, :end_date, :start_station_id, :end_station_id, :start_station_name, :end_station_name

  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

  def self.average_duration_trip
    average(:duration)
  end

  def self.longest_ride
    order(duration: :desc).first
  end

  def self.shortest_ride
    order(duration: :desc).last
  end

  def self.station_with_most_rides_originating
   desired_station = select("start_station_id, COUNT(start_station_id) AS trips")
   .group("start_station_id")
   .order("trips DESC").limit(1)
   Station.find(desired_station.first.start_station_id)
  end

  def self.station_with_most_rides_ending
   desired_station = select("end_station_id, COUNT(end_station_id) AS trips")
   .group("end_station_id")
   .order("trips DESC").limit(1)
   Station.find(desired_station.first.end_station_id)
  end

  def self.year_by_year
    group("date_trunc('year', start_date)").count
  end

  def self.month_by_month
    group("date_trunc('month', start_date)").count
  end

  def self.most_ridden_bike
    select('trips.bike_id, count(trips.bike_id) AS bike_id_count')
    .group(:bike_id)
    .order('bike_id_count DESC')
    .limit(1).first.bike_id
  end

  def self.most_bike_rides
    where(bike_id: most_ridden_bike).count
  end

  def self.least_ridden_bike
    select('trips.bike_id, count(trips.bike_id) AS bike_id_count')
    .group(:bike_id)
    .order('bike_id_count ASC')
    .limit(1).first.bike_id
  end

  def self.least_bike_rides
    where(bike_id: least_ridden_bike).count
  end

  def self.subscription_type_by_count
    select('trips.subscription_type, count(trips.subscription_type) AS subscription_type_count')
    .group(:subscription_type)
    .order('subscription_type_count')
  end

  def self.date_with_most_trips
    select('trips.start_date, count(trips.start_date) AS date_trip_count')
    .group(:start_date)
    .order('date_trip_count DESC')
    .limit(1).last.start_date
  end

  def self.date_most_trips
    Trip.where(start_date: date_with_most_trips).length
  end

  def self.date_with_least_trips
    select('trips.start_date, count(trips.start_date) AS date_trip_count')
    .group(:start_date)
    .order('date_trip_count ASC')
    .limit(1).last.start_date
  end

  def self.date_least_trips
    Trip.where(start_date: date_with_least_trips).length
  end
end
