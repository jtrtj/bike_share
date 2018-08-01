# BikeShare
#### BikeShare is a web app build with Rails

The app is seeded with data from the public bike share system in San Francisco. Since the data used in this project was collected, Bay Area bike share has become [Ford GoBike](https://www.fordgobike.com/).

Using [data] (https://www.kaggle.com/benhamner/sf-bay-area-bike-share#trip.csv) gathered about Trips, Weather Conditions and Stations, BikeShare makes complex queries to gather analysis such as:

* What station did the most rides originate from and for that station where was the most common destination?
* Or what is the average number of rides for days that have a max temperature in the 70s?

various other analyses are used to pull a vari

#### The app also includes a shop

Users can select Items from the shop and create orders after logging in.

```ruby
 def update
    if params[:todo] == 'remove'
      @cart.remove_item(params[:item_id])
      item = Item.find(params[:item_id])
      flash[:notice] = "You removed #{view_context.link_to item.title, item_path(item), class: 'has-text-warning'} from your cart."
    elsif params[:todo] == 'increase'
      @cart.add_item(params[:item_id])
    elsif params[:todo] == 'decrease'
      @cart.decrease_item(params[:item_id])
    end
    redirect_to cart_path
  end
```
  Once a user clicks checkout, the car is sent to the create Order action in the Orders controller

```ruby
  def create
    user = current_user
    order = user.orders.create
    order.generate_order_items(session[:cart])
    redirect_to dashboard_path
    flash[:notice] = "Successfully submited your order totaling #{view_context.number_to_currency(order.total)}"
  end
```
At the Order model level, the Order Items are created in the database.

```ruby
def generate_order_items(cart)
    cart.each do |item_id, quantity|
      order_items.create(item_id: item_id, quantity: quantity)
    end
  end
```

##### BikeShare is running Rails version 5.1.6 and a PostgreSQL DataBase.
##### It was built by
* [Claire Beauvais] (https://github.com/clairebvs)
* [Tristan Bambauer] (https://github.com/TristanB17)
* [John Roemer] (https://github.com/jtrtj)
* [Eliot Swank] (https://github.com/EMSwank)
