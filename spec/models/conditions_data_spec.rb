require 'rails_helper'

describe ConditionsData do
  context 'instance methods' do
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
    it '#max_rides_by_temp_range(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_temp_range)
      range = (90)

      expect(data.most_rides_in_temp_range(range).keys[0]).to eq(2)
      expect(data.most_rides_in_temp_range(range).values[0][0]).to eq(Date.strptime('8/15/2015 16:45', '%m/%d/%Y'))
    end
    it '#min_rides_by_temp_range(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_temp_range)
      range = (90)

      expect(data.least_rides_in_temp_range(range).keys[0]).to eq(1)
      expect(data.least_rides_in_temp_range(range).values[0][0]).to eq(Date.strptime('8/16/2015 16:45', '%m/%d/%Y'))
    end
    it '#avg_rides_by_temp_range(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_temp_range)
      range = (90)

      expect(data.average_rides_in_temp_range(range)).to eq(1.5)
    end
    it '#all_rides_by_temp_range(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_temp_range)
      range = (70..99)

      expect(data.all_rides_by_temp_range(range)).to eq({90 => [{2 => [Date.strptime('8/15/2015 16:45', '%m/%d/%Y'), 93]},
                                                                            {1 => [Date.strptime('8/16/2015 16:45', '%m/%d/%Y'), 91]},
                                                                            1.5],
                                                                80 => [{2 => [Date.strptime('8/17/2015 16:45', '%m/%d/%Y'), 87]},
                                                                            {1 => [Date.strptime('8/18/2015 16:45', '%m/%d/%Y'), 86]},
                                                                            1.5],
                                                                70 => [{2 => [Date.strptime('8/19/2015 16:45', '%m/%d/%Y'), 74]},
                                                                             {1 => [Date.strptime('8/20/2015 16:45', '%m/%d/%Y'), 72]},
                                                                             1.5]
                                                                })
    end

    it '#max_rides_by_precipitation(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_precipitation)
      range = (3.0)
      expected_number = 2

      expect(data.most_rides_by_precipitation(range).keys[0]).to eq(expected_number)
      expect(data.most_rides_by_precipitation(range).values[0][0]).to eq(@condition_1.date)
    end
    it '#min_rides_by_precipitation(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_precipitation)
      range = (3.0)
      expected_number = 1

      expect(data.least_rides_by_precipitation(range).keys[0]).to eq(expected_number)
      expect(data.least_rides_by_precipitation(range).values[0][0]).to eq(Date.strptime('8/16/2015 16:45', '%m/%d/%Y'))
    end
    it '#avg_rides_by_precipitation(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_precipitation)
      range = (3.0)

      expect(data.average_rides_by_precipitation(range)).to eq(1.5)
    end
    it '#all_rides_by_pre(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_precipitation)
      range = (2.0..3.0)

      expect(data.all_rides_by_precipitation(range)).to eq({3.0 => [{2 => [@condition_1.date, 3.2]},
                                                                          {1 => [@condition_2.date, 3.1]},
                                                                          1.5],
                                                            2.5 => [{2 => [@condition_3.date, 2.8]},
                                                                          {1 => [@condition_4.date, 2.6]},
                                                                          1.5],
                                                            2.0 => [{2 => [@condition_5.date, 2.4]},
                                                                          {1 => [@condition_6.date, 2.3]},
                                                                          1.5]
                                                            })
    end

    it '#max_rides_by_wind_speed(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_wind_speed)
      range = (20.0)
      expected_number = 2

      expect(data.most_rides_by_wind_speed(range).keys[0]).to eq(expected_number)
      expect(data.most_rides_by_wind_speed(range).values[0][0]).to eq(@condition_1.date)
    end
    it '#min_rides_by_wind_speed(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_wind_speed)
      range = (20.0)
      expected_number = 1

      expect(data.least_rides_by_wind_speed(range).keys[0]).to eq(expected_number)
      expect(data.least_rides_by_wind_speed(range).values[0][0]).to eq(@condition_2.date)
    end
    it '#avg_rides_by_wind_speed(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_wind_speed)
      range = (20.0)

      expect(data.average_rides_by_wind_speed(range)).to eq(1.5)
    end
    it '#all_rides_by_wind_speed(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_wind_speed)
      range = (12.0..20.0)

      expect(data.all_rides_by_wind_speed(range)).to eq({20.0 => [{2 => [@condition_1.date, 23.0]},
                                                                          {1 => [@condition_2.date, 21.0]},
                                                                          1.5],
                                                            16.0 => [{2 => [@condition_3.date, 19.0]},
                                                                          {1 => [@condition_4.date, 18.0]},
                                                                          1.5],
                                                            12.0 => [{2 => [@condition_5.date, 14.0]},
                                                                          {1 => [@condition_6.date, 13.0]},
                                                                          1.5]
                                                            })
    end

    it '#max_rides_by_visibility(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_visibility)
      range = (20.0)
      expected_number = 2

      expect(data.most_rides_by_visibility(range).keys[0]).to eq(expected_number)
      expect(data.most_rides_by_visibility(range).values[0][0]).to eq(@condition_1.date)
    end
    it '#min_rides_by_visibility(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_visibility)
      range = (20.0)
      expected_number = 1

      expect(data.least_rides_by_visibility(range).keys[0]).to eq(expected_number)
      expect(data.least_rides_by_visibility(range).values[0][0]).to eq(@condition_2.date)
    end
    it '#avg_rides_by_visibility(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_visibility)
      range = (20.0)

      expect(data.average_rides_by_visibility(range)).to eq(1.5)
    end
    it '#all_rides_by_visibility(range)' do
      data = ConditionsData.new(Condition.trip_numbers_by_visibility)
      range = (12.0..20.0)

      expect(data.all_rides_by_visibility(range)).to eq({20.0 => [{2 => [@condition_1.date, 22.0]},
                                                                          {1 => [@condition_2.date, 21.0]},
                                                                          1.5],
                                                            16.0 => [{2 => [@condition_3.date, 18.0]},
                                                                          {1 => [@condition_4.date, 17.0]},
                                                                          1.5],
                                                            12.0 => [{2 => [@condition_5.date, 15.0]},
                                                                          {1 => [@condition_6.date, 12.0]},
                                                                          1.5]
                                                            })
    end
  end
end
