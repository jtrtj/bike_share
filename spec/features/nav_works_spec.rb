require 'rails_helper'

describe "nav system" do
   it 'goes to the root path when clicking the logo' do
    visit trips_path

    click_on "BikeShare"

    expect(current_path).to eq(root_path)
   end
end
