require 'rails_helper'

describe "An admin user" do
  context "visits admin trip new" do
    it "fills out a for with all attributes, clicks 'Create Trip' and is redirected to the trip show page" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      click_on "Create Trip"

      expect(current_path).to eq(new_admin_trip_path)

      fill_in :trip_duration,	with: 120
      fill_in :trip_start_date,	with: Date.today 
      fill_in :trip_start_station_name,	with: "Station 1"
      fill_in :trip_start_station_id,	with: 5
      fill_in :trip_end_date,	with: Date.today
      fill_in :trip_end_station_name,	with: "Station 2"
      fill_in :trip_end_station_id,	with: 10
      fill_in :trip_bike_id, with: 15
      fill_in :trip_subscription_type,	with: "Subscriber"
      fill_in :trip_zip_code,	with: 91112

      click_on "Create Trip"

      expect(current_path).to eq(trip_path(Trip.last))
      expect(page).to have_content(120)
      expect(page).to have_content(Date.today)
      expect(page).to have_content("Station 1")
      expect(page).to have_content("5")
      expect(page).to have_content("Station 2")
      expect(page).to have_content(10)
      expect(page).to have_content(15)
      expect(page).to have_content("Subscriber")
      expect(page).to have_content(91112)
    end
  end
end

=begin
As an admin user,
When I visit admin trip new,
I fill in a form with all trip attributes,
When I click "Create Trip",
I am directed to that trip's show page.
I also see a flash message that I have created that trip.

** Zip Code is a user-provided field, and may not be present on all records. Otherwise, as with Stations, all attributes of a Trip need to be present to ensure data integrity **
=end