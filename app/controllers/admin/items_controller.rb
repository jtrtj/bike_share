class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.order(:title)
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
    @item = Item.create(item_params)
    if @item.save
      redirect_to admin_bike_shop_path
      flash[:notice] = 'You created a new item'
    else
      flash[:notice] = 'Item cannot be created, please make sure to fill the form correctly'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :image, :status)
  end
end
