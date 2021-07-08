class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user

  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_area_id, presence: true
  validates :shipment_day_id, presence: true
  validates :cost, presence: true


end
