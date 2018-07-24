require 'rails_helper'


describe "Admin user" do
  context "visits trips show page" do
    it "sees everything a visitor can see" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration / 60)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station_name)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station_name)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
    it 'sees buttons to delete and edit this trip' do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trip_path(trip)

      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
    end

    it "users don't see buttons to edit and delete" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trip_path(trip)

      expect(page).to_not have_button("Edit")
      expect(page).to_not have_button("Delete")
    end
  end
end