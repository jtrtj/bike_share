class Station < ApplicationRecord

  validates_presence_of :name, :dock_count, :city, :installation_date

  has_many  :statuses
  has_many  :trips_started_at, class_name: 'Trip', foreign_key: :start_station_id, dependent: :delete_all
  has_many  :trips_ended_at, class_name: 'Trip', foreign_key: :end_station_id, dependent: :delete_all

  extend FriendlyId
  friendly_id :name, use: :slugged

end