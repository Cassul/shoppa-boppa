class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :products, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
