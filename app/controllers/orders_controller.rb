class OrdersController < ApplicationController
  def create
    user = current_user
    order = user.orders.create
    order.generate_order_items(session[:cart])
    redirect_to dashboard_path
  end
end