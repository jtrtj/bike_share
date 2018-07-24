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

      expected_result = 60

      expect(page).to have_content("Total count of stations : #{expected_result}")
    end

=begin
    As a registered user,
When I visit '/stations-dashboard',
I see the Total count of stations,
I see the Average bikes available per station (based on docks),
=end
