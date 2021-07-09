class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user

  validates :item_name, 
             presence: true

  validates :explain, 
             presence: true

  validates :category_id, 
             numericality: { other_than: 1 , message: "can't be blank"}, 
             presence: true

  validates :item_status_id, 
             numericality: { other_than: 1 , message: "can't be blank"},
             presence: true

  validates :delivery_charge_id, 
             numericality: { other_than: 1 , message: "can't be blank"},
             presence: true

  validates :delivery_area_id, 
             numericality: { other_than: 1 , message: "can't be blank"},
             presence: true

  validates :shipment_day_id, 
             numericality: { other_than: 1 , message: "can't be blank"},
             presence: true

  validates :cost, 
             presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_status, :delivery_charge, :delivery_area, :shipment_day

end
