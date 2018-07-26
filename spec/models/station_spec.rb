require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end
  describe 'relationships' do
    it { should have_many(:trips_started_at) }
    it { should have_many(:trips_ended_at) }
  end

  describe 'class methods' do
    before :each do
      user = create(:user)
      @station_1 = create(:station, dock_count: 20, name: 'city hall', installation_date: DateTime.strptime('8/15/2016 16:45', '%m/%d/%Y'))
      @station_2 = create(:station, dock_count: 30, name: 'pier 44',  installation_date: DateTime.strptime('8/15/2018 16:45', '%m/%d/%Y'))
      @station_3 = create(:station, dock_count: 10, name: 'airport', installation_date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'))
    end
    it 'calculate total count of stations' do

      expected_result = 3

      expect(Station.total_count).to eq(expected_result)
    end
    it 'calculate average bike per station' do

      expected_result = 20

      expect(Station.average_bike_per_station).to eq(expected_result)
    end
    it 'find most bike at a station' do

      expected_result = 30

      expect(Station.most_bikes_at_station).to eq(expected_result)
    end
    it 'find station name with the most bikes' do

      expect(Station.stations_name_most_bikes).to eq([@station_2])
    end
    it 'find station with fewest bikes' do

      expected_result = 10

      expect(Station.fewest_bikes_at_station).to eq(expected_result)
    end
    it 'find station name with the lewest bikes' do

      expect(Station.stations_name_fewest_bikes).to eq([@station_3])
    end
    it 'find newest installation station' do

      expect(Station.newest_installation).to eq("#{@station_2.name}")
    end
    it 'find oldest installation station' do

      expect(Station.oldest_installation).to eq("#{@station_3.name}")
    end
    it '#trips_started_at' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip,start_station_id: station_2.id, end_station_id: station_1.id)

      expect(station_1.trips_started_at.length).to eq(2)
      expect(station_1.trips_ended_at.length).to eq(1)
    end
    it '#most_frequent_origin' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      station_3 = create(:station, name: 'moes')
      trip_1 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)
      trip_2 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)
      trip_3 = create(:trip, start_station_id: station_3.id, end_station_id: station_1.id)
      trip_4 = create(:trip, start_station_id: station_3.id, end_station_id: station_1.id)
      trip_5 = create(:trip, start_station_id: station_3.id, end_station_id: station_1.id)
      trip_6 = create(:trip, start_station_id: station_3.id, end_station_id: station_1.id)

      expect(station_1.most_frequent_origin).to eq(station_3)
    end

    it '#most_frequent_destination' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      station_3 = create(:station, name: 'moes')
      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_3.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_3.id)
      trip_3 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_4 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_5 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_6 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)

      expect(station_1.most_frequent_destination).to eq(station_2)
    end

    it '#most_popular_date' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      trip_1 = create(:trip, start_date: Date.today, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_date: Date.today, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip, start_date: Date.yesterday, start_station_id: station_1.id, end_station_id: station_2.id)

      expect(station_1.most_popular_date).to eq(Date.today)
    end

    it "#most_frequent_origin_zip_code" do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      trip_1 = create(:trip, zip_code: 80220, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, zip_code: 80220, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip, zip_code: 80030, start_station_id: station_1.id, end_station_id: station_2.id)

      expect(station_1.most_frequent_origin_zip_code).to eq(80220)
    end

    it "#most_frequent_origin_bike_id" do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')
      trip_1 = create(:trip, bike_id: 22, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, bike_id: 22, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip, bike_id: 11, start_station_id: station_1.id, end_station_id: station_2.id)

      expect(station_1.most_frequent_origin_bike_id).to eq(22)
    end
  end
end
