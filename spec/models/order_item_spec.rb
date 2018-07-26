require 'rails_helper'

describe OrderItem, type: :model do
  context 'validations' do
    it {should validate_presence_of(:order_id)}
    it {should validate_presence_of(:item_id)}
    it {should validate_presence_of(:quantity)}
  end
  context 'relationships' do
    it {should have_many(:items)}
    it {should belong_to(:order)}
  end
end