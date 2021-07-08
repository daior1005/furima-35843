class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
end
