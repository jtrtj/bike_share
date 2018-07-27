require 'rails_helper'

describe 'an admin' do
  context 'visiting conditions new path' do
    it 'can create a new condition and view an accompanying flash message' do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_condition_path

      max = 9000
      mean = 8000
      min = 7000

      fill_in :condition_date, with: Time.now
      fill_in :condition_max_temperature_f, with: max
      fill_in :condition_mean_temperature_f, with: mean
      fill_in :condition_min_temperature_f, with: min
      fill_in :condition_mean_humidity, with: 400
      fill_in :condition_mean_visibility_miles, with: 467
      fill_in :condition_mean_wind_speed_mph, with: 888
      fill_in :condition_precipitation_inches, with: 87
      fill_in :condition_zip_code, with: 7777777
      click_on 'Create Condition'


      expect(current_path).to eq(condition_path(Condition.last))
      expect(page).to have_content(max)
      expect(page).to have_content(mean)
      expect(page).to have_content(min)
      expect(page).to have_content("Condition for #{Condition.last.date} was created!")
    end
    it 'cannot create a new condition with invalid parameters' do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_condition_path

      max = 9000
      mean = 8000
      min = 7000
      fill_in :condition_date, with: Date.today
      fill_in :condition_max_temperature_f, with: max
      fill_in :condition_mean_temperature_f, with: mean
      fill_in :condition_min_temperature_f, with: min
      fill_in :condition_mean_humidity, with: 400
      fill_in :condition_mean_visibility_miles, with: 467
      fill_in :condition_precipitation_inches, with: 87
      click_on 'Create Condition'

      expect(current_path).to eq(new_admin_condition_path)
      expect(page).to_not have_content(max)
      expect(page).to_not have_content(mean)
      expect(page).to_not have_content(min)
      expect(page).to have_content("Condition fields invalid")
    end
  end
end
