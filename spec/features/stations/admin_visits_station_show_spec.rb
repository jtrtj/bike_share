require 'rails_helper'

describe 'An admin' do
  context 'visiting station show' do
    it 'will see info for that station with an edit and delete button' do
      admin = create(:user, role: 1)
      station = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station)

      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)

      expect(page).to have_button('Edit')
      expect(page).to have_button('Delete')
    end
  end
end
