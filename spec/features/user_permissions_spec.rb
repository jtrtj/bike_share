require 'rails_helper'

describe 'a registered user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context "trying to view another user's private data" do
    it 'gets a 404' do
      user_2 = create(:user)
      order = user_2.orders.create
      
      visit order_path(order)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end