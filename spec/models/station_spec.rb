require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end
  describe 'relationships' do
    it {should have_many(:statuses)}
    it { should have_many(:trips_started_at) } 
    it { should have_many(:trips_ended_at) } 
  end
end
