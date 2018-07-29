class OrdersController < ApplicationController
  before_action :order_auth?, only: [:show]

  def create
    user = current_user
    order = user.orders.create
    order.generate_order_items(session[:cart])
    redirect_to dashboard_path
    flash[:notice] = "Successfully submited your order totaling #{view_context.number_to_currency(order.total)}"
  end

  def show
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:set_status])
    redirect_to admin_dashboard_index_path(current_user)
    flash[:notice] = "Status has been updated"
  end

end
