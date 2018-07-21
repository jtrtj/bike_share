class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.datetime :date
      t.decimal :max_temperature_f
      t.decimal :mean_temperature_f
      t.decimal :min_temperature_f
      t.decimal :mean_humidity
      t.decimal :mean_visibility_miles
      t.decimal :mean_wind_speed_mph
      t.decimal :precipitation_inches
      t.timestamps
    end
  end
end
