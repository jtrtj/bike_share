require 'rails_helper'
=begin
When I visit '/conditions-dashboard',
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
=end

describe 'A registered user' do
  context 'visiting dashboard' do
    before :each do
      @station_1 = create(:station, id: 25)
      @station_2 = create(:station, id: 56)
      @condition_1 = create(:condition, date: Date.strptime('8/15/2015 16:45', '%m/%d/%Y'), max_temperature_f: 93)
      @condition_2 = create(:condition, date: Date.strptime('8/16/2015 16:45', '%m/%d/%Y'), max_temperature_f: 91)
      @condition_3 = create(:condition, date: Date.strptime('8/17/2015 16:45', '%m/%d/%Y'), max_temperature_f: 87)
      @condition_4 = create(:condition, date: Date.strptime('8/18/2015 16:45', '%m/%d/%Y'), max_temperature_f: 86)
      @condition_5 = create(:condition, date: Date.strptime('8/19/2015 16:45', '%m/%d/%Y'), max_temperature_f: 74)
      @condition_6 = create(:condition, date: Date.strptime('8/20/2015 16:45', '%m/%d/%Y'), max_temperature_f: 72)
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
      expected_date_1 = Date.strptime('8/15/2015 16:45', '%m/%d/%Y')
      expected_temp_1 = 93
      expected_date_2 = Date.strptime('8/16/2015 16:45', '%m/%d/%Y')
      expected_temp_2 = 91

      expect(page).to have_content("Total Rides for Days in the 90s")
      expect(page).to have_content("Most rides for 90 degree weather: #{expected_number_1}, on #{expected_date_1.to_s}, at #{expected_temp_1}")
      expect(page).to have_content("Least rides for 90 degree weather: #{expected_number_2}, on #{expected_date_2.to_s}, at #{expected_temp_2}")
    end
  end
end
