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

  def remove_item
    @cart.remove_item(params[:item_id])
  end

end
