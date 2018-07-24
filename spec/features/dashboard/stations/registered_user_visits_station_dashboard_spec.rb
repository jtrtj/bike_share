require 'rails_helper'

describe 'A registered user' do
  context 'visiting stations dashboard' do
    it 'sees the total count of stations' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_dashboard_path

      expected_result = 3

      expect(page).to have_content("Total count of stations : #{expected_result}")
    end
    it 'sees the Average bikes available per station based on docks' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      visit stations_dashboard_path

      expected_result = 20

      expect(page).to have_content("Average bikes available per station : #{expected_result}")
    end
    it 'sees the most bikes available at a station (based on docks) and the station(s) for it,' do
      user = create(:user)
      station_1 = create(:station, dock_count: 20)
      station_2 = create(:station, dock_count: 30)
      station_3 = create(:station, dock_count: 10)

      visit stations_dashboard_path

      expected_result = 30

      expect(page).to have_content("Most bikes available at a station : #{expected_result}")
    end
  end
end
