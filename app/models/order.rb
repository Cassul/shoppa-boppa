class Order < ApplicationRecord
  belongs_to :shop
  has_many :order_items, dependent: :destroy
end
