class OrdersController < ApplicationController
  def create
    user = current_user
    order = user.orders.create
    order.generate_order_items(session[:cart])
    redirect_to dashboard_path
    flash[:notice] = "Successfully submited your order totaling #{view_context.number_to_currency(order.total)}"
  end

  def show 
    @order = Order.find(params[:id])
  end
end
