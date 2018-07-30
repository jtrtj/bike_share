require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:status)}

    it { should validate_uniqueness_of(:title)}
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01)}
  end
end
