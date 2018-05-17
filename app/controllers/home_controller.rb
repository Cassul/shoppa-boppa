class HomeController < ShopifyApp::AuthenticatedController
  include ActionController::Live
  include HomeHelper
  def index
    # ShopifyAPI::Webhook.new({:topic => "products/create", :address => " https://f560eaf4.ngrok.io/new_product", :format => "json"})
    @shop = Shop.find_by(shopify_domain: @shop_session.url)
    if Product.where(shop_id: @shop.id).count === 0
      @all_sales = ShopifyAPI::Order.find(:all)
      save_orders_in_database
    end
    @prod = Product.where(shop_id: @shop.id).order('sales DESC').first(10)
  end

  def create
    request.body.rewind
    data = request.body.read
    verified = verify_webhook(data, env["HTTP_X_SHOPIFY_HMAC_SHA256"])
    p "it works!"
    if verified
      new_product_in_database = Product.new
      new_product = request.body
      new_product_in_database.product_id = new_product.id
      new_product_in_database.title = new_product.title
      new_product_in_database.vendor = new_product.vendor
      new_product_in_database.sales = 1
      new_product_in_database.shop_id = @shop_session.url
      new_product_in_database.save
    end
  end

  def verify_webhook(data, hmac_header)
    secret = "b8deee86bc506bf7f1f19b38ff1df8af"
    calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', secret, data))
    ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, hmac_header)
  end

end
