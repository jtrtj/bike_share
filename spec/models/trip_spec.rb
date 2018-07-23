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
  end
end
