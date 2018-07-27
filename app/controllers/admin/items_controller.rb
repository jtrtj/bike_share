class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "Item has been updated."
      redirect_to admin_bike_shop_path
    else
      flash[:notice] = "Item has not been updated."
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def create
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :image, :status)
  end
end
