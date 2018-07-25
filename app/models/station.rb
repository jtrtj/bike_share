class Station < ApplicationRecord

  validates_presence_of :name, :dock_count, :city, :installation_date

  has_many  :statuses
  has_many  :trips, class_name: 'Station', foreign_key: :start_station_id
  has_many  :trips, class_name: 'Station', foreign_key: :end_station_id

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.total_count
    count
  end

  def self.average_bike_per_station
    average(:dock_count)
  end

  def self.most_bikes_at_station
    maximum(:dock_count)
  end

  def self.stations_name_most_bikes
    where(dock_count: most_bikes_at_station)
  end

  def self.fewest_bikes_at_station
    minimum(:dock_count)
  end

  def self.stations_name_fewest_bikes
    where(dock_count: fewest_bikes_at_station)
  end
end
