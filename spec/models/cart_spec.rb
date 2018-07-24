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
end
