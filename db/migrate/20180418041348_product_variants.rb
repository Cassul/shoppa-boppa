class ProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.string :variant_id
      t.string :variant_title
      t.string :sku
      t.string :name
      t.string :cost
      t.integer :sales
      t.references :shop, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
