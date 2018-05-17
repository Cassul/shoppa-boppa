class ProductsCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      new_product_in_database = Product.new
      new_product = webhook
      new_product_in_database.product_id = new_product["id"]
      new_product_in_database.title = new_product["title"]
      new_product_in_database.vendor = new_product["vendor"]
      new_product_in_database.sales = 1
      new_product_in_database.shop_id = shop.id
      new_product_in_database.save
    end
  end
end
