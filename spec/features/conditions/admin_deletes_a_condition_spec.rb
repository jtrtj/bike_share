require 'rails_helper'

describe 'an admin' do
  context 'visiting conditions index' do
    it 'can delete a condition and view an accompanying flash message' do
      admin = create(:user, role: 1)

      condition_1 = create(:condition, max_temperature_f: 500)
      condition_2 = create(:condition, max_temperature_f: 400)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit conditions_path

      within "#condition-#{condition_1.id}" do
        click_on 'Delete'
      end

      expect(current_path).to eq(conditions_path)
      expect(page).to_not have_content(condition_1.max_temperature_f)
      expect(page).to have_content("Condition for #{condition_1.date} was deleted!")
    end
  end
end
