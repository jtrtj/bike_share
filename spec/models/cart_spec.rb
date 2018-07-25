require 'rails_helper'

describe Cart do
  before(:each) do
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

    @cart = Cart.new({
      "1" => 4,
      "2" => 8,
      "3" => 5
      })
  end
  it '#total_count' do
    expect(@cart.total_count).to eq(17)
  end
  it '#add_item(item_id)' do
    @cart.add_item(1)
    @cart.add_item(2)
    @cart.add_item(3)
    expect(@cart.contents).to eq({"1" => 5, "2" => 9, "3" => 6})
  end
  it '#quantity_by_item(item_id)' do
    @cart.add_item(1)
    @cart.add_item(2)
    @cart.add_item(3)

    expect(@cart.quantity_by_item(3)).to eq(6)
  end
  it '#items' do
    expect(@cart.items).to eq([@item_1, @item_2, @item_3])
  end
  it '#total_price_all_items' do
    expect(@cart.total_price_all_items).to eq(6800)
  end
end
