require 'rails_helper'

describe 'A registered user' do
  context 'visiting trips dashboard' do
    it 'sees the average duration of a ride' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, duration: 120)
      trip = create(:trip, duration: 60)
      trip = create(:trip, duration: 30)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_dashboard_path

      expected_result = 70

      expect(page).to have_content("Average duration of a ride : #{expected_result}")
    end
  end
end
