class ProductVariant < ApplicationRecord
  belongs_to :shop
  belongs_to :product
  has_many :order_items, dependent: :destroy
  validates :product_id,
  presence: true
  validates :shop_id,
  presence: true
end
