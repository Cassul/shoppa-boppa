class HomeController < ShopifyApp::AuthenticatedController
  include ActionController::Live
  include HomeHelper
  def index
    @shop = Shop.find_by(shopify_domain: @shop_session.url)
    if Product.where(shop_id: @shop.id).count === 0
      @all_sales = ShopifyAPI::Order.find(:all)
      save_orders_in_database
    end
    @prod = Product.where(shop_id: @shop.id).order('sales DESC').first(10)
  end
end
