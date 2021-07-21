class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :city, :home_num, :building_name, :tel, :orders_id, :item_id, :token, :user_id

  with_options presence: true do
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :home_num
    validates :tel, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid.' }
    validates :user_id
    # validates :token
  end
  # 1以外の整数を許可する
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(post_code: post_code, delivery_area_id: delivery_area_id, city: city, home_num: home_num,
                    building_name: building_name, tel: tel, order_id: order.id)
  end
end
