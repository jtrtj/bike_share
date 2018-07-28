require 'rails_helper'

describe 'an admin' do
  describe 'visiting admin dashboard' do
    before :each do
      @admin = create(:user, role: 1)
      @user = create(:user)
      @order_1 = create(:order, status: 'ordered', user_id: @user.id)
      @order_2 = create(:order, status: 'ordered', user_id: @user.id)
      @order_3 = create(:order, status: 'paid', user_id: @user.id)
      @order_4 = create(:order, status: 'paid', user_id: @user.id)
      @order_5 = create(:order, status: 'cancelled', user_id: @user.id)
      @order_6 = create(:order, status: 'completed', user_id: @user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'sees a list of all orders and a link for each order' do
      visit admin_dashboard_index_path

      expect(page).to have_content(@order_1.status)
      expect(page).to have_content(@order_2.status)
      expect(page).to have_link(@order_1.id)
      expect(page).to have_link(@order_2.id)
    end
    it 'see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")' do
      visit admin_dashboard_index_path

      expect(page).to have_content('Ordered : 2')
      expect(page).to have_content('Paid : 2')
      expect(page).to have_content('Cancelled : 1')
      expect(page).to have_content('Completed : 1')
    end

  end
end
