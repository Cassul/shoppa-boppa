class OrderItem < ApplicationRecord
  belongs_to :shop
  belongs_to :order
  belongs_to :product
  belongs_to :product_variant
  validates :shop_id,
  presence: true
end
