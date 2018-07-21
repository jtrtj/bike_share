require 'rails_helper'

describe 'A visitor' do
  context 'visits conditions index' do
    it 'sees all conditions with Date, Max Temperature, Mean Temperature, Min Temperature, Mean Humidity, Mean Visibility (in Miles), Mean Wind Speed (mph), Precipitation (inches)' do
      condition_1 = Condition.create(date: 2018-03-12, max_temperature_f: 90, mean_temperature_f: 80, min_temperature_f: 70, mean_humidity: 60, mean_visibility_miles: 70, mean_wind_speed_mph: 30, precipitation_inches: 25)
      condition_2 = Condition.create(date: 2018-03-12, max_temperature_f: 80, mean_temperature_f: 70, min_temperature_f: 60, mean_humidity: 60, mean_visibility_miles: 30, mean_wind_speed_mph: 20, precipitation_inches: 2)

      visit conditions_path

      expect(page).to have_content(condition_1.date)
      expect(page).to have_content(condition_1.max_temperature_f)
      expect(page).to have_content(condition_1.mean_temperature_f)
      expect(page).to have_content(condition_1.min_temperature_f)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility_miles)
      expect(page).to have_content(condition_1.mean_wind_speed_mph)
      expect(page).to have_content(condition_1.precipitation_inches)

      expect(page).to have_content(condition_2.date)
      expect(page).to have_content(condition_2.max_temperature_f)
      expect(page).to have_content(condition_2.mean_temperature_f)
      expect(page).to have_content(condition_2.min_temperature_f)
      expect(page).to have_content(condition_2.mean_humidity)
      expect(page).to have_content(condition_2.mean_visibility_miles)
      expect(page).to have_content(condition_2.mean_wind_speed_mph)
      expect(page).to have_content(condition_2.precipitation_inches)
    end
  end
end
