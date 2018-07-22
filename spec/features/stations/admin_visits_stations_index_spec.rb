require 'rails_helper'

describe 'An admin' do
  context 'visiting stations index' do
    it 'will see all stations info with a delete and edit button for each station' do
      admin = create(:user, role: 1)
      station = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      within "#station-#{station.id}" do
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
        expect(page).to have_content(station.name)
        expect(page).to have_content(station.dock_count)
        expect(page).to have_content(station.city)
        expect(page).to have_content(station.installation_date)
      end
    end
  end
end

=begin
As an admin user,
When I visit the stations index,
I see everything a visitor can see,
I see a button next to each station to edit that station,
I also see a button next to each station to delete that station.
=end
