require 'rails_helper'

describe 'A registered user' do
  context 'visiting stations dashboard' do
    before :each do
      user = create(:user)
      @station_1 = create(:station, dock_count: 20, name: 'city hall', installation_date: DateTime.strptime('8/15/2016 16:45', '%m/%d/%Y'))
      @station_2 = create(:station, dock_count: 30, name: 'pier 44',  installation_date: DateTime.strptime('8/15/2018 16:45', '%m/%d/%Y'))
      @station_3 = create(:station, dock_count: 10, name: 'airport', installation_date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'))

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it 'sees the total count of stations' do

      visit stations_dashboard_path

      expected_result = 3

      expect(page).to have_content("Total count of stations : #{expected_result}")
    end
    it 'sees the Average bikes available per station based on docks' do

      visit stations_dashboard_path

      expected_result = 20

      expect(page).to have_content("Average bikes available per station : #{expected_result}")
    end
    it 'sees the most bikes available at a station (based on docks) and the station(s) for it,' do

      visit stations_dashboard_path

      expect(page).to have_content("Most bikes available at a station : #{@station_2.dock_count}")
      expect(page).to have_content(@station_2.name)
    end
    it 'sees the fewest bikes available at a station (based on docks) and the name of the stations' do

      visit stations_dashboard_path

      expect(page).to have_content("Fewest bikes available at a station : #{@station_3.dock_count}")
      expect(page).to have_content(@station_3.name)
    end
    it 'sees the most recently installed station and the oldest station' do

      visit stations_dashboard_path

      expect(page).to have_content("Newest station : #{@station_2.name}")
      expect(page).to have_content("Oldest station : #{@station_3.name}")
    end
  end
end
