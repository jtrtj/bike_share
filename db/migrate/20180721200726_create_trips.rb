class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_date
      t.string :start_station_name
      t.integer :start_station_id, index: true, dependent: :destroy
      t.datetime :end_date
      t.string :end_station_name
      t.integer :end_station_id, index: true, dependent: :destroy
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
