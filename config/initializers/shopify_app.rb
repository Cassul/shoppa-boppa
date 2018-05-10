ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "a3808caf7295b1b63ac8649c20a2d614"
  config.secret = "b8deee86bc506bf7f1f19b38ff1df8af"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/fulfilled', address: 'https://7fca1f39.ngrok.io/orders/fulfilled', format: 'json'}
  ]
end
