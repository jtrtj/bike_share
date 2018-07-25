require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:bike_id)}
    it {should validate_presence_of(:subscription_type)}
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:zip_code)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:end_date)}
    it {should validate_presence_of(:start_station_id)}
    it {should validate_presence_of(:start_station_name)}
    it {should validate_presence_of(:end_station_id)}
    it {should validate_presence_of(:end_station_name)}
  end
  describe 'relationships' do
    it {should belong_to(:end_station)}
    it {should belong_to(:start_station)}
  end

  describe 'class methods' do
    it 'find average duration of ride' do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      expected_result = 70

      expect(Trip.average_duration_trip).to eq(expected_result)
    end
    it 'find longest ride' do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      expected_result = trip
      expect(Trip.longest_ride).to eq(expected_result)
    end
    it 'find shortest ride' do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      expected_result = trip3
      expect(Trip.shortest_ride).to eq(expected_result)
    end

    it '#station_with_most_rides_originating' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_station: station_1, end_station: station_1, duration: 120)
      trip2 = create(:trip, start_station: station_1, end_station: station_2, duration: 60)
      trip3 = create(:trip, start_station: station_2, end_station: station_2, duration: 30)

      expect(Trip.station_with_most_rides_originating).to eq(station_1)
    end

    it '#station_with_most_rides_ending' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_station: station_1, end_station: station_1, duration: 120)
      trip2 = create(:trip, start_station: station_1, end_station: station_2, duration: 60)
      trip3 = create(:trip, start_station: station_1, end_station: station_2, duration: 30)

      expect(Trip.station_with_most_rides_ending).to eq(station_2)
    end

    it '#year_by_year_breakdown' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_date: DateTime.strptime('4/4/2016', '%m/%d/%Y'), start_station: station_1, end_station: station_2, duration: 120)
      trip2 = create(:trip, start_date: DateTime.strptime('4/5/2016', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 60)
      trip3 = create(:trip, start_date: DateTime.strptime('5/5/2016', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 30)
      trip4 = create(:trip, start_date: DateTime.strptime('5/6/2017', '%m/%d/%Y'), start_station: station_1, end_station: station_2, duration: 120)
      trip5 = create(:trip, start_date: DateTime.strptime('7/7/2017', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 60)
      trip6 = create(:trip, start_date: DateTime.strptime('7/8/2017', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 30)

      expect(Trip.year_by_year).to eq(Time.new(2016-01-01) => 3, Time.new(2017-01-01) => 3)
      # expect(Trip.month_by_month).to eq({'2016' => 3, '2017' => 3})
    end
  end
end
