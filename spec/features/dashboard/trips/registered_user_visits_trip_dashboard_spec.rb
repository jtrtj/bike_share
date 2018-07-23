require 'rails_helper'

describe 'A registered user' do
  context 'visiting trips dashboard' do
    it 'sees the average duration of a ride' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_dashboard_path

      expected_result = 70

      expect(page).to have_content("Average duration of a ride : #{expected_result}")
    end

    it 'sees the longest duration trip' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      visit trips_dashboard_path

      expected_result = trip

      expect(page).to have_content("Longest ride : #{expected_result}")

    end

    it 'sees the shortest duration trip' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      visit trips_dashboard_path

      expected_result = trip3
      expect(page).to have_content("Shortest ride : #{}")
    end
  end
end
