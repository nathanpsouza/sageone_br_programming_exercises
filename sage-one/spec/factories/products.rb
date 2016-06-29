FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    category { Faker::Commerce.department }
    external_code '42'
    description { Faker::Lorem.paragraph }
    barcode '1234567890'
    ncm '1234456'
    unit { ['un', 'kg'].sample }
    value { Faker::Commerce.price }
    quantity { [*1..10].sample }
  end
end
