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
      expected_result_1 = (2016)
      expected_result_2 = (2017)

      expect(Trip.year_by_year.first[0].year).to eq(expected_result_1)
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
      expected_result = 4

      expect(Trip.month_by_month.first[0].month).to eq(4)
    end
    it '#most_ridden_bike' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip2 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip3 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      trip4 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip5 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip6 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      special_bike = 3
      rides = 4

      expect(Trip.most_ridden_bike).to eq(3)
      expect(Trip.most_bike_rides).to eq(4)
    end
    it '#least_ridden_bike' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip2 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip3 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      trip4 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip5 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip6 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      special_bike = 2
      rides = 2

      expect(Trip.least_ridden_bike).to eq(2)
      expect(Trip.least_bike_rides).to eq(2)
    end
    it '#subscription breakdown' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, subscription_type: "Admin Boi", start_station: station_1, end_station: station_2)
      trip2 = create(:trip, subscription_type: "Admin Boi", start_station: station_1, end_station: station_2)
      trip3 = create(:trip, subscription_type: "Admin Boi", start_station: station_1, end_station: station_2)
      trip4 = create(:trip, subscription_type: "Admin Boi", start_station: station_1, end_station: station_2)
      trip5 = create(:trip, subscription_type: "Slug Boi", start_station: station_1, end_station: station_2)
      trip6 = create(:trip, subscription_type: "Slug Boi", start_station: station_1, end_station: station_2)
      expected_result_3 = 4
      expected_result_4 = 2

      expect(Trip.subscription_type_by_count[0].subscription_type_count).to eq(2)
      expect(Trip.subscription_type_by_count[1].subscription_type_count).to eq(4)
    end
  end
end
