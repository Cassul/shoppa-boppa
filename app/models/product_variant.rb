class ProductVariant < ApplicationRecord
  belongs_to :shop
  belongs_to :product
  has_many :order_items, dependent: :destroy
  validates :product_id,
  presence: true
  validates :shop_id,
  presence: true
  require 'CSV'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product_hash = row.to_hash 
      product = ProductVariant.find_by(variant_id: product_hash["id"])
      if product
        product["cost"] = product_hash["cost"]
        product.save
      end 
    end 
  end 

end
