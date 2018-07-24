require 'rails_helper'

describe "An admin" do
  context "visits trip index" do
    it "clicks on delete next to a trip and it" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      click_on "Delete"

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(trip)
      expect(page).to have_content("Trip #{trip.id} was deleted.")
    end
  end
end


=begin
As an admin user,
When I visit the trips index,
And I click delete next to a trip,
I do not see the trip on the index.
I also see a flash message that I have deleted that trip.
=end