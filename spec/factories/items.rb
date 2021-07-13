FactoryBot.define do
  factory :item do
    item_name { 'hoge' }
    explain             { Faker::Lorem.sentence }
    shipment_day_id     { 1 }
    category_id { 1 }
    item_status_id { 13 }
    delivery_charge_id { 1 }
    delivery_area_id { 1 }
    cost { '9999' }

    # アソシエーション
    association :user
    # category

    # 1枚の画像をアップロードする
    trait :image do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.images.attach(io: f, filename: 'Unknown.jpeg', content_type: 'image/jpeg')
        end
      end
    end

    # 11枚の画像をアップロードする
    trait :images do
      after(:build) do |item|
        11.times do
          File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
            item.images.attach(io: f, filename: 'Unknown.jpeg', content_type: 'image/jpeg')
          end
        end
      end
    end
  end
end
