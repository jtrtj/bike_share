class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :bike_id
      t.integer :subscription_type
      t.integer :duration
      t.integer :zip_code
      t.datetime :start_date
      t.datetime :end_date
      t.integer :start_station_id
      t.integer :end_station_id

      t.timestamps
    end
  end
end
