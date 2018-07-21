require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:user_name)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:user_name).case_sensitive}
  end
  describe 'relationships' do
  end 
end
