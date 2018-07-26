require 'rails_helper'

describe Order, type: :model do
  context 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:status)}
  end
  context 'relationships' do
    it {should have_many(:order_items)}
    it {should belong_to(:user)}
  end
end