require 'rails_helper'

describe "Admin user" do
  context "visits trips index page" do
    it "sees all attributes" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date.strftime('%b %d %Y'))
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_date.strftime('%b %d %Y'))
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
    it "sees a button next to each trip to edit that trip" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path

      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
    end

    it "Default user does not see buttons next to each trip to edit that trip" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_path

      expect(page).to_not have_button("Edit")
      expect(page).to_not have_button("Delete")
    end
  end
end
