ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "a3808caf7295b1b63ac8649c20a2d614"
  config.secret = "b8deee86bc506bf7f1f19b38ff1df8af"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'products/create', address: 'https://00e310f9.ngrok.io/webhooks/products_create', format: 'json'},
    {topic: 'orders/fulfilled', address: 'https://f560eaf4.ngrok.io/webhooks/order_fulfilled', format: 'json'}
  ]
end
