ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "a3808caf7295b1b63ac8649c20a2d614"
  config.secret = "b8deee86bc506bf7f1f19b38ff1df8af"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/fulfilled', address: 'https://8d590f89.ngrok.io/webhooks/orders_fulfilled', format: 'json'},
    {topic: 'app/uninstalled', address: 'https://8d590f89.ngrok.io/webhooks/app_uninstalled', format: 'json'},
    {topic: 'products/delete', address: 'https://8d590f89.ngrok.io/webhooks/products_delete', format: 'json'},
    {topic: 'products/create', address: 'https://8d590f89.ngrok.io/webhooks/products_create', format: 'json'}
  ]
end
