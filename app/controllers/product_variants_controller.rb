class ProductVariantsController < ApplicationController
  include HomeHelper
  def index
    @prod = Product.where(shop_id: session.values[3]).paginate(:page => params[:page], :per_page => 10).order('sales DESC') 
  end
end
