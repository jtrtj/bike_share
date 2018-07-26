require 'rails_helper'

describe 'an admin' do
  context 'visiting conditions index' do
    it 'will see all conditions and their info with an edit and delete button for each' do
      admin = create(:user, role: 1)

      condition_1 = create(:condition)
      condition_2 = create(:condition)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit conditions_path

      within "#condition-#{condition_1.id}" do
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
      end

      within "#condition-#{condition_2.id}" do
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
      end

      expect(page).to have_content(condition_1.date)
      expect(page).to have_content(condition_1.max_temperature_f)
      expect(page).to have_content(condition_1.mean_temperature_f)
      expect(page).to have_content(condition_1.min_temperature_f)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility_miles)
      expect(page).to have_content(condition_1.mean_wind_speed_mph)
      expect(page).to have_content(condition_1.precipitation_inches)

      expect(page).to have_content(condition_2.date)
      expect(page).to have_content(condition_2.max_temperature_f)
      expect(page).to have_content(condition_2.mean_temperature_f)
      expect(page).to have_content(condition_2.min_temperature_f)
      expect(page).to have_content(condition_2.mean_humidity)
      expect(page).to have_content(condition_2.mean_visibility_miles)
      expect(page).to have_content(condition_2.mean_wind_speed_mph)
      expect(page).to have_content(condition_2.precipitation_inches)
    end
  end
end
