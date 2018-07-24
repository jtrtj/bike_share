require 'rails_helper'

describe "An Admin" do
  context "visits admin trip edit" do
    it "fills in a form with all trip attributes" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      click_on "Edit"

      expect(current_path).to eq(edit_admin_trip_path(trip))

      fill_in :duration,	with: "123"
      fill_in :start_date,	with: trip.start_date 
      fill_in :start_date,	with: trip.start_station_name 
      fill_in :start_date,	with: trip.start_station_id 
      fill_in :start_date,	with: trip.end_date 
      fill_in :start_date,	with: trip.end_station_name 
      fill_in :start_date,	with: trip.end_station_id 
      fill_in :start_date,	with: trip.bike_id 
      fill_in :start_date,	with: trip.subscription_type
      fill_in :start_date,	with: trip.zip_code
      fill_in :start_date,	with: trip.station_id

      click_on "Update Trip"

      expect(current_path).to eq(admin_trip_path(trip))
      expect(page).to have_content("123")
    end
  end
end

=begin
As an admin user,
When I visit admin trip edit,
I fill in a form with all trip attributes,
When I click "Update Trip",
I am directed to that trip's show page,
I see the updated trip's information,
I also see a flash message that I have updated that trip.

** All Attributes must be present **
=end