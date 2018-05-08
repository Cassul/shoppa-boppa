class ProductVariantsController < ApplicationController
  include HomeHelper
  def index
    @prod = Product.where(shop_id: session.values[3]).paginate(:page => params[:page], :per_page => 10).order('sales DESC') 
  end

  def create
    if params["margin_all"]
      product_variants = ProductVariant.all
      product_variants.each do |v| 
        v.cost = (v.order_items.last.price.to_f * (100 - params['margin_all'].to_f) / 100).to_s
        v.save
      end
    end
    if params["cost"]
      product_variant = ProductVariant.find_by(variant_id: params["variant_id"])
      product_variant.cost = (product_variant.order_items.last.price.to_f * (100 - params["cost"].to_f) / 100).to_s
    end
      redirect_back fallback_location: root_path
  end
end
