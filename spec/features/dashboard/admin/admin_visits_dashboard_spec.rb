require 'rails_helper'

describe 'An admin' do
  describe 'visiting the dashboard' do
    before :each do
      @admin = create(:user, role: 1)
      @item = Item.create(title: 'bike lights', description: 'wonderful led', price: 10, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png')
      @item2 = Item.create(title: 'wheels', description: 'circle', price: 90, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'sees link to view all items' do

      visit admin_dashboard_path

      expect(page).to have_link('All Items')
    end
  end
end
=begin
As an admin user,
When I visit "/admin/dashboard",
I see a link for viewing all accessories,
When I click that link,
My current path should be "/admin/bike-shop",
I see a table with all accessories (active and inactive)

Each accessory should have:

A thumbnail of the image
Description
Status
Ability to Edit accessory
Ability to Retire/Reactivate accessory
=end
