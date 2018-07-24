require 'rails_helper'

describe Cart do
  before(:each) do
    @cart = Cart.new({
      "2" => 4,
      "6" => 8
      })
  end
  it '#total_count' do
    expect(@cart.total_count).to eq(12)
  end
  it '#add_item' do
    @cart.add_item(2)
    @cart.add_item(6)
    @cart.add_item(7)
    expect(@cart.contents).to eq({"2" => 5, "6" => 9, "7" => 1})
  end
end
