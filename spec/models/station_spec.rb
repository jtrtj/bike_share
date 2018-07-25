require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end
  describe 'relationships' do
    it { should have_many(:statuses) }
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
      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)

      expect(station_1.most_frequent_origin).to eq(station_1)
    end
  end
end
