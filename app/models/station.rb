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
end
