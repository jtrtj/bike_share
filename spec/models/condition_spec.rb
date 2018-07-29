require 'rails_helper'

describe Condition, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:max_temperature_f)}
    it {should validate_presence_of(:mean_temperature_f)}
    it {should validate_presence_of(:min_temperature_f)}
    it {should validate_presence_of(:mean_humidity)}
    it {should validate_presence_of(:mean_visibility_miles)}
    it {should validate_presence_of(:mean_wind_speed_mph)}
    it {should validate_presence_of(:precipitation_inches)}
    it {should validate_presence_of(:zip_code)}
  end
  describe 'class methods' do
    before(:each) do
      @station_1 = create(:station, id: 25)
      @station_2 = create(:station, id: 56)
      @condition_1 = create(:condition, date: Date.strptime('8/15/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 93, precipitation_inches: 3.2, mean_wind_speed_mph: 23.0, mean_visibility_miles: 22.0)
      @condition_2 = create(:condition, date: Date.strptime('8/16/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 91, precipitation_inches: 3.1, mean_wind_speed_mph: 21.0, mean_visibility_miles: 21.0)
      @condition_3 = create(:condition, date: Date.strptime('8/17/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 87, precipitation_inches: 2.8, mean_wind_speed_mph: 19.0, mean_visibility_miles: 19.0)
      @condition_4 = create(:condition, date: Date.strptime('8/18/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 86, precipitation_inches: 2.6, mean_wind_speed_mph: 18.0, mean_visibility_miles: 18.0)
      @condition_5 = create(:condition, date: Date.strptime('8/19/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 74, precipitation_inches: 2.4, mean_wind_speed_mph: 14.0, mean_visibility_miles: 14.0)
      @condition_6 = create(:condition, date: Date.strptime('8/20/2015 16:45', '%m/%d/%Y'),
      max_temperature_f: 72, precipitation_inches: 2.3, mean_wind_speed_mph: 13.0, mean_visibility_miles: 13.0)
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
    it '#trip_numbers_by_temp_range' do
      expect(Condition.trip_numbers_by_temp_range.first.first[0]).to eq(@condition_4.date)
      expect(Condition.trip_numbers_by_temp_range.first.first[1]).to eq(@condition_4.max_temperature_f)
    end
    it 'trip_numbers_by_precipitation' do
      expect(Condition.trip_numbers_by_precipitation.first.first[0]).to eq(@condition_6.date)
      expect(Condition.trip_numbers_by_precipitation.first.first[1]).to eq(@condition_6.precipitation_inches)
    end
    it 'trip_numbers_by_wind_speed' do
      expect(Condition.trip_numbers_by_wind_speed.first.first[0]).to eq(@condition_1.date)
      expect(Condition.trip_numbers_by_wind_speed.first.first[1]).to eq(@condition_1.mean_wind_speed_mph)
    end
    it 'trip_numbers_by_visibility' do
      expect(Condition.trip_numbers_by_visibility.first.first[0]).to eq(@condition_1.date)
      expect(Condition.trip_numbers_by_visibility.first.first[1]).to eq(@condition_1.mean_visibility_miles)
    end
  end
end
