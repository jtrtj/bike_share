require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end
  describe 'relationships' do
    it {should have_many(:statuses)}
    it {is_expected.to respond_to(:trips)}
  end

  describe 'class methods' do
    it 'calculate total count of stations' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      expected_result = 3

      expect(Station.total_count).to eq(expected_result)
    end
    it 'calculate average bike per station' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      expected_result = 20

      expect(Station.average_bike_per_station).to eq(expected_result)
    end
    it 'find most bike at a station' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      expected_result = 30
      expect(Station.most_bikes_at_station).to eq(expected_result)
    end
    it 'find station name with the most bikes' do
      user = create(:user)
      station_1 = create(:station, name: 'city hall', dock_count: 20)
      station_2 = create(:station, name: 'pier 44', dock_count: 30)
      station_3 = create(:station, name: 'airport', dock_count: 10)

      expect(Station.stations_name_most_bikes).to eq([station_2])
    end
    it 'find station with fewest bikes' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      expected_result = 10
      expect(Station.fewest_bikes_at_station).to eq(expected_result)
    end
    it 'find station name with the lewest bikes' do
      user = create(:user)
      station_1 = create(:station, name: 'city hall', dock_count: 20)
      station_2 = create(:station, name: 'pier 44', dock_count: 30)
      station_3 = create(:station, name: 'airport', dock_count: 10)

      expect(Station.stations_name_fewest_bikes).to eq([station_3])
    end
  end
end
