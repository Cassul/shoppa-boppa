class AddPriceToProductVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :product_variants, :price, :string
  end
end
