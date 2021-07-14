class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :shipment_day
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explain
    validates :cost, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :shipment_day_id
  end
  validates :cost, numericality: true
end
