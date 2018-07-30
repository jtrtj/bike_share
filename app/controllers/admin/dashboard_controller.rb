class Admin::DashboardController < Admin::BaseController

  def index
    @user = current_user
    @orders_constant = Order.all
    if params[:filter]
      status = params[:filter]
      @orders = Order.where(status: status)
    else
      @orders = Order.all
    end
  end
end
