class OrdersController < ApplicationController
  def create
    user = current_user
    user.orders.create(order_params)
    redirect_to dashboard_path
  end

  private

  def order_params
    params.require(:cart_contents)
  end
end