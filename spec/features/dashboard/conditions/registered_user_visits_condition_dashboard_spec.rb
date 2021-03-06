require 'rails_helper'
=begin
When I visit '/conditions-dashboard',
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
=end

describe 'A registered user' do
  context 'visiting dashboard' do
    before(:each) do
      @station_1 = create(:station, id: 25)
      @station_2 = create(:station, id: 56)
      @condition_1 = create(:condition, date: Date.strptime('8/15/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 93, precipitation_inches: 3.2, mean_wind_speed_mph: 23.0, mean_visibility_miles: 22.0)
      @condition_2 = create(:condition, date: Date.strptime('8/16/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 91, precipitation_inches: 3.1, mean_wind_speed_mph: 21.0, mean_visibility_miles: 21.0)
      @condition_3 = create(:condition, date: Date.strptime('8/17/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 87, precipitation_inches: 2.8, mean_wind_speed_mph: 19.0, mean_visibility_miles: 18.0)
      @condition_4 = create(:condition, date: Date.strptime('8/18/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 86, precipitation_inches: 2.6, mean_wind_speed_mph: 18.0, mean_visibility_miles: 17.0)
      @condition_5 = create(:condition, date: Date.strptime('8/19/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 74, precipitation_inches: 2.4, mean_wind_speed_mph: 14.0, mean_visibility_miles: 15.0)
      @condition_6 = create(:condition, date: Date.strptime('8/20/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 72, precipitation_inches: 2.3, mean_wind_speed_mph: 13.0, mean_visibility_miles: 12.0)
      @trip_1 = create(:trip, start_date: Date.strptime('8/15/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_2 = create(:trip, start_date: Date.strptime('8/15/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_3 = create(:trip, start_date: Date.strptime('8/16/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_4 = create(:trip, start_date: Date.strptime('8/17/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_5 = create(:trip, start_date: Date.strptime('8/17/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_6 = create(:trip, start_date: Date.strptime('8/18/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_7 = create(:trip, start_date: Date.strptime('8/19/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_8 = create(:trip, start_date: Date.strptime('8/19/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
      @trip_9 = create(:trip, start_date: Date.strptime('8/20/2015 16:45', '%m/%d/%Y'), start_station_id: 25, end_station_id: 56)
    end
    it 'sees the average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks' do
      visit conditions_dashboard_path

      expected_max_90 = 2
      expected_min_90 = 1
      expected_average_90 = 1.5
      expected_date_1 = Date.strptime('8/15/2015 16:45', '%m/%d/%Y').strftime("%B %d, %Y")
      expected_temp_1 = 93
      expected_date_2 = Date.strptime('8/16/2015 16:45', '%m/%d/%Y').strftime("%B %d, %Y")
      expected_temp_2 = 91

      expect(page).to have_content("Trip Stats for Days--Temperature Range")
      expect(page).to have_content("Most rides for 90 degree weather: #{expected_max_90}, on #{expected_date_1.to_s}, at #{expected_temp_1}")
      expect(page).to have_content("Least rides for 90 degree weather: #{expected_min_90}, on #{expected_date_2.to_s}, at #{expected_temp_2}")
    end
    it 'sees average, highest and lowest number of rides for precipitation for increments of 0.5 inches' do
      visit conditions_dashboard_path
      expected_maxes = 2
      expected_mins = 1

      expect(page).to have_content("Most rides: #{expected_maxes}")
      expect(page).to have_content("Least rides: #{expected_mins}")
      expect(page).to have_content("Trip Stats for Visibility between")
      expect(page).to have_content("Trip Stats for Wind Speeds between")
    end
  end
end
