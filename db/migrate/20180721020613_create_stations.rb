class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :dock_count
      t.string :city
      t.datetime :installation_date
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
