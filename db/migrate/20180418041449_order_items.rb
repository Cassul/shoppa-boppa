class OrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.string :price
      t.string :total_discount
      t.references :shop, foreign_key: true
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.references :product_variant, foreign_key: true
      t.timestamps
    end
  end
end
