FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    delivery_area_id { 1 }
    city { '東京都' }
    home_num { '1-1' }
    building_name { '東京ハイツ' }
    tel { '123-456-7891' }
  end
end
