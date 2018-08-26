# BikeShare
#### BikeShare is a web app build with Rails

The app is seeded with data from the public bike share system in San Francisco. Since the data used in this project was collected, Bay Area bike share has become [Ford GoBike](https://www.fordgobike.com/).

Using [data] (https://www.kaggle.com/benhamner/sf-bay-area-bike-share#trip.csv) gathered about Trips, Weather Conditions and Stations, BikeShare makes complex queries to gather analysis such as:

* What station did the most rides originate from and for that station where was the most common destination?
* Or what is the average number of rides for days that have a max temperature in the 70s?

various other analyses are used to manipulate data sets and return results based on intermediate activerecord and SQL queries,
which are primarily used in the 'dashboard' file of each dataset (trips, stations and conditions).


#### The app also includes a shop

* Visitors can view stations index and show, trips index and show, accessories index and show, and they are able to login, create a new account, or add items to a cart before logging in. 
* Users can select Items from the shop and create orders after logging in.
* Logged in users can view and edit their profile, checkout their cart, and view additional analytics data.
* Admin users can be created from the command line. They can create, edit, and delete stations, trips, and accessories.

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
    flash[:notice] = "Successfully submitted your order totaling #{view_context.number_to_currency(order.total)}"
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

This command enables one to submit the items stored in their cart as an order, which can then be marked as
'ordered,' 'paid,' and 'completed.' An admin can also choose to cancel an order. Information about the
order will be displayed according to the status set by the admin user.

##### BikeShare is running Rails version 5.1.6 and a PostgreSQL DataBase.
##### It was built by
* [Claire Beauvais] (https://github.com/clairebvs)
* [Tristan Bambauer] (https://github.com/TristanB17)
* [John Roemer] (https://github.com/jtrtj)
* [Eliot Swank] (https://github.com/EMSwank)
# bike_share
# bike_share
# bike_share
# bike_share
# bike_share
