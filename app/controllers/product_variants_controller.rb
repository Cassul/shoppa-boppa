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
    if params["variant_id"] && params["cost"]
      product_variant = ProductVariant.find_by(variant_id: params["variant_id"])
      product_variant.cost = params["cost"]
    end
      redirect_to "/product_variants"
  end

  def import
    begin
      ProductVariant.import(params[:file])
      redirect_to root_url, notice: "Products imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

end
