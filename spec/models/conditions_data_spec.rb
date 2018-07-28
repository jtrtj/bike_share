require 'rails_helper'

describe ConditionsData do
  context 'instance methods' do
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
    it '#most_rides_in_temp_range(range)' do
      data = ConditionsData.new(Condition.max_trip_numbers_by_temp_range)
      range = (90..99)
      expect(data.most_rides_in_temp_range(range)).to eq(2)
    end
  end
end
