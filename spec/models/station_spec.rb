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
    it '#station_with_most_rides_originating' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_station: station_1, end_station: station_1, duration: 120)
      trip2 = create(:trip, start_station: station_1, end_station: station_2, duration: 60)
      trip3 = create(:trip, start_station: station_1, end_station: station_2, duration: 30)

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
  end
end
