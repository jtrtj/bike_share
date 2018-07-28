class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?, :order_auth?

  before_action :build_cart

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def build_cart
    @cart = Cart.new(session[:cart])
  end

  def order_auth?
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id || current_admin?
      render :show
    else
      render file: 'public/404.html'
    end
  end

end
