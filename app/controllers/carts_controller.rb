class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  def show
  end 

  def create
    item = Item.find(params[:item_id])
    @cart = Cart.new(session[:cart])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    quantity = @cart.contents[item.id.to_s]
    flash[:notice] = "You now have #{pluralize(quantity, item.title)} in your cart!"
    redirect_to bike_shop_path
  end

  def update
    if params[:todo] == 'remove'
      @cart.remove_item(params[:item_id])
    elsif params[:todo] == 'increase'
      @cart.add_item(params[:item_id])
    elsif params[:todo] == 'decrease'
      @cart.decrease_item(params[:item_id])
    end
    redirect_to cart_path
  end

end
