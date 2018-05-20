class ProductsDeleteJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      deleted_product = Product.find_by(product_id: webhook["id"])
      deleted_product.destroy
    end
  end
end
