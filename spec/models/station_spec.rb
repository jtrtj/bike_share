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
  end
end
