require 'rails_helper'

describe 'a visitor' do
  context 'trying to see user data' do
    it "cannot view another user's private data" do
      user = create(:user)
      order = user.orders.create
      
      visit user_path(user)
      expect(page).to have_content("The page you were looking for doesn't exist.")
      
      visit order_path(order)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end