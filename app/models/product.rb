class Product < ApplicationRecord
  belongs_to :shop
  has_many :product_variants, dependent: :destroy
  has_many :order_items, dependent: :destroy
  validates :shop_id,
  presence: true
end
