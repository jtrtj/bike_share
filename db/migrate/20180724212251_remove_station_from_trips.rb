class RemoveStationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_reference :trips, :station, foreign_key: true
  end
end
