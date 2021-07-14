FactoryBot.define do
  factory :item do
    item_name { 'hoge' }
    explain             { Faker::Lorem.sentence }
    shipment_day_id     { 2 }
    category_id { 2 }
    item_status_id { 13 }
    delivery_charge_id { 2 }
    delivery_area_id { 2 }
    cost { 9999 }

    # アソシエーション
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
