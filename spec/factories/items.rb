FactoryBot.define do
  factory :items do
    sequence(:title) { |n| "item-#{n}"}
    description 'An item'
    image 'https://orig00.deviantart.net/1a96/f/2016/022/7/e/random_items_i_drew_for_marapets_by_zhamae-d9ovp9i.png'
    price 100
    retired? false
  end
end