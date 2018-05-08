module HomeHelper
  def save_orders_in_database
    @shop = @shop
    @number_of_orders = 0
    @number_of_products = 0
    @number_of_product_variants = 0
    @sales_errors = 0
    @all_sales.each do |sale|
      if sale.cancelled_at === nil
        @order = Order.new
        @order.shop_id = @shop.id
        @order.order_id = sale.id
        @order.processed_at = sale.processed_at
        @order.currency = sale.currency
        @order.total_price = sale.total_price
        @order.total_price_usd = sale.total_price_usd
        @order.token = sale.token
        @order.total_tax = sale.total_tax
          if @order.save
            @number_of_orders += 1
            sale.line_items.each do |item|
              @order_item = OrderItem.new
              @product = Product.new
              @product_variant = ProductVariant.new
              if Product.find_by(product_id: item.product_id) != nil
                @product = Product.find_by(product_id: item.product_id)
                @order_item.product_id = @product.id
                @product_variant.product_id = @product.id
                new_sales = @product.sales + 1
                @product.update(sales: new_sales)
              else
                @product.shop_id = @shop.id
                @product.product_id = item.product_id
                @product.title = item.title
                @product.vendor = item.vendor
                @product.sales = 1
                @product.save
                @product_variant.product_id = @product.id
              end
              if ProductVariant.find_by(variant_id: item.variant_id)
                @product_variant = ProductVariant.find_by(variant_id: item.variant_id)
                new_sales = @product_variant.sales + 1
                @product_variant.update(sales: new_sales)
              else
                @product_variant.shop_id = @shop.id
                @product_variant.variant_id = item.variant_id
                @product_variant.price = ShopifyAPI::Variant.find(@product_variant.variant_id).price
                @product_variant.variant_title = item.variant_title
                @product_variant.sku = item.sku
                @product_variant.name = item.name
                @product_variant.cost = 0.0
                @product_variant.sales = 1
                @product_variant.save
              end
              @order_item.shop_id = @shop.id
              @order_item.order_id = @order.id
              @order_item.quantity = item.quantity
              @order_item.price = item.price
              @order_item.total_discount = item.total_discount
              @order_item.product_id = @product.id
              @order_item.product_variant_id = @product_variant.id
              @order_item.save
            end
          else @sales_errors += 1
          end
      end
    end
  end
end
